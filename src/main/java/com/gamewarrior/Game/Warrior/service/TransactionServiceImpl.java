package com.gamewarrior.Game.Warrior.service;

import jakarta.servlet.http.HttpSession;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gamewarrior.Game.Warrior.dao.TransactionRepo;
import com.gamewarrior.Game.Warrior.exception.TransactionException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.Transaction;
import com.gamewarrior.Game.Warrior.model.User;

import java.io.IOException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

@Service
public class TransactionServiceImpl implements TransactionService {
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
    public List<Transaction> fetchTransactionHistory(HttpSession session)  throws TransactionException, UserException{
        Integer userId = (Integer) session.getAttribute("userId");

        if(userId==null){
            throw new UserException("User is logged-out!");
        }
        List<Transaction> transactions= transactionRepo.findByUserId(userId);

        if(transactions.isEmpty()){
            throw new TransactionException("Transaction not found!");
        }
        return transactions;
    }

    @Override
    public Transaction saveTransaction(Transaction transactionDetail)  throws TransactionException, UserException{
        return transactionRepo.save(transactionDetail);
    }

	@Override
	public Transaction moneyTransfer(Transaction transaction) throws TransactionException, UserException, IOException {
		User user = userService.fetchProfile(transaction.getUserId());

        String mobile = transaction.getMobile();
        String ifsc = transaction.getIfsc();
        String accountHolder = transaction.getAccountHolderName();
        String accountNumber = transaction.getAccountNumber();
        int amount = transaction.getAmount();

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
            throw new TransactionException("Transaction failed");
        }
		
	}
	
    private String getRazorpayAuthorizationHeader() {
        String authString = KEYX_ID + ":" + SECRETX_KEY;
        String base64Auth = Base64.getEncoder().encodeToString(authString.getBytes());
        return "Basic " + base64Auth;
    }
}
