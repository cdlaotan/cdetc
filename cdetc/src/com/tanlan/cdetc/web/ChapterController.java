package com.tanlan.cdetc.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tanlan.cdetc.entity.Chapter;
import com.tanlan.cdetc.service.ChapterService;

@Controller
@RequestMapping("chapter")
public class ChapterController {
	@Resource
	private ChapterService chapterService;

	@RequestMapping(value = "list/{courseId}", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<Chapter> list(@PathVariable String courseId) {
		return chapterService.getChaptersByCourseId(courseId);
	}

	@RequestMapping(value = "get/{courseId}", produces = "application/json")
	@ResponseBody
	public List<Chapter> getChaptersByCourseId(@PathVariable String courseId) {
		return chapterService.getChaptersByCourseId(courseId);
	}
}
