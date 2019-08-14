package com.example.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.User;

@Repository
@Transactional

public class UserRepository {

	private static final RowMapper<User> User_rowMapper = (rs,i) -> {
		User user = new User();
		user.setUserId(rs.getInt("userid"));
		user.setUserName(rs.getString("username"));
		user.setPassword(rs.getString("password"));
		user.setTel(rs.getInt("tel"));
		user.setAddress(rs.getString("address"));
		user.setEmail(rs.getString("email"));
		return user ;
	};
	
	@Autowired
	private NamedParameterJdbcTemplate template;
	
//	ユーザー情報全権取得
	public List <User>  findUserAll(){
		String sql = "SELECT userid,username,password,tel,address,email FROM users";
		List<User> userList = template.query(sql,User_rowMapper);
		return userList;
		
	}
	
//	emailとpasswordからメンバー情報を取得
	public User findByEmailAndPassword(String email,String password) {
		User user = null;
		String sql = "SELECT userid,username,password,tel,address,email FROM users WHERE email=:email AND password =:password";
		
		try {
			SqlParameterSource param = new MapSqlParameterSource().addValue("email",email).addValue("password", password);
			user = template.queryForObject(sql,param,User_rowMapper);
			return user;
		
		} catch (DataAccessException e) {
			return null;
		}
		
		}

// user登録
	public User addUser(User user) {
		SqlParameterSource param = new BeanPropertySqlParameterSource(user);
		
		if(user.getUserId() == null) {
			template.update(
					"INSERT INTO users (username,password,tel,address,email) VALUES(:userName,:password,:tel,:address,:email)",param);
		}else {
			template.update(
					"UPDATE users SET username=:userName, password=:password, tel=:tel, address=:address, email=:email WHERE userid=:userId",param);
		}
		return user;
								
		}
			
}

