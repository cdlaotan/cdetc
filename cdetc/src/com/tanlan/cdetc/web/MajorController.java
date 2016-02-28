package com.tanlan.cdetc.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tanlan.cdetc.entity.Major;
import com.tanlan.cdetc.service.MajorService;

@Controller
@RequestMapping("major")
public class MajorController {
	@Resource
	private MajorService majorService;

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() {
		return "structure/major_add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(Major major) {
		majorService.addMajor(major);
		return "redirect:/major/list";
	}

	@RequestMapping("list")
	public String list(Model model) {
		model.addAttribute("majors", majorService.getMajors());
		return "structure/major_list";
	}
}
