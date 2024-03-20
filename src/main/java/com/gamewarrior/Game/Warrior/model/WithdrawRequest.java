package com.gamewarrior.Game.Warrior.model;

import java.time.LocalDateTime;

import com.gamewarrior.Game.Warrior.dto.Status;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class WithdrawRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "withdrawRequestGenerator")
    @SequenceGenerator(name = "withdrawRequestGenerator", sequenceName = "withdrawRequestGen", allocationSize = 1, initialValue = 5000)
    private int id;
    private String mobile;
    private String bankName;
    private String accountNumber;
    private String ifsc;
    private String accountHolderName;
    private Double amount;
    private String utr;
    private Integer userId;
    @Enumerated(EnumType.STRING)
    private Status status;
    private LocalDateTime timestamp;
}