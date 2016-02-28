package com.tanlan.cdetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tanlan.cdetc.entity.Teacher;
import com.tanlan.cdetc.utils.EtcUtils;

@Service
public class TeacherService {
	@Resource
	private DAO dao;

	public void addTeacher(Teacher teacher) {
		teacher.setStatus("1");
		String sql = "insert into etc_teacher values(?,?,?,?,?,?,?,?,?,?)";
		Object[] params = { EtcUtils.getId(), teacher.getName(),
				teacher.getType(), teacher.getUserId(), teacher.getJobs(),
				teacher.getGender(), teacher.getBirthdate(),
				teacher.getEntryTime(), teacher.getQuitTime(),
				teacher.getStatus() };
		dao.execSQL(sql, params);
	}

	public List<Teacher> getTeachers() {
		String sql = "select t.*,s.name subjectname from etc_teacher t left join etc_subject s on t.type=s.id order by t.status,t.entrytime";
		return dao.getResult(sql, Teacher.class);
	}
}
