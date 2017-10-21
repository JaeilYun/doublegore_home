package com.home.contents.note.controller;

import com.home.common.annotation.breadcrumb.Breadcrumb;
import com.home.common.annotation.menu.Menu;
import com.home.common.types.MenuTypes;
import com.home.contents.note.entity.NoteCategoryEntity;
import com.home.contents.note.service.NoteService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/note")
public class NoteController {
	private static final Logger log = LoggerFactory.getLogger(NoteController.class);

	@Autowired
	NoteService noteService;

	@Menu(type = MenuTypes.NOTE)
	@Breadcrumb(values = { "note.main" })
	@RequestMapping(value = "/main")
	public ModelAndView main() {
		log.debug("[NoteController] main()");
		
		ModelAndView mav = new ModelAndView("note/noteMain");
		return mav;
	}

	@Menu(type = MenuTypes.NOTE)
	@Breadcrumb(values = { "note.main" })
	@RequestMapping(value = "/register")
	public ModelAndView register() {
		log.debug("[NoteController] register()");

		ModelAndView mav = new ModelAndView("note/noteRegister");
		List<NoteCategoryEntity> categoryList = noteService.findNoteCategoryList();

		mav.addObject("categoryList", categoryList);
		return mav;
	}
}
