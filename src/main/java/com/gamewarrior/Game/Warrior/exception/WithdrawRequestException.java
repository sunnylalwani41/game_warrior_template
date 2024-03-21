package com.gamewarrior.Game.Warrior.exception;

public class WithdrawRequestException extends Exception{
    public WithdrawRequestException(){

    }
    public WithdrawRequestException(String message){
        super(message);
    }
}
