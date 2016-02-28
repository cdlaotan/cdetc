package com.tanlan.cdetc.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tanlan.cdetc.entity.College;
import com.tanlan.cdetc.service.CollegeService;

@Controller
@RequestMapping("college")
public class CollegeController {
	@Resource
	private CollegeService collegeService;

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() {
		return "structure/college_add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(College college) {
		collegeService.addCollege(college);
		return "redirect:/college/list";
	}

	@RequestMapping("list")
	public String list(Model model) {
		model.addAttribute("colleges", collegeService.getColleges());
		return "structure/college_list";
	}
}
