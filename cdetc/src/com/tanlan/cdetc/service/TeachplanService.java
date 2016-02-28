package com.tanlan.cdetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tanlan.cdetc.entity.Teachplan;
import com.tanlan.cdetc.utils.EtcUtils;

@Service
public class TeachplanService {
	@Resource
	private DAO dao;

	public void addTeachpaln(Teachplan teachplan) {
		String sql = "insert into etc_teachplan values(?,?,?,?,?,?)";
		Object[] params = { EtcUtils.getId(), teachplan.getClassId(),
				teachplan.getTeacherId(), teachplan.getStartTime(),
				teachplan.getEndTime(), teachplan.getDescription() };
		dao.execSQL(sql, params);
	}

	public List<Teachplan> getTeachplans() {
		return dao.getResult("select * from etc_teachplan", Teachplan.class);
	}
}
