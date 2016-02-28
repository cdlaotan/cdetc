package com.tanlan.cdetc.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tanlan.cdetc.entity.Paper;
import com.tanlan.cdetc.service.PaperService;

@Controller
@RequestMapping("paper")
public class PaperController {
	@Resource
	private PaperService paperService;

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() {
		return "exam/paper_add";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(Paper paper,String[] quesIds,int[] scores) {
		paperService.addPaper(paper, quesIds, scores);
		return "redirect:/paper/list";
	}
	
	@RequestMapping("list")
	public String list(Model model){
		model.addAttribute("papers", paperService.getPapers());
		return "exam/paper_listf";
	}
}
