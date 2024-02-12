package com.gamewarrior.Game.Warrior.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.gamewarrior.Game.Warrior.exception.TransactionException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.DepositRequest;
import com.gamewarrior.Game.Warrior.model.BankingTransaction;
import com.gamewarrior.Game.Warrior.model.UpiDetail;
import com.gamewarrior.Game.Warrior.model.User;
import com.gamewarrior.Game.Warrior.model.Wallet;
import com.gamewarrior.Game.Warrior.service.DepositRequestService;
import com.gamewarrior.Game.Warrior.service.EmailService;
import com.gamewarrior.Game.Warrior.service.WithdrawalTransactionService;
import com.gamewarrior.Game.Warrior.service.UpiDetailService;
import com.gamewarrior.Game.Warrior.service.UserService;
import com.gamewarrior.Game.Warrior.service.WalletService;

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
    public void saveTransactionDetail(
    		@RequestParam String mobile, @RequestParam String accountNumber, @RequestParam String ifsc, @RequestParam String accountHolderName,
    		@RequestParam Integer amount, HttpServletRequest request, HttpServletResponse response) throws IOException, TransactionException, UserException{
    	HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        BankingTransaction bankingTransaction = new BankingTransaction();
        
        bankingTransaction.setMobile(mobile);
        bankingTransaction.setAccountNumber(accountNumber);
        bankingTransaction.setIfsc(ifsc);
        bankingTransaction.setAccountHolderName(accountHolderName);
        bankingTransaction.setAmount(amount);

        if(userId==null){
            session.setAttribute("errorMessage", "Invalid User!! Please login.");
            
            response.sendRedirect("login");
        }
        else {
        	User user = userService.fetchProfile(userId);
        	Integer balance = user.getWallet().getBalance();
        	
        	if(balance !=null && balance>=amount && amount>=150) {
	        	bankingTransaction.setUserId(userId);
	        	transactionService.moneyTransfer(bankingTransaction);
	        	user.getWallet().setBalance(user.getWallet().getBalance()-amount);

	        	userService.saveUserDetail(user);
	        	transactionService.saveTransaction(bankingTransaction);

	        	session.setAttribute("balance", user.getWallet().getBalance());
	        	request.setAttribute("transaction", bankingTransaction);
	        	session.setAttribute("message", "BankingTransaction Successfull");
	        	response.sendRedirect("withdraw");
        	}
        	else {
        		session.setAttribute("errorMessage", "Minimum withdraw 150 rupees");
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
    public void uploadTheFile(@RequestParam MultipartFile file, @RequestParam Integer selectedUpiId, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	HttpSession session = request.getSession();
    	Integer userId= (Integer)session.getAttribute("userId");
    	
    	if(userId==null) {
    		session.setAttribute("errorMessage", "Invalid user! please login");
    		response.sendRedirect("login");
    	}
    	else {
    		try {
    			transactionService.uploadFile(file, selectedUpiId, userId);
    			
    			String path = ServletUriComponentsBuilder.fromCurrentContextPath().path("/deposit/").path(file.getOriginalFilename()).toUriString();
    			DepositRequest depositRequest = new DepositRequest();
    			UpiDetail upiDetail = upiDetailService.fetchUpiDetailById(selectedUpiId);
    					
    			session.setAttribute("message", "BankingTransaction successfully done! This request will be processed within 2 days.");
    			
    			depositRequest.setPath(path);
    			depositRequest.setUserId(userId);
    			depositRequest.setUpiId(upiDetail.getUpiId());
    			depositRequest.setUpiName(upiDetail.getDisplayName());
    			
    			depositRequestService.takeDepositRequest(depositRequest);
    			
    			User user= userService.fetchProfile(userId);
    			emailService.sendCustomMessage(user.getEmail(), "Deposit Request request has been taken", "BankingTransaction successfully done! This request will be processed within 2 days.", user);
    		}
    		catch(Exception exception) {
    			session.setAttribute("errorMessage", exception.getMessage());
    		}
    		response.sendRedirect("fetchUpiDetails");
    	}
    }
    
    @GetMapping("/fetchDepositRequest")
    public void fetchDepositRequestHandler(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	HttpSession session = request.getSession();
    	List<DepositRequest> depositRequests= depositRequestService.fetchAllDepositRequest();
    	System.out.println("Hello");
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
    public void approveTheDepositRequestHandler(@RequestParam Integer id, @RequestParam Integer amount, HttpServletRequest request, HttpServletResponse response) throws IOException, MessagingException {
    	HttpSession session = request.getSession();
    	
    	try {
    		DepositRequest depositRequest= depositRequestService.fetchById(id);
    		User user = userService.fetchProfile(depositRequest.getUserId());
    		Wallet wallet = user.getWallet();
    		
    		wallet.setBalance(wallet.getBalance()+amount);
    		
    		user.setWallet(wallet);
    		
    		depositRequest.setAmount(amount);
    		depositRequest.setStatus(true);
    		depositRequest.setRemark("Approved");
    		
    		userService.saveUserDetail(user);
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
}