package com.tanlan.cdetc.entity;

/**
 * 选择题的选项实体类
 * 
 * @author tanlan
 * 
 */
public class Option {
	private String id;
	private String quesId;
	private String choice;
	private String ocontent;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQuesId() {
		return quesId;
	}

	public void setQuesId(String quesId) {
		this.quesId = quesId;
	}

	public String getChoice() {
		return choice;
	}

	public void setChoice(String choice) {
		this.choice = choice;
	}

	public String getOcontent() {
		return ocontent;
	}

	public void setOcontent(String ocontent) {
		this.ocontent = ocontent;
	}
}
