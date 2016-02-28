package com.tanlan.cdetc.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tanlan.cdetc.entity.Teacher;
import com.tanlan.cdetc.service.SubjectService;
import com.tanlan.cdetc.service.TeacherService;

@Controller
@RequestMapping("teacher")
public class TeacherController {
	@Resource
	private TeacherService teacherService;
	@Resource
	private SubjectService subjectService;

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Model model) {
		model.addAttribute("subjects", subjectService.getSubjects());
		return "structure/teacher_add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(Teacher teacher) {
		teacherService.addTeacher(teacher);
		return "redirect:/teacher/list";
	}

	@RequestMapping("list")
	public String list(Model model) {
		model.addAttribute("teachers", teacherService.getTeachers());
		return "structure/teacher_list";
	}
	
	@RequestMapping("select")
	public String select(Model model) {
		model.addAttribute("teachers", teacherService.getTeachers());
		return "admin/teacher_select";
	}
}
