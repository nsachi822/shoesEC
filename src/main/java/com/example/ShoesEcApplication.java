package com.example;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
public class ShoesEcApplication  {
	
	public static void main(String[] args) {
		SpringApplication.run(ShoesEcApplication.class,args);
	}
	
/*	
	private final MailSender mailSender;
	
	public ShoesEcApplication(MailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	@Override
    public void run(String... args) {
        
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo("送信先メールアドレス1");
        msg.setCc("送信先メールアドレス2", "送信先メールアドレス3");
        msg.setBcc("送信先メールアドレス4");
        msg.setSubject("件名");
        msg.setText("本文");
        
        // メール送信
        mailSender.send(msg);
    }
*/	
	

}
