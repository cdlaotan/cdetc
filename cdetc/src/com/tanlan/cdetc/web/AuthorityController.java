package com.tanlan.cdetc.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tanlan.cdetc.entity.Authority;
import com.tanlan.cdetc.entity.User;
import com.tanlan.cdetc.service.AuthorityService;

@Controller
@RequestMapping("authority")
public class AuthorityController {
	@Resource
	private AuthorityService authorityService;

	/**
	 * 从Session中获取用户的权限菜单，只保留两层
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "menu", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<Authority> getAuthorities(HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Authority> authorities = new ArrayList<>();
		for (Authority authority : user.getAuthorities()) {
			if (authority.getLevel() < 3) {
				authorities.add(authority);
			}
		}
		return authorities;
	}

	/**
	 * 用于新增角色时分配权限(未禁用)
	 * 
	 * @return
	 */
	@RequestMapping(value = "list", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<Authority> getAuthorities() {
		return authorityService.getAuthorities();
	}

	@RequestMapping(value = "all", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<Authority> getAllAuthorities() {
		return authorityService.getAllAuthorities();
	}

	@RequestMapping("manage")
	public String manage(){
		return "admin/authority_manage";
	}
	
	/**
	 * 禁用或启用权限菜单
	 * 
	 * @param authIds
	 * @param status
	 */
	@RequestMapping(value="update")
	@ResponseBody
	public void updateStatus(int[] authIds, String status) {
		authorityService.updateStatus(authIds, status);
	}
}
