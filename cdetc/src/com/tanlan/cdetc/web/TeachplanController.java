package com.tanlan.cdetc.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tanlan.cdetc.service.ClassService;
import com.tanlan.cdetc.service.TeacherService;
import com.tanlan.cdetc.service.TeachplanService;

@Controller
@RequestMapping("teachplan")
public class TeachplanController {
	@Resource
	private TeachplanService teachplanService;
	@Resource
	private ClassService classService;
	@Resource
	private TeacherService teacherService;

	@RequestMapping("list")
	public String list(Model model) {
		model.addAttribute("classes", classService.getClasses());
		model.addAttribute("teachers", teacherService.getTeachers());
		model.addAttribute("teachplans", teachplanService.getTeachplans());
		return "structure/teachplan_list";
	}
}
