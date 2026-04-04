package com.model;

public class CourseModal {
	
	private String courseId;
	private String courseName;
	private String courseFee;
	private String courseDuration;
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseFee() {
		return courseFee;
	}
	public void setCourseFee(String courseFee) {
		this.courseFee = courseFee;
	}
	public String getCourseDuration() {
		return courseDuration;
	}
	public void setCourseDuration(String courseDuration) {
		this.courseDuration = courseDuration;
	}
	@Override
	public String toString() {
		return "CourseModal [courseId=" + courseId + ", courseName=" + courseName + ", courseFee=" + courseFee
				+ ", courseDuration=" + courseDuration + "]";
	}
	
	

}
