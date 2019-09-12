package com.example.dao;

import com.example.entity.Book;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface BookDao {
	
	public Integer findBookTr(Map<String, Object> map) throws SQLException;

	public void delete(String bid) throws SQLException;

	public void edit(Map<String, Object> map) throws SQLException;

	public void add(Map<String, Object> map) throws SQLException;

	public int findBookCountByCategory(String cid) throws SQLException;

	public Book findByBid(String bid) throws SQLException;

	public List<Book> findByCategory(Map<String, Object> map) throws SQLException;

	public List<Book> findByBname(Map<String, Object> map) throws SQLException;

	public List<Book> findByAuthor(Map<String, Object> map) throws SQLException;

	public List<Book> findByPress(Map<String, Object> map) throws SQLException;

	public List<Book> findByCombination(Map<String, Object> map) throws SQLException;
	
	/*public List<Book> findByCriteria(Map<String,Object> map) throws SQLException;*/
}
