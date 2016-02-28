package com.tanlan.cdetc.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tanlan.cdetc.entity.Course;
import com.tanlan.cdetc.service.CourseService;
import com.tanlan.cdetc.service.SubjectService;

@Controller
@RequestMapping("course")
public class CourseController {
	@Resource
	private CourseService courseService;
	@Resource
	private SubjectService subjectService;

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Model model) {
		model.addAttribute("subjects", subjectService.getSubjects());
		return "study/course_add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(Course course, String[] subjectIds, String[] chapterNames) {
		courseService.addCourse(course, subjectIds, chapterNames);
		return "redirect:/course/list";
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("courses", courseService.getCourses());
		return "study/course_list";
	}

	@RequestMapping(value = "ajax", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<Course> list() {
		return courseService.getCourses();
	}

	@RequestMapping(value = "get/{subjectId}", produces = "application/json")
	@ResponseBody
	public List<Course> getCoursesBySubjectId(@PathVariable String subjectId) {
		return courseService.getCoursesBySubjectId(subjectId);
	}
}
