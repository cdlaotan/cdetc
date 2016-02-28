package com.tanlan.cdetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tanlan.cdetc.entity.Chapter;

@Service
public class ChapterService {

	@Resource
	private DAO dao;

	/**
	 * 根据课程ID查询其所有的章节
	 * 
	 * @param courseId
	 * @return
	 */
	public List<Chapter> getChaptersByCourseId(String courseId) {
		return dao.getResult("select id,name from etc_chapter where courseId=? ",
				Chapter.class, courseId);
	}
}
