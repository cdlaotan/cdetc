package com.tanlan.cdetc.tag;

import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.tanlan.cdetc.entity.Authority;
import com.tanlan.cdetc.entity.User;

public class AuthTag extends TagSupport {
	private int authCode;

	@Override
	public int doStartTag() throws JspException {
		User user = (User) pageContext.getSession().getAttribute("user");
		List<Authority> authorities = user.getAuthorities();
		for (Authority authority : authorities) {
			if (authority.getId() == authCode) {
				return EVAL_BODY_INCLUDE;
			}
		}
		return SKIP_BODY;
	}

	public int getAuthCode() {
		return authCode;
	}

	public void setAuthCode(int authCode) {
		this.authCode = authCode;
	}
}
