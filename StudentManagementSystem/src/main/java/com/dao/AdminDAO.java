package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dbconection.DBConnection;
import com.model.AdminModal;
import com.model.StudentModal;

public class AdminDAO implements AdminDAOInterface {

	

	@Override
	public AdminModal selectData(AdminModal am) {
		AdminModal a=null;
		try {
			DBConnection db=new DBConnection();
			Connection c=db.getConnection();
			PreparedStatement ps=c.prepareStatement("select * from admin where userName=? and password=?");
			ps.setString(1, am.getUserName());
			ps.setString(2, am.getPassword());
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				a=new AdminModal();
				a.setUserName(rs.getString("userName"));
				a.setName(rs.getString("Name"));
				a.setPassword(rs.getString("password"));
				a.setRole(rs.getString("role"));
			}
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return a;
	}

	@Override
	public String updateData(AdminModal am) {
		// TODO Auto-generated method stub
		return null;
	}



	

	@Override
	public String deleteData(String userName) {
		String status="fail";
		try {
			DBConnection db=new DBConnection();
			Connection c=db.getConnection();
			PreparedStatement ps=c.prepareStatement("delete from sms where userName=?");
			ps.setString(1,userName);
			int n=ps.executeUpdate();
			if(n>0) {
				status="success";
			}
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}

	@Override
	public StudentModal SelectByUserName(String UserName) {
		StudentModal sm=new StudentModal();;
		try {
			DBConnection db=new DBConnection();
			Connection c=db.getConnection();
			PreparedStatement ps=c.prepareStatement("select * from sms where userName=?");
			ps.setString(1, UserName);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				sm.setUserName(rs.getString("userName"));
				sm.setFirstName(rs.getString("firstName"));
				sm.setLastName(rs.getString("lastName"));
				sm.setEmail(rs.getString("email"));
				sm.setMobile(rs.getString("mobile"));
				sm.setPassword(rs.getString("password"));
				sm.setMarks(rs.getString("marks"));
				sm.setCourse(rs.getString("course"));
				sm.setState(rs.getString("state"));
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return sm;
	}


	

}
