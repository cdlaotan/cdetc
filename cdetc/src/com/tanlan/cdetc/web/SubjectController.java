package com.tanlan.cdetc.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tanlan.cdetc.entity.Subject;
import com.tanlan.cdetc.service.SubjectService;

@Controller
@RequestMapping("subject")
public class SubjectController {

	@Resource
	private SubjectService subjectService;

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() {
		return "study/subject_add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(Subject subject) {
		subjectService.addSubject(subject);
		return "redirect:/subject/list";
	}

	@RequestMapping("list")
	public String list(Model model) {
		model.addAttribute("subjects", subjectService.getSubjects());
		return "study/subject_list";
	}

	@RequestMapping(value = "ajax", produces = "application/json")
	@ResponseBody
	public List<Subject> ajax() {
		return subjectService.getSubjects();
	}
}
