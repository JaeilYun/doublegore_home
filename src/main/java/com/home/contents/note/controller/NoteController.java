package com.home.contents.note.controller;

import com.home.common.annotation.breadcrumb.Breadcrumb;
import com.home.common.annotation.menu.Menu;
import com.home.common.types.MenuTypes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/note")
public class NoteController {
	private static final Logger log = LoggerFactory.getLogger(NoteController.class);

	@Menu(type = MenuTypes.NOTE)
	@Breadcrumb(values = { "note.main" })
	@RequestMapping(value = "/main")
	public ModelAndView main() {
		log.debug("[NoteController] main()");
		
		ModelAndView mav = new ModelAndView("note/noteMain");
		
		return mav;
	}
}
