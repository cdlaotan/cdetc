package com.tanlan.cdetc.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tanlan.cdetc.entity.Knowledge;
import com.tanlan.cdetc.service.KnowledgeService;

@Controller
@RequestMapping("knowledge")
public class KnowledgeController {
	@Resource
	private KnowledgeService knowledgeService;

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() {
		return "study/knowledge_add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(Knowledge knowledge) {
		knowledgeService.addKnowledge(knowledge);
		return "study/knowledge_add";
	}

	@RequestMapping("list")
	public String list(Model model) {

		return "study/knowledge_list";
	}

	@RequestMapping(value = "get/{chapterId}", produces = "application/json")
	@ResponseBody
	public List<Knowledge> getKnowledgesByChapterId(@PathVariable String chapterId) {
		return knowledgeService.getKnowledges(chapterId);

	}
}
