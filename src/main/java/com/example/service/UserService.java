package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.User;
import com.example.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository userRepository;
	
	public List <User> findUserAll(){
		return userRepository.findUserAll();
		
	}
	
	public User findByEmailAndPassword(String email,String password) {
		return userRepository.findByEmailAndPassword(email, password);		
	}
	
	public User addUser(User user) {
		return userRepository.addUser(user);
		
	}
}
