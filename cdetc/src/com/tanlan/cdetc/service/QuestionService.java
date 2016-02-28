package com.tanlan.cdetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tanlan.cdetc.entity.Option;
import com.tanlan.cdetc.entity.Question;
import com.tanlan.cdetc.utils.EtcUtils;

@Service
public class QuestionService {
	@Resource
	private DAO dao;

	public void addQuestion(Question question, Option[] options) {
		question.setStatus("1");
		String sql = "insert into etc_question values(?,?,?,?,?,?,?,?)";
		String quesId = EtcUtils.getId();
		Object[] params = { quesId, question.getQuestypeId(),
				question.getSource(), question.getContent(),
				question.getDifficulty(), question.getAnswer(),
				question.getAnalysis(), question.getStatus() };
		dao.execSQL(sql, params);
		// 增加该题型的题目数量
		sql = "update etc_questype set quesnums=quesnums+1 where id=?";
		dao.execSQL(sql, question.getQuestypeId());
		// 若是选择题，增加选项
		if (options != null) {
			sql = "insert into etc_option values(?,?,?,?)";
			Object[][] oparams = new Object[options.length][];
			for (int i = 0; i < oparams.length; i++) {
				oparams[i] = new Object[] { EtcUtils.getId(), quesId,
						options[i].getChoice(), options[i].getOcontent() };
			}
			dao.execBatchSQL(sql, oparams);
		}
		// 1，增加题目知识点中间表
		// 2，增加知识点题目数量
	}

	public List<Question> getQuestions() {
		String sql = "select q.*,qt.name questypename from etc_question q,etc_questype qt where q.questypeid=qt.id";
		return dao.getResult(sql, Question.class);
	}
}
