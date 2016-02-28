package com.tanlan.cdetc.entity;

/**
 * 题型实体类
 * 
 * @author tanlan
 * 
 */
public class Questype {
	private String id;
	private String name;
	private int quesNums;

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

	public int getQuesNums() {
		return quesNums;
	}

	public void setQuesNums(int quesNums) {
		this.quesNums = quesNums;
	}
}
