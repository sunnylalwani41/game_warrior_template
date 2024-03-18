package com.gamewarrior.Game.Warrior.model;

import java.time.LocalDateTime;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class WithdrawRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "transactionGenerator")
    @SequenceGenerator(name = "transactionGenerator", sequenceName = "transactionGen", allocationSize = 1, initialValue = 50000)
    private int id;
    private String mobile;
    private String accountNumber;
    private String ifsc;
    private String accountHolderName;
    private Double amount;
    private String transactionId;
    private Integer userId;
    private String contactId;
    private String fundAccountId;
    private LocalDateTime timestamp = LocalDateTime.now();
}