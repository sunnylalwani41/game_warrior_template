package com.gamewarrior.Game.Warrior.model;

import javax.swing.*;
import java.awt.*;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.*;

public class Client extends JFrame{
    private Socket client;
    private BufferedReader br;
    private PrintWriter out;

    private JLabel heading = new JLabel("Client Chat Box");
    private JTextArea messageArea= new JTextArea();
    private JTextField messageInput = new JTextField();
    private Font font = new Font("Arial", Font.PLAIN, 20);

    public Client(String ip, Integer port){

        try {
            System.out.println("Sending a request to server...");

            client = new Socket(ip, port);

            System.out.println("Connection Done");

            br = new BufferedReader(new InputStreamReader(client.getInputStream()));
            out = new PrintWriter(client.getOutputStream());

            createGUI();
            handleEvents();
            startReading();
//            startWriting();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    
    public void handleEvents(){
        messageInput.addKeyListener(new KeyListener() {
            @Override
            public void keyTyped(KeyEvent e) {

            }

            @Override
            public void keyPressed(KeyEvent e) {

            }

            @Override
            public void keyReleased(KeyEvent e) {
                if(e.getKeyCode()==10){
                    System.out.println("You are pressed Enter");

                    String contentForSend = messageInput.getText();

                    messageArea.append("Me : "+contentForSend+"\n");
                    out.println(contentForSend);
                    out.flush();

                    messageInput.setText("");

                    if(contentForSend.equalsIgnoreCase("exit")){
                        try {
                            client.close();
                        } catch (IOException ex) {
                            throw new RuntimeException(ex);
                        }
                        messageInput.setEnabled(false);
                    }
                    messageInput.requestFocus();
                }
            }
        });
    }

    public void startReading(){
        Runnable r1 = () -> {
            System.out.println("reader started ...");
            try{
                while(true){
                    String msg = br.readLine();

                    if(msg.equals("exit")){
                        System.out.println("Server terminated the chat");
                        JOptionPane.showMessageDialog(this, "Server terminated the chat");
                        client.close();
                        messageInput.setEnabled(false);
                        break;
                    }
                    messageArea.append("Server: "+msg+"\n");
                }
            } catch (IOException e) {
//                System.out.println("Connection is closed");
            }
            System.out.println("Connection is closed");
        };

        new Thread(r1).start();
    }

    public void startWriting(){
        Runnable r2 = ()->{
            try {
                while(!client.isClosed()){
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
                    String input= bufferedReader.readLine();
                    out.println(input);
                    out.flush();

                    if(input.equals("exit")){
                        client.close();
                        break;
                    }
                }
                System.out.println("Connection is closed");
            }
            catch (Exception exception){
                System.out.println("Connection is closed");
            }
        };

        new Thread(r2).start();
    }

    public void createGUI(){
        //Gui Code
        this.setTitle("Client Messager[END]");
        this.setSize(600, 600);
            //This function open chat window at the center of the screen
        this.setLocationRelativeTo(null);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setVisible(true);

        //Code For Component
            //set the font
        heading.setFont(font);
        messageArea.setFont(font);
        messageInput.setFont(font);
            //header
                //set border icon
//            heading.setIcon(new ImageIcon("./clogo.png"));
                //set text align center horizantally
            heading.setHorizontalTextPosition(SwingConstants.CENTER);
                //set text align bottom vertically
            heading.setVerticalTextPosition(SwingConstants.CENTER);
                //set center alignment of the heading part
            heading.setHorizontalAlignment(SwingConstants.CENTER);
                //set border space
            heading.setBorder(BorderFactory.createEmptyBorder(20,20,20,20));
            //messageInput
                    //set text align center in horizantal
                messageInput.setHorizontalAlignment(SwingConstants.CENTER);
                //messageArea
                    //Not allow to edit the text in MessageArea
                messageArea.setEditable(false);
                    // for messageinput, we have to handle the events
                //set the frame layout
            this.setLayout(new BorderLayout());
            //set the component to the frame
        this.add(heading, BorderLayout.NORTH);
        JScrollPane jScrollPane = new JScrollPane(messageArea);
        this.add(jScrollPane, BorderLayout.CENTER);
        this.add(messageInput, BorderLayout.SOUTH);
    }
}
// There is one bug When Close the client, after it server writing thread still running or vise varsa.
//So its solution may be apply multithreading concept, so that one thread close, so automatically another thread should be close.