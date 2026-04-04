package com.dao;

import java.util.List;

import com.model.StudentModal;

public interface StudentDAOInterface {
	
	public String insertData(StudentModal sm);
	public StudentModal selectData(StudentModal sm);
	public List<StudentModal> selectAll();
	public String updateStudent(StudentModal sm);
	public String deleteData(StudentModal sm);
	public List<StudentModal> selectByCourse(String course);
	public StudentModal SelectByUserName(String UserName);

	

}
