package com.tanlan.cdetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tanlan.cdetc.entity.Subject;
import com.tanlan.cdetc.utils.EtcUtils;

@Service
public class SubjectService {
	@Resource
	private DAO dao;

	public void addSubject(Subject subject) {
		subject.setStatus("1");
		String sql = "insert into etc_subject values(?,?,?,?,?)";
		Object[] params = { EtcUtils.getId(), subject.getName(),
				subject.getCourseNums(), subject.getClassNums(),
				subject.getStatus() };
		dao.execSQL(sql, params);
	}

	public List<Subject> getSubjects() {
		return dao.getResult("select * from etc_subject", Subject.class);
	}
}
