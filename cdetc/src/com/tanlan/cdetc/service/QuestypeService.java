package com.tanlan.cdetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tanlan.cdetc.entity.Questype;
import com.tanlan.cdetc.utils.EtcUtils;

@Service
public class QuestypeService {
	@Resource
	private DAO dao;

	public void addQuestype(Questype questype) {
		dao.execSQL("insert into etc_questype values(?,?,?)", EtcUtils.getId(),
				questype.getName(), questype.getQuesNums());
	}

	public List<Questype> getQuestypes() {
		return dao.getResult("select * from etc_questype", Questype.class);
	}

}
