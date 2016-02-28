package com.tanlan.cdetc.entity;

/**
 * 试卷实体类
 * 
 * @author tanlan
 * 
 */
public class Paper {
	private String id;
	private String description;
	private int duration;
	private int quesNums;
	private String userId;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public int getQuesNums() {
		return quesNums;
	}

	public void setQuesNums(int quesNums) {
		this.quesNums = quesNums;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}
