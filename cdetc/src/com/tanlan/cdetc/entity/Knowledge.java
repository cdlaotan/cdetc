package com.tanlan.cdetc.entity;

/**
 * 知识点实体类
 * 
 * @author tanlan
 * 
 */
public class Knowledge {
	private String id;
	private String name;
	private String chapterId;
	private String details;
	private int quesNums;
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

	public String getChapterId() {
		return chapterId;
	}

	public void setChapterId(String chapterId) {
		this.chapterId = chapterId;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public int getQuesNums() {
		return quesNums;
	}

	public void setQuesNums(int quesNums) {
		this.quesNums = quesNums;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
