package com.tanlan.cdetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tanlan.cdetc.entity.Knowledge;
import com.tanlan.cdetc.utils.EtcUtils;

@Service
public class KnowledgeService {
	@Resource
	private DAO dao;

	public void addKnowledge(Knowledge knowledge) {
		knowledge.setStatus("1");
		String sql = "insert into etc_knowledge values(?,?,?,?,?,?)";
		Object[] params = { EtcUtils.getId(), knowledge.getName(),
				knowledge.getChapterId(), knowledge.getDetails(),
				knowledge.getQuesNums(), knowledge.getStatus() };
		dao.execSQL(sql, params);
		// 所属章节的知识点数量增加1
		sql = "update etc_chapter set knownums=knownums+1 where id=?";
		dao.execSQL(sql, knowledge.getChapterId());
	}
	
	public List<Knowledge> getKnowledges(String chapterId){
		String sql="select * from etc_knowledge where chapterId=?";
		return dao.getResult(sql, Knowledge.class, chapterId);
	}
}
