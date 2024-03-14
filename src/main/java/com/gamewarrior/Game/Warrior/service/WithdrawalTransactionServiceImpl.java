package com.gamewarrior.Game.Warrior.service;

import jakarta.servlet.http.HttpSession;
import okhttp3.*;

import org.aspectj.apache.bcel.util.ClassPath;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gamewarrior.Game.Warrior.dao.TransactionRepo;
import com.gamewarrior.Game.Warrior.exception.TransactionException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.BankingTransaction;
import com.gamewarrior.Game.Warrior.model.User;

import io.github.classgraph.Resource;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

@Service
public class WithdrawalTransactionServiceImpl implements WithdrawalTransactionService {
    @Autowired
    private TransactionRepo transactionRepo;
    @Autowired
    private UserService userService;
    
    private final String KEYX_ID;
    private final String SECRETX_KEY;
    private final String ACCOUNT_ID;
    
    {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("application");

        KEYX_ID =resourceBundle.getString("transaction.key_id");
        SECRETX_KEY = resourceBundle.getString("transaction.key_secret");
        ACCOUNT_ID = resourceBundle.getString("transaction.accountId");
    }
    
    @Override
    public List<BankingTransaction> fetchTransactionHistory(HttpSession session)  throws TransactionException, UserException{
        Integer userId = (Integer) session.getAttribute("userId");
        List<BankingTransaction> transactions= transactionRepo.findByUserId(userId);
        
        return transactions;
    }

    @Override
    public BankingTransaction saveTransaction(BankingTransaction transactionDetail)  throws TransactionException, UserException{
        return transactionRepo.save(transactionDetail);
    }

	@Override
	public BankingTransaction moneyTransfer(BankingTransaction transaction) throws TransactionException, UserException, IOException {
		User user = userService.fetchProfile(transaction.getUserId());

        String mobile = transaction.getMobile();
        String ifsc = transaction.getIfsc();
        String accountHolder = transaction.getAccountHolderName();
        String accountNumber = transaction.getAccountNumber();
        double amount = transaction.getAmount();

        OkHttpClient client = new OkHttpClient().newBuilder().build();
        MediaType mediaType = MediaType.parse("application/json");

        Map<String, Object> requestBodyMap = new HashMap<>();

        requestBodyMap.put("name", user.getFirstName()+" "+user.getLastName());
        requestBodyMap.put("email", user.getEmail());
        requestBodyMap.put("contact", mobile);
        requestBodyMap.put("type", "customer");

        ObjectMapper objectMapperContactRegistration = new ObjectMapper();
        String contactRegistrationRequestBodyJson = objectMapperContactRegistration.
                writeValueAsString(requestBodyMap);

        RequestBody contactRegistrationBody = RequestBody.create(mediaType, contactRegistrationRequestBodyJson);
        
        Request contactRegistrationRequest = new Request.Builder()
                .url("https://api.razorpay.com/v1/contacts")
                .method("POST", contactRegistrationBody)
                .addHeader("Content-Type", "application/json")
                .addHeader("Authorization", getRazorpayAuthorizationHeader())
                .build();

        Response contactRegistrationResponse = client.newCall(contactRegistrationRequest).execute();
        String contactRegistrationResponseBody = contactRegistrationResponse.body().string();

        ObjectMapper objectMapperContactRegistrationResponse = new ObjectMapper();
        JsonNode jsonNode = objectMapperContactRegistrationResponse.
                readTree(contactRegistrationResponseBody);
        
        transaction.setContactId(jsonNode.get("id").asText());

        requestBodyMap.clear();
        requestBodyMap.put("contact_id", transaction.getContactId());
        requestBodyMap.put("account_type", "bank_account");

        Map<String, Object> bankAccountMap =  new HashMap<>();

        bankAccountMap.put("name", accountHolder);
        bankAccountMap.put("ifsc", ifsc);
        bankAccountMap.put("account_number", accountNumber);
        requestBodyMap.put("bank_account", bankAccountMap);
        
        ObjectMapper accountRegistrationObjectMapper = new ObjectMapper();
        String accountRegistrationRequestBodyJson = accountRegistrationObjectMapper.
                writeValueAsString(requestBodyMap);

		RequestBody accountRegistrationBody = RequestBody.create(mediaType,
                accountRegistrationRequestBodyJson);
        Request accountRegistrationRequest = new Request.Builder()
                .url("https://api.razorpay.com/v1/fund_accounts")
                .method("POST", accountRegistrationBody)
                .addHeader("Content-Type", "application/json")
                .addHeader("Authorization", getRazorpayAuthorizationHeader())
                .build();
        Response accountRegistrationResponse = client.newCall(accountRegistrationRequest).execute();
        String accountRegistrationResponseBody = accountRegistrationResponse.body().string();
        System.out.println(accountRegistrationResponseBody);

        requestBodyMap.clear();
        requestBodyMap.put("account_number", ACCOUNT_ID);

        ObjectMapper objectMapperFundAccountResponse = new ObjectMapper();
        JsonNode jsonNodeFundAccount= objectMapperFundAccountResponse.
                readTree(accountRegistrationResponseBody);
        
        transaction.setFundAccountId(jsonNodeFundAccount.get("id").asText());

        requestBodyMap.put("fund_account_id", transaction.getFundAccountId());
        requestBodyMap.put("amount", amount*100);
        requestBodyMap.put("currency", "INR");
        requestBodyMap.put("mode", "IMPS");
        requestBodyMap.put("purpose", "payout");

        ObjectMapper objectMapperPayout = new ObjectMapper();
        String payoutRequestBodyJson= objectMapperPayout.writeValueAsString(requestBodyMap);

        RequestBody payoutBody = RequestBody.create(mediaType, payoutRequestBodyJson);
        Request payoutRequest = new Request.Builder()
                .url("https://api.razorpay.com/v1/payouts")
                .method("POST", payoutBody)
                .addHeader("Content-Type", "application/json")
                .addHeader("Authorization", getRazorpayAuthorizationHeader())
                .build();

        Response payoutResponse = client.newCall(payoutRequest).execute();
        String payoutResponseBody= payoutResponse.body().string();

        System.out.println(payoutResponseBody);

        if (payoutResponse.isSuccessful()){
            ObjectMapper payoutObjectMapper = new ObjectMapper();
            JsonNode jsonNodeTransaction= payoutObjectMapper.readTree(payoutResponseBody);
            
            transaction.setTransactionId(jsonNodeTransaction.get("id").asText());
            
            return transaction;
        }
        else{
            System.out.println("failed");
            throw new TransactionException("BankingTransaction failed");
        }
		
	}
	
