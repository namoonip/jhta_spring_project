package kr.co.jhta.controller.board;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jhta.dao.lecture.LectureDao;
import kr.co.jhta.service.board.BoardService;
import kr.co.jhta.service.lecture.LectureService;
import kr.co.jhta.service.sitemap.SitemapService;
import kr.co.jhta.vo.BoardForm;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private SitemapService sitemapSerivce;
	
	
	@RequestMapping("/board")
	public String board () {
		return "/board/board";
	}
	
	@RequestMapping(value="/boardForm", method=RequestMethod.GET)
	public String boardForm(Model model){
		
		model.addAttribute("boardForm", new BoardForm());
		return "/board/boardForm";
	}
	
	@RequestMapping(value="/boardform", method=RequestMethod.POST)
	public String addBoard(@Valid BoardForm boardForm, Errors errors){
		if (errors.hasErrors()) {
			return "/board/boardform";
		}
		
		
		// boardForm DB 저장
		
		
		
		return "redirect:/board/board";
		
	}
	
	@RequestMapping("/boardmanagement")
	public String boardManagement(Model model){
		model.addAttribute("majorList", sitemapSerivce.getAllSitemapSecService());
		return "/board/boardmanagement";
	}
	
}
