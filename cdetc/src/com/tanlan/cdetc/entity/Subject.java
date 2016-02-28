package com.tanlan.cdetc.entity;

/**
 * 学科实体类
 * 
 * @author tanlan
 * 
 */
public class Subject {
	private String id;
	private String name;
	private int courseNums;
	private int classNums;
	private String status;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCourseNums() {
		return courseNums;
	}

	public void setCourseNums(int courseNums) {
		this.courseNums = courseNums;
	}

	public int getClassNums() {
		return classNums;
	}

	public void setClassNums(int classNums) {
		this.classNums = classNums;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
