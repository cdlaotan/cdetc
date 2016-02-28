package com.tanlan.cdetc.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tanlan.cdetc.entity.Questype;
import com.tanlan.cdetc.service.QuestypeService;

@Controller
@RequestMapping("questype")
public class QuestypeController {
	@Resource
	private QuestypeService questypeService;

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() {
		return "exam/questype_add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(Questype questype) {
		questypeService.addQuestype(questype);
		return "";
	}

	@RequestMapping("list")
	public String list(Model model) {
		model.addAttribute("questypes", questypeService.getQuestypes());
		return "exam/questype_list";
	}
	
	@RequestMapping(value="ajax",produces="application/json")
	@ResponseBody
	public List<Questype> list() {
		return questypeService.getQuestypes();
	}
}
