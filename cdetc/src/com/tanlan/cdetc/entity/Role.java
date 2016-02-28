package com.tanlan.cdetc.entity;

import java.util.List;

public class Role {
	private String id;
	private String name;
	private String description;
	private List<Authority> authorities;
	public static final int QUERY=1011;
	public static final int ADD=1012;
	public static final int UPDATE=1013;
	public static final int DELETE=1014;

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Authority> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(List<Authority> authorities) {
		this.authorities = authorities;
	}
}
