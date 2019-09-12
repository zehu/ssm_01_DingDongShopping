package com.example.dao;

import com.example.entity.User;

import java.sql.SQLException;
import java.util.Map;

public interface UserDao {
	
	public boolean findByUidAndLoginpass(Map<String, String> map) throws SQLException;

	public void updateLoginpass(Map<String, String> map) throws SQLException;

	public User findByLoginnameAndLoginpass(Map<String, String> map) throws SQLException;

	public User findByCode(String code) throws SQLException;

	public void updateStatus(Map<String, Object> map) throws SQLException;
	
	public boolean ajaxValidateLoginname(String loginname) throws SQLException;
	
	public boolean ajaxValidateEmail(String email) throws SQLException;
	
	public int add(User user) throws SQLException;
}
