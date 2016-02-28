package com.tanlan.cdetc.entity;

import java.util.List;

/**
 * 课程实体类
 * 
 * @author tanlan
 * 
 */
public class Course {
	private String id;
	private String name;
	private int chapterNums;
	private int orderNum;
	private String status;
	private List<Chapter> chapters;
	private boolean isParent = true;

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

	public int getChapterNums() {
		return chapterNums;
	}

	public void setChapterNums(int chapterNums) {
		this.chapterNums = chapterNums;
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

	public List<Chapter> getChapters() {
		return chapters;
	}

	public void setChapters(List<Chapter> chapters) {
		this.chapters = chapters;
	}

	public boolean getIsParent() {
		return isParent;
	}
}
