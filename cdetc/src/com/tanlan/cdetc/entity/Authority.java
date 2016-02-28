package com.tanlan.cdetc.entity;

/**
 * 权限实体类
 * 
 * @author tanlan
 * 
 */
public class Authority {
	private int id;
	private String name;
	private String link;
	private int parentId;
	private int level;
	private String icon;
	private String sttaus;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getSttaus() {
		return sttaus;
	}

	public void setSttaus(String sttaus) {
		this.sttaus = sttaus;
	}
}
