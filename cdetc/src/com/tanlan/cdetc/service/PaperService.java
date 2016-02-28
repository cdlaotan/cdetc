package com.tanlan.cdetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tanlan.cdetc.entity.Paper;
import com.tanlan.cdetc.utils.EtcUtils;

@Service
public class PaperService {
	@Resource
	private DAO dao;

	public void addPaper(Paper paper, String[] quesIds, int[] scores) {
		String id = EtcUtils.getId();
		String sql = "insert into etc_paper values(?,?,?,?,?,?)";
		Object[] params = { id, paper.getDescription(), paper.getDuration(),
				paper.getQuesNums(), paper.getUserId() };
		dao.execSQL(sql, params);
		sql = "insert into etc_paperdetail values(?,?,?,?)";
		Object[][] params2 = new Object[quesIds.length][];
		for (int i = 0; i < params2.length; i++) {
			params2[i] = new Object[] { id, quesIds[i], scores[i], i + 1 };
		}
		dao.execBatchSQL(sql, params);
	}

	public List<Paper> getPapers() {
		return dao.getResult("select * from etc_paper", Paper.class);
	}
}
