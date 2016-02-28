package com.tanlan.cdetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tanlan.cdetc.entity.Major;
import com.tanlan.cdetc.utils.EtcUtils;

@Service
public class MajorService {
	@Resource
	private DAO dao;

	public void addMajor(Major major) {
		String sql = "insert into etc_major values(?,?,?,?)";
		dao.execSQL(sql, EtcUtils.getId(), major.getName(),
				major.getRelevant(), major.getStuNums());
	}

	public List<Major> getMajors() {
		return dao.getResult("select * from etc_major", Major.class);
	}
}
