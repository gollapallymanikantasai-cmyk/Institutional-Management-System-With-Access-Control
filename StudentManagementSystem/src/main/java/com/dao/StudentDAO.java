package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbconection.DBConnection;
import com.model.StudentModal;

public class StudentDAO implements StudentDAOInterface {

	@Override
	public String insertData(StudentModal sm) {
		String status = "fail";
		try {
			DBConnection db = new DBConnection();
			Connection con = db.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"insert into sms(userName,firstName,lastName,email,mobile,course,state,password) values(?,?,?,?,?,?,?,?)");
			ps.setString(1, sm.getUserName());
			ps.setString(2, sm.getFirstName());
			ps.setString(3, sm.getLastName());
			ps.setString(4, sm.getEmail());
			ps.setString(5, sm.getMobile());
			ps.setString(6, sm.getCourse());
			ps.setString(7, sm.getState());
			ps.setString(8, sm.getPassword());
			int n = ps.executeUpdate();
			if (n > 0) {
				status = "success";
				System.out.println("done");
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}

	@Override
	public StudentModal selectData(StudentModal sm) {
		StudentModal s = null;
		try {
			DBConnection db = new DBConnection();
			Connection c = db.getConnection();
			PreparedStatement ps = c.prepareStatement("select * from sms where userName=? and password=?");
			ps.setString(1, sm.getUserName());
			ps.setString(2, sm.getPassword());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				s = new StudentModal();
				s.setId(rs.getInt("id"));
				s.setUserName(rs.getString("userName"));
				s.setFirstName(rs.getString("firstName"));
				s.setLastName(rs.getString("lastName"));
				s.setEmail(rs.getString("email"));
				s.setMobile(rs.getString("mobile"));
				s.setPassword(rs.getString("password"));
				s.setMarks(rs.getString("marks"));
				s.setCourse(rs.getString("course"));
				s.setState(rs.getString("state"));
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return s;
	}

	@Override
	public String updateStudent(StudentModal sm) {
		String status = "fail";
		try {
			DBConnection db = new DBConnection();
			Connection c = db.getConnection();
			PreparedStatement ps = c.prepareStatement("update sms set  firstName=? , lastName=? , email=? , mobile=? ,password=? , marks=?,course=? , state=? where userName=? ");
			ps.setString(1, sm.getFirstName());
			ps.setString(2, sm.getLastName());
			ps.setString(3, sm.getEmail());
			ps.setString(4, sm.getMobile());
			ps.setString(5, sm.getPassword());
			ps.setString(6, sm.getMarks());
			ps.setString(7, sm.getCourse());
			ps.setString(8, sm.getState());
			ps.setString(9, sm.getUserName());

			int n = ps.executeUpdate();
			if (n > 0) {
				status = "success";
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return status;

	}

	@Override
	public String deleteData(StudentModal sm) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StudentModal> selectAll() {
		List<StudentModal> l = new ArrayList<>();
		try {
			DBConnection db = new DBConnection();
			Connection con = db.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from sms");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				StudentModal sm = new StudentModal();
				sm.setUserName(rs.getString("userName"));
				sm.setFirstName(rs.getString("firstName"));
				sm.setLastName(rs.getString("lastName"));
				sm.setEmail(rs.getString("email"));
				sm.setMobile(rs.getString("mobile"));
				sm.setCourse(rs.getString("course"));
				sm.setMarks(rs.getString("marks"));
				sm.setPassword(rs.getString("password"));
				sm.setState(rs.getString("state"));
				l.add(sm);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return l;
	}

	@Override
	public List<StudentModal> selectByCourse(String course) {
		
		List<StudentModal> l=new ArrayList<>();
		
		
		try {
			DBConnection db=new DBConnection();
			Connection c=db.getConnection();
			PreparedStatement ps=c.prepareStatement("select * from sms where course=?");
			ps.setString(1, course );
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				StudentModal sm=new StudentModal();
				sm.setUserName(rs.getString("userName"));
				sm.setFirstName(rs.getString("firstName"));
				sm.setLastName(rs.getString("lastName"));
				sm.setEmail(rs.getString("email"));
				sm.setMobile(rs.getString("mobile"));
				sm.setCourse(rs.getString("course"));
				sm.setMarks(rs.getString("marks"));
				sm.setPassword(rs.getString("password"));
				sm.setState(rs.getString("state"));
				l.add(sm);
				
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return l;
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
