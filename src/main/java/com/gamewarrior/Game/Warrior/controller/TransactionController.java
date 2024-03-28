package com.gamewarrior.Game.Warrior.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.gamewarrior.Game.Warrior.dto.Status;
import com.gamewarrior.Game.Warrior.exception.TransactionException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.exception.WalletException;
import com.gamewarrior.Game.Warrior.model.DepositRequest;
import com.gamewarrior.Game.Warrior.model.Notification;
import com.gamewarrior.Game.Warrior.model.BankingTransaction;
import com.gamewarrior.Game.Warrior.model.UpiDetail;
import com.gamewarrior.Game.Warrior.model.User;
import com.gamewarrior.Game.Warrior.model.Wallet;
import com.gamewarrior.Game.Warrior.model.WithdrawRequest;
import com.gamewarrior.Game.Warrior.service.DepositRequestService;
import com.gamewarrior.Game.Warrior.service.EmailService;
import com.gamewarrior.Game.Warrior.service.NotificationService;
import com.gamewarrior.Game.Warrior.service.WithdrawalTransactionService;
import com.gamewarrior.Game.Warrior.service.UpiDetailService;
import com.gamewarrior.Game.Warrior.service.UserService;
import com.gamewarrior.Game.Warrior.service.WalletService;
import com.gamewarrior.Game.Warrior.service.WithdrawRequestService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class TransactionController {
	@Autowired
	private UpiDetailService upiDetailService;
	@Autowired
    private WithdrawalTransactionService transactionService;
	@Autowired
	private UserService userService;
	@Autowired 
	private WalletService walletService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private DepositRequestService depositRequestService;
	@Autowired
	private WithdrawRequestService withdrawRequestService;
	@Autowired
	private NotificationService notificationService;
	@Autowired
	private HttpServletRequest urlRequest;
	
	@GetMapping("/fetchUpiDetails")
	public void fetchUpiDetailHandler(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<UpiDetail> upiDetails = upiDetailService.fetchAllUpiDetails();
		HttpSession session = request.getSession();
		
		session.setAttribute("fetchUpiDetails", "fetchUpiDetails");
		
		if(upiDetails.isEmpty()) {
			session.setAttribute("errorMessage", "Upi/Account Detail(s) not available! Please contact to Admin.");
		}
		else {
			session.setAttribute("upiDetails", upiDetails);
		}
		response.sendRedirect("deposit");
	}
	
    @PostMapping("/transaction")
    public void moneyWithdrawalHandler(
    		@RequestParam String mobile, @RequestParam String accountNumber, @RequestParam String ifsc, @RequestParam String accountHolderName,
    		@RequestParam Double amount, HttpServletRequest request, HttpServletResponse response) throws IOException, TransactionException, UserException, WalletException{
    	HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        BankingTransaction bankingTransaction = new BankingTransaction();
        
        bankingTransaction.setMobile(mobile);
        bankingTransaction.setAccountNumber(accountNumber);
        bankingTransaction.setIfsc(ifsc);
        bankingTransaction.setAccountHolderName(accountHolderName);
        bankingTransaction.setAmount(amount);
        bankingTransaction.setUserId(userId);

        if(userId==null){
            session.setAttribute("errorMessage", "Invalid User!! Please login.");
            
            response.sendRedirect("login");
        }
        else {
        	if(walletService.withdrawableWalletAmountDeduction(amount, userId, session, "Direct money transfer to Bank Account")) {
	        	try {
	        		transactionService.moneyTransfer(bankingTransaction);
		        	
		        	transactionService.saveTransaction(bankingTransaction);
	
		        	request.setAttribute("transaction", bankingTransaction);
		        	session.setAttribute("message", "BankingTransaction Successfull");
		        	response.sendRedirect("withdraw");
	        	}
	        	catch(Exception exception) {
	        		walletService.withdrawableWalletAmountAddition(amount, userId, session, "Refund of money transfer");
	        	}
        	}
        	else {
        		session.setAttribute("errorMessage", "Insufficient amount in withdrawable wallet");
        		response.sendRedirect("withdraw");
        	}
        }
    }
    
    @GetMapping("/fetchTransactions")
    public void getTransactionHistoryHandler(HttpServletRequest request, HttpServletResponse response)
            throws UserException, TransactionException, IOException {
    	HttpSession session = request.getSession();
    	Integer userId = (Integer) session.getAttribute("userId");
    	
    	if(userId==null) {
    		session.setAttribute("errorMessage", "Invalid user!! Please login");
    		
    		response.sendRedirect("login");
    	}
    	else {
    		session.setAttribute("passbookDetail", "passbookDetail");
        	
        	List<BankingTransaction> transactions= transactionService.fetchTransactionHistory(session);
        	if(!transactions.isEmpty()) {
        		session.setAttribute("transactionDetails", transactions);
    		}
        	else {
        		session.setAttribute("errorMessage", "BankingTransaction not found!");
        	}
        	response.sendRedirect("passbook");
    	}    	
    }
    
    @PostMapping("/upload")
    public void uploadTheFile(@RequestParam MultipartFile file, @RequestParam Integer selectedUpiId, @RequestParam String utr, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	HttpSession session = request.getSession();
    	Integer userId= (Integer)session.getAttribute("userId");
    	
    	if(userId==null) {
    		session.setAttribute("errorMessage", "Invalid user! please login");
    		response.sendRedirect("login");
    	}
    	else {
    		if(transactionService.isUniqueUTR(utr)) {
    			try {
	    			String filename = transactionService.uploadFile(file, selectedUpiId, userId);
	    			
	    			String baseUrl = ServletUriComponentsBuilder.fromRequestUri(urlRequest).replacePath(null).build().toUriString();
	    			String path = baseUrl + "/deposit/" + userId + "/" + filename;
	    			path = path.replace("127.0.0.1:4050", "kheloexchanges.com");

	    			DepositRequest depositRequest = new DepositRequest();
	    			UpiDetail upiDetail = upiDetailService.fetchUpiDetailById(selectedUpiId);
	    			
	    			session.setAttribute("message", "BankingTransaction successfully done! This request will be processed within 2 days.");
	    			
	    			depositRequest.setPath(path);
	    			depositRequest.setUserId(userId);
	    			depositRequest.setUpiId(upiDetail.getUpiId());
	    			depositRequest.setUpiName(upiDetail.getDisplayName());
	    			depositRequest.setUtr(utr);
	    			
	    			depositRequestService.takeDepositRequest(depositRequest);
	    			
	    			User user= userService.fetchProfile(userId);
	    			emailService.sendCustomMessage(user.getEmail(), "Deposit Request request has been taken", "This request will be processed within 2 days.", user);
	    		}
	    		catch(Exception exception) {
	    			session.setAttribute("errorMessage", exception.getMessage());
	    		}
    		}
    		else {
    			session.setAttribute("errorMessage", "Transaction UTR number is duplication. Please enter correct UTR number.");
    		}
    		response.sendRedirect("fetchUpiDetails");
    	}
    }
    
    @GetMapping("/fetchDepositRequest")
    public void fetchDepositRequestHandler(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	HttpSession session = request.getSession();
    	List<DepositRequest> depositRequests= depositRequestService.fetchAllDepositRequest();
    	
    	session.setAttribute("fetchDepositRequest", "fetchDepositRequest");
    	session.setAttribute("depositRequests", depositRequests);
    	
    	response.sendRedirect("depositRequest");
    }
    
    @PostMapping("/rejectTheDepositRequest")
    public void rejectTheDepositRequestHandler(@RequestParam Integer id, @RequestParam String remark, HttpServletRequest request, HttpServletResponse response) throws IOException, MessagingException {
    	HttpSession session = request.getSession();
    	
    	try {
    		DepositRequest depositRequest= depositRequestService.fetchById(id);
    		User user = userService.fetchProfile(depositRequest.getUserId());
  
    		depositRequest.setRemark(remark);
    		depositRequest.setStatus(true);
//    		depositRequest.setRemark("Rejected");
    		
    		depositRequestService.takeDepositRequest(depositRequest);
    		session.setAttribute("message", "Successfully updated!");
    		emailService.sendCustomMessage(user.getEmail(), "Reject the deposit request", remark, user);
    	}
    	catch(TransactionException transactionException) {
    		session.setAttribute("errorMessage", transactionException.getMessage());
    	}
    	catch(UserException userException) {
    		session.setAttribute("errorMessage", userException.getMessage());
    	}
    	response.sendRedirect("fetchDepositRequest");
    }
    
    @PostMapping("/approveTheDepositRequest")
    public void approveTheDepositRequestHandler(@RequestParam Integer id, @RequestParam Double amount, HttpServletRequest request, HttpServletResponse response) throws IOException, MessagingException, WalletException {
    	HttpSession session = request.getSession();
    	
    	try {
    		DepositRequest depositRequest= depositRequestService.fetchById(id);
    		User user = userService.fetchProfile(depositRequest.getUserId());

    		walletService.walletAmountAddition(amount, depositRequest.getUserId(), session, "Approved the request "+depositRequest.getId());
    		
    		depositRequest.setAmount(amount);
    		depositRequest.setStatus(true);
    		depositRequest.setRemark("Approved");
    		
    		depositRequestService.takeDepositRequest(depositRequest);
    		
    		session.setAttribute("message", "Successfully updated!");
    		emailService.sendCustomMessage(user.getEmail(), "Approve the deposit request", "Approve", user);
    	}
    	catch(TransactionException transactionException) {
    		session.setAttribute("errorMessage", transactionException.getMessage());
    	}
    	catch(UserException userException) {
    		session.setAttribute("errorMessage", userException.getMessage());
    	}
    	response.sendRedirect("fetchDepositRequest");
    }
    
    @PostMapping("/deleteUpi")
    public void deleteUpiHandler(@RequestParam Integer id, HttpServletResponse response, HttpServletRequest request) throws IOException {
    	HttpSession session = request.getSession();
    	
    	if(upiDetailService.deleteUpiById(id)) {
    		session.setAttribute("message", "Successfully deleted!");
    	}
    	else {
    		session.setAttribute("errorMessage", "Something went wrong!");
    	}
    	
    	response.sendRedirect("fetchAllUpi");
    }
    
    @PostMapping("/withdrawRequest")
    public void withdrawRequestHandling(@RequestParam String bank, @RequestParam String accountNumber, @RequestParam String ifsc, @RequestParam String accountHolderName, @RequestParam Double amount, HttpServletRequest request, HttpServletResponse response) throws IOException, UserException, WalletException, MessagingException {
    	HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        User user = userService.fetchProfile(userId);
        WithdrawRequest withdrawRequest = new WithdrawRequest();
        
        if(user==null){
            session.setAttribute("errorMessage", "Invalid User!! Please login.");
            
            response.sendRedirect("login");
        }
        else {
			if(walletService.withdrawableWalletAmountDeduction(amount, userId, session, "Direct money transfer to Bank Account")) {
				try {
					withdrawRequest.setBankName(bank);
					withdrawRequest.setUserId(userId);
			        withdrawRequest.setAccountNumber(accountNumber);
			        withdrawRequest.setAccountHolderName(accountHolderName);
			        withdrawRequest.setIfsc(ifsc);
			        withdrawRequest.setAmount(amount);
			        withdrawRequest.setMobile(user.getMobile());
			        withdrawRequest.setStatus(Status.PENDING);
		        
		        	withdrawRequest = withdrawRequestService.saveWithdrawRequest(withdrawRequest);
		        }
		        catch(Exception exception) {
		        	withdrawRequest.setStatus(Status.FAILED);
		        	withdrawRequest = withdrawRequestService.saveWithdrawRequest(withdrawRequest);
		        	session.setAttribute("message", exception.getMessage());
		        	response.sendRedirect("withdraw");
		        }
				String subject = "Money Transfer";
				String message = "Direct money transfer to Bank Account.\nIt will proceed within 2 days";
				
				emailService.sendCustomMessage(user.getEmail(), subject, message, user);
				
		    	session.setAttribute("message", "BankingTransaction Successful. It will proceed within 2 days");
		    	response.sendRedirect("withdraw");
			}
			else {
				session.setAttribute("errorMessage", "Insufficient amount in withdrawable wallet");
				response.sendRedirect("withdraw");
			}
        }
    }
    
    @GetMapping("/fetchAllWithdrawRequest")
    public void fetchAllWithdrawRequestHandler(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	List<WithdrawRequest> withdrawRequests= withdrawRequestService.fetchAllWithdrawRequest();
    	HttpSession session = request.getSession();
    	
    	if(withdrawRequests==null) {
    		session.setAttribute("errorMessage", "No withdraw request found.");
    	}
    	else {
    		session.setAttribute("withdrawRequests", withdrawRequests);
    	}
    	response.sendRedirect("adminWithdrawRequest");
    }
    
    @PostMapping("/approveWithdrawRequest")
    public void approveWithdrawRequestHandler(@RequestParam String utr, @RequestParam Integer id, HttpServletRequest request, HttpServletResponse response) throws IOException {
    	WithdrawRequest withdrawRequest = null;
    	HttpSession session = request.getSession();
    	User user = null;
    	
    	try {
    		withdrawRequest= withdrawRequestService.fetchWithdrawRequestById(id);
	    	user = userService.fetchProfile(withdrawRequest.getUserId());
	    	
	    	withdrawRequest.setReferenceNumber(utr);
	    	withdrawRequest.setStatus(Status.SUCCESS);
	    	withdrawRequest.setTimestamp(LocalDateTime.now());
    	}
    	catch(Exception exception) {
    		session.setAttribute("errorMessage", exception.getMessage());
    	}
    	
    	if(withdrawRequest !=null) {
	    	withdrawRequestService.saveWithdrawRequest(withdrawRequest);
	    	
	    	session.setAttribute("message", "Successfully update the withdraw request.");
    	}
    	response.sendRedirect("fetchAllWithdrawRequest");
    }
    
    @PostMapping("/rejectWithdrawRequest")
    public void rejectWithdrawRequestHandler(@RequestParam Integer id, HttpServletRequest request, HttpServletResponse response) throws WalletException, UserException, MessagingException, IOException {
    	WithdrawRequest withdrawRequest = null;
    	HttpSession session = request.getSession();
    	User user = null;
    	
    	try {
    		withdrawRequest= withdrawRequestService.fetchWithdrawRequestById(id);
	    	user = userService.fetchProfile(withdrawRequest.getUserId());
	    	
	    	withdrawRequest.setReferenceNumber("Rejected");
	    	withdrawRequest.setStatus(Status.SUCCESS);
	    	withdrawRequest.setTimestamp(LocalDateTime.now());
    	}
    	catch(Exception exception) {
    		session.setAttribute("errorMessage", exception.getMessage());
    	}
    	
    	if(withdrawRequest !=null) {
	    	withdrawRequestService.saveWithdrawRequest(withdrawRequest);
	    	
	    	walletService.withdrawableWalletAmountAddition(withdrawRequest.getAmount(), withdrawRequest.getUserId(), session, "Rejected");
	    	
	    	emailService.sendCustomMessage(user.getEmail(), "Withdraw Request has been Rejected", "Your withdraw Request has been Rejected.\nFor more information, please contact to admin.", user);
	    	
	    	session.setAttribute("message", "Successfully update the withdraw request.");
    	}
    	response.sendRedirect("fetchAllWithdrawRequest");
    }
    
    @GetMapping("/fetchWalletTransaction")
    public void fetchWalletTransactionHandler(HttpServletResponse response, HttpServletRequest request) throws WalletException, UserException, IOException {
    	HttpSession session = request.getSession();
    	Integer userId = (Integer)session.getAttribute("userId");
    	Wallet wallet= walletService.getWalletByUserId(userId);
    	
    	session.setAttribute("wallet", wallet);
    	response.sendRedirect("/passbook");
    }
}