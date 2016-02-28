package com.tanlan.cdetc.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tanlan.cdetc.entity.User;
import com.tanlan.cdetc.service.RoleService;
import com.tanlan.cdetc.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Resource
	private UserService userService;
	@Resource
	private RoleService roleService;

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String addUser(Model model) {
		model.addAttribute("roles", roleService.getRoles());
		return "admin/user_add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String addUser(User user, String assignId) {
		userService.addUser(user, assignId);
		return "redirect:/user/list";
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Integer page, User user, Model model) {
		model.addAttribute("pageBean",
				userService.getUsers(page == null ? 1 : page, user));
		return "admin/user_list";

	}

	@RequestMapping("login")
	public String login(String account, String password,
			HttpServletRequest request, HttpSession session, Model model) {
		User user = userService.getUserByAccountAndPwd(account, password);
		if (user == null) {
			model.addAttribute("msg", "用户名或密码错误!");
			return "index";
		} else {
			// if(user.getEmployee()==null ||
			// StringUtils.isBlank(user.getEmployee().getId())){
			// model.addAttribute("msg", "该用户没有分配给任何员工使用!,请联系管理员!");
			// return "index";
			// }
			// if(user.getStatus().equals(User.ABSNORMAL)){
			// model.addAttribute("msg", "该用户已经被禁用!,请联系管理员!");
			// return "index";
			// }
			String ip = request.getRemoteAddr();
			userService.updateLastLoginTime(user.getId(), ip);
			session.setAttribute("user", user);
			return "redirect:/main.jsp";
		}
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/";
	}

	@RequestMapping("update/{id}")
	public String getById(@PathVariable String id, Model model) {
		model.addAttribute("roles", roleService.getRoles());
		model.addAttribute("user", userService.getUserById(id));
		return "admin/user_update";
	}
}
