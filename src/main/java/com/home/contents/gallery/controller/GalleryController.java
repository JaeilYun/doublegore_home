package com.home.contents.gallery.controller;

import com.home.common.annotation.breadcrumb.Breadcrumb;
import com.home.common.annotation.menu.Menu;
import com.home.common.types.MenuTypes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/gallery")
public class GalleryController {
	private static final Logger log = LoggerFactory.getLogger(GalleryController.class);

	@Menu(type = MenuTypes.GALLERY)
	@Breadcrumb(values = { "gallery.main" })
	@RequestMapping(value = "/main")
	public ModelAndView main() {
		log.debug("[GalleryController] main()");
		
		ModelAndView mav = new ModelAndView("gallery/galleryMain");
		
		return mav;
	}
}
