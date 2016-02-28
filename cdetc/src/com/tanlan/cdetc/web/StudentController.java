package com.tanlan.cdetc.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tanlan.cdetc.entity.Student;
import com.tanlan.cdetc.service.ClassService;
import com.tanlan.cdetc.service.CollegeService;
import com.tanlan.cdetc.service.MajorService;
import com.tanlan.cdetc.service.StudentService;

@Controller
@RequestMapping("student")
public class StudentController {
	@Resource
	private StudentService studentService;
	@Resource
	private CollegeService collegeService;
	@Resource
	private MajorService majorService;
	@Resource
	private ClassService classService;

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Model model) {
		model.addAttribute("colleges", collegeService.getColleges());
		model.addAttribute("majors", majorService.getMajors());
		model.addAttribute("classes", classService.getClasses());
		return "structure/student_add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(Student student) {
		studentService.addStudent(student);
		return "redirect:/student/list";
	}

	@RequestMapping("list")
	public String list(Integer page, Student student, Model model) {
		model.addAttribute("colleges", collegeService.getColleges());
		model.addAttribute("majors", majorService.getMajors());
		model.addAttribute("classes", classService.getClasses());
		model.addAttribute("pageBean",
				studentService.getStudents(page == null ? 1 : page, student));
		return "structure/student_list";
	}

	@RequestMapping("select")
	public String select(Integer page, Student student, Model model) {
		model.addAttribute("classes", classService.getClasses());
		model.addAttribute("pageBean",
				studentService.getStudents(page == null ? 1 : page, student));
		return "admin/student_select";
	}
}