    private String getRazorpayAuthorizationHeader() {
        String authString = KEYX_ID + ":" + SECRETX_KEY;
        String base64Auth = Base64.getEncoder().encodeToString(authString.getBytes());
        return "Basic " + base64Auth;
    }

	@Override
	public String uploadFile(MultipartFile file, Integer upiId, Integer userId) throws IOException {
		String uploadDir = new ClassPathResource("static").getFile().getAbsolutePath();
		
		uploadDir = createTheFolder(uploadDir+"\\deposit\\"+userId);
		String uniqueFilename = generateUniqueFilename(file.getOriginalFilename());
		
		Files.copy(file.getInputStream(), Paths.get(uploadDir+File.separator+uniqueFilename), StandardCopyOption.REPLACE_EXISTING);
		
		return uniqueFilename;
	}
	
	private String createTheFolder(String location) {
		File file= new File(location);
		
		System.out.println(file.mkdirs());
		
		return location;
	}
	
	private String generateUniqueFilename(String originalFilename) {
        // Get current date and time
        LocalDateTime now = LocalDateTime.now();
        
        // Format the date and time
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
        String formattedDateTime = now.format(formatter);
        
        // Get file extension
        String extension = "";
        int lastIndex = originalFilename.lastIndexOf('.');
        if (lastIndex >= 0) {
            extension = originalFilename.substring(lastIndex);
        }
        
        // Concatenate formatted date/time with a unique identifier
        String uniqueFilename = formattedDateTime + "_" + generateRandomString(6) + extension;
        return uniqueFilename;
    }

    private String generateRandomString(int length) {
        // Generate a random string (you can replace this with any other logic)
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int index = (int) (Math.random() * chars.length());
            sb.append(chars.charAt(index));
        }
        return sb.toString();
    }
}
