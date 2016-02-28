package com.tanlan.cdetc.entity;

/**
 * 院校实体类
 * 
 * @author tanlan
 * 
 */
public class College {
	private String id;
	private String name;
	private int stuNums;

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

	public int getStuNums() {
		return stuNums;
	}

	public void setStuNums(int stuNums) {
		this.stuNums = stuNums;
	}
}
