package com.gamewarrior.Game.Warrior.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gamewarrior.Game.Warrior.exception.TransactionException;
import com.gamewarrior.Game.Warrior.exception.UserException;
import com.gamewarrior.Game.Warrior.model.Transaction;
import com.gamewarrior.Game.Warrior.model.UpiDetail;
import com.gamewarrior.Game.Warrior.model.User;
import com.gamewarrior.Game.Warrior.model.Wallet;
import com.gamewarrior.Game.Warrior.service.TransactionService;
import com.gamewarrior.Game.Warrior.service.UpiDetailService;
import com.gamewarrior.Game.Warrior.service.UserService;
import com.gamewarrior.Game.Warrior.service.WalletService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class TransactionController {
	@Autowired
	private UpiDetailService upiDetailService;
	@Autowired
    private TransactionService transactionService;
	@Autowired
	private UserService userService;
	@Autowired 
	private WalletService walletService;
	
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
        Transaction transaction = new Transaction();
        
        transaction.setMobile(mobile);
        transaction.setAccountNumber(accountNumber);
        transaction.setIfsc(ifsc);
        transaction.setAccountHolderName(accountHolderName);
        transaction.setAmount(amount);

        if(userId==null){
            session.setAttribute("errorMessage", "Invalid User!! Please login.");
            
            response.sendRedirect("login");
        }
        else {
        	User user = userService.fetchProfile(userId);
        	Integer balance = user.getWallet().getBalance();
        	
        	if(balance !=null && balance>=amount && amount>=150) {
	        	transaction.setUserId(userId);
	        	transactionService.moneyTransfer(transaction);
	        	user.getWallet().setBalance(user.getWallet().getBalance()-amount);

	        	userService.saveUserDetail(user);
	        	transactionService.saveTransaction(transaction);

	        	session.setAttribute("balance", user.getWallet().getBalance());
	        	request.setAttribute("transaction", transaction);
	        	session.setAttribute("message", "Transaction Successfull");
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
        	
        	List<Transaction> transactions= transactionService.fetchTransactionHistory(session);
        	if(!transactions.isEmpty()) {
        		session.setAttribute("transactionDetails", transactions);
    		}
        	else {
        		session.setAttribute("errorMessage", "Transaction not found!");
        	}
        	response.sendRedirect("passbook");
    	}    	
    }
}