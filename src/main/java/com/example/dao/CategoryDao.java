package com.example.dao;

import com.example.entity.Category;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface CategoryDao {
		
	public Category load(String cid) throws SQLException;
	
	public List<Category> findByParent(String pid) throws SQLException;
	
	public List<Category> findParent() throws SQLException;

	public void add(Map<String, Object> map) throws SQLException;

	public void edit(Map<String, Object> map) throws SQLException;
	
	public int findChildrenByParent(String pid) throws SQLException;
	
	public void delete(String cid) throws SQLException;

}
