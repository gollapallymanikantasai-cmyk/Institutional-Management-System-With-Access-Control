package com.dao;

import com.model.AdminModal;
import com.model.StudentModal;

public interface AdminDAOInterface {
	
	public AdminModal selectData(AdminModal am);
	public String updateData(AdminModal am);
	public String deleteData(String userName);
	public StudentModal SelectByUserName(String UserName);

}
