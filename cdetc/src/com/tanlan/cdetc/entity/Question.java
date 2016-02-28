package com.tanlan.cdetc.entity;

public class Question {
	private String id;
	private String questypeId;
	private String questypeName;
	private String source;
	private String content;
	private String difficulty;
	private String answer;
	private String analysis;
	private String status;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQuestypeId() {
		return questypeId;
	}

	public void setQuestypeId(String questypeId) {
		this.questypeId = questypeId;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getAnalysis() {
		return analysis;
	}

	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getQuestypeName() {
		return questypeName;
	}

	public void setQuestypeName(String questypeName) {
		this.questypeName = questypeName;
	}

}
