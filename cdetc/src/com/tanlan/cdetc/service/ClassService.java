package com.tanlan.cdetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tanlan.cdetc.entity.Clazz;
import com.tanlan.cdetc.utils.EtcUtils;

@Service
public class ClassService {
	@Resource
	private DAO dao;

	public void addClass(Clazz clazz) {
		clazz.setStatus("1");
		String sql = "insert into etc_class values(?,?,?,?,?,?,?)";
		Object[] params = { EtcUtils.getId(), clazz.getName(), clazz.getType(),
				clazz.getStuNums(), clazz.getStartTime(), clazz.getEndTime(),
				clazz.getStatus() };
		dao.execSQL(sql, params);
	}

	public List<Clazz> getClasses() {
		String sql = "select c.*,s.name subjectname from etc_class c,etc_subject s where c.type=s.id";
		return dao.getResult(sql, Clazz.class);
	}
}
