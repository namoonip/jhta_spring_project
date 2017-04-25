package kr.co.jhta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class JejukController {

	@RequestMapping("/jejukmain")
	public String jejukMain(String keyword, Model model) {
		return "collegeregister/adminjejukmain";
	}
}
