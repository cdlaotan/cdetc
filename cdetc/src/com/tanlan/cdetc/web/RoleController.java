package com.tanlan.cdetc.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tanlan.cdetc.entity.Role;
import com.tanlan.cdetc.service.AuthorityService;
import com.tanlan.cdetc.service.RoleService;

@Controller
@RequestMapping("role")
public class RoleController {
	@Resource
	private RoleService roleService;
	@Resource
	private AuthorityService authorityService;

	@RequestMapping("list")
	public String list(Model model) {
		model.addAttribute("roles", roleService.getRoles());
		return "admin/role_list";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Model model) {
		// model.addAttribute("authorities", authorityService.getAuthorities());
		return "admin/role_add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(Role role, int[] authIds) {
		roleService.addRole(role, authIds);
		return "redirect:/role/list";
	}

	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String get(@PathVariable String id, Model model) {
		model.addAttribute("role", roleService.getRoleById(id));
		return "admin/role_update";
	}
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(Role role, int[] authIds) {
		roleService.updateRole(role, authIds);
		return "redirect:/role/list";
	}


}
