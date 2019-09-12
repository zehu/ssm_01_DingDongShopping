package com.example.admin.service;

import com.example.admin.entity.Admin;

public interface AdminService {	
	public Admin findByAdminnameAndAdminpwd(String adminname, String adminpwd);	
}
