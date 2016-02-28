package com.tanlan.cdetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tanlan.cdetc.entity.Course;
import com.tanlan.cdetc.utils.EtcUtils;

@Service
public class CourseService {
	@Resource
	private DAO dao;

	public void addCourse(Course course, String[] subjectIds,
			String[] chapterNames) {
		String courseId = EtcUtils.getId();
		String sql = "select max(orderNum) from etc_course";
		int maxOrderNum = dao.getScalarResult(sql, Integer.class);
		sql = "insert into etc_course values(?,?,?,?,?,?)";
		dao.execSQL(sql, courseId, course.getName(), chapterNames.length,
				maxOrderNum + 1, "1");
		sql = "insert into etc_subject_course values(?,?)";
		Object[][] params = new Object[subjectIds.length][];
		for (int i = 0; i < params.length; i++) {
			params[i] = new Object[] { subjectIds[i], courseId };
		}
		dao.execBatchSQL(sql, params);
		sql = "insert into etc_chapter values(?,?,?,?,?,?)";
		params = new Object[chapterNames.length][];
		for (int i = 0; i < params.length; i++) {
			params[i] = new Object[] { EtcUtils.getId(), chapterNames[i],
					courseId, 0, i + 1, "1" };
		}
		dao.execBatchSQL(sql, params);
	}

	public List<Course> getCourses() {
		return dao.getResult("select * from etc_course", Course.class);
	}

	public List<Course> getCoursesBySubjectId(String subjectId) {
		String sql = "select c.* from etc_course c,etc_subject_course sc where c.id=sc.courseid and sc.subjectid=?";
		return dao.getResult(sql, Course.class, subjectId);
	}
}
