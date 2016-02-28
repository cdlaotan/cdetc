package com.tanlan.cdetc.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tanlan.cdetc.entity.Option;
import com.tanlan.cdetc.entity.Question;
import com.tanlan.cdetc.service.QuestionService;
import com.tanlan.cdetc.service.QuestypeService;

@Controller
@RequestMapping("question")
public class QuestionController {
	@Resource
	private QuestypeService questypeService;
	@Resource
	private QuestionService questionService;

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(Model model) {
		model.addAttribute("questypes", questypeService.getQuestypes());
		return "exam/question_add";
	}

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(Question question, String[] knowIds, String[] choice,
			String[] ocontent) {
		Option[] options = null;
		if (choice != null) {
			options = new Option[choice.length];
			for (int i = 0; i < options.length; i++) {
				Option option = new Option();
				option.setChoice(choice[i]);
				option.setOcontent(ocontent[i]);
				options[i] = option;
			}
		}
		questionService.addQuestion(question, options);
		return "exam/question_add";
	}

	@RequestMapping("list")
	public String list(Model model) {
		model.addAttribute("questions", questionService.getQuestions());
		return "exam/question_list";
	}
}
