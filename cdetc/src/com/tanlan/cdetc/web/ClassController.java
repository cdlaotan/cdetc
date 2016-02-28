package com.tanlan.cdetc.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tanlan.cdetc.entity.Clazz;
import com.tanlan.cdetc.service.ClassService;
import com.tanlan.cdetc.service.SubjectService;

@Controller
@RequestMapping("class")
public class ClassController {
	@Resource
	private ClassService classService;
	@Resource
	private SubjectService subjectService;

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Model model) {
		model.addAttribute("subjects", subjectService.getSubjects());
		return "structure/class_add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(Clazz clazz) {
		classService.addClass(clazz);
		return "redirect:/class/list";
	}

	@RequestMapping("list")
	public String list(Model model) {
		model.addAttribute("classes", classService.getClasses());
		return "structure/class_list";
	}
}
