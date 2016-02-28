package com.tanlan.cdetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tanlan.cdetc.entity.College;
import com.tanlan.cdetc.utils.EtcUtils;

@Service
public class CollegeService {
	@Resource
	private DAO dao;

	public void addCollege(College college) {
		String sql = "insert into etc_college values(?,?,?)";
		dao.execSQL(sql, EtcUtils.getId(), college.getName(),
				college.getStuNums());
	}

	public List<College> getColleges() {
		return dao.getResult("select * from etc_college", College.class);
	}
}
