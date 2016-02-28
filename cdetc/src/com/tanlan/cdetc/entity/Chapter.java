package com.tanlan.cdetc.entity;

/**
 * 章节实体类
 * 
 * @author tanlan
 * 
 */
public class Chapter {
	private String id;
	private String name;
	private String courseId;
	private int knowNums;
	private int orderNum;
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

	public String getCourseId() {
		return courseId;
	}

	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getKnowNums() {
		return knowNums;
	}

	public void setKnowNums(int knowNums) {
		this.knowNums = knowNums;
	}
}
