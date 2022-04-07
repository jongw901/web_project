package com.home.page;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.home.service.BoardService;
import com.home.service.ReplyService;
import com.home.vo.PageMaker;
import com.home.vo.SearchCriteria;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Inject
	BoardService service;
	@Inject
	ReplyService replyservice;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, @ModelAttribute("scri") SearchCriteria scri, @ModelAttribute("scri_notice") SearchCriteria scri_notice) throws Exception {
		
		logger.info("HOME");
		scri_notice.setHome("y");
		scri.setHome("y");
		
		model.addAttribute("list_notice", service.list_notice(scri_notice));
		model.addAttribute("list", service.list(scri));
		
		
			
		return "home";
	}

	
}
