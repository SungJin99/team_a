package com.mnu.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mnu.domain.RepairCheckListVO;
import com.mnu.domain.Criteria;
import com.mnu.domain.PageDTO;
import com.mnu.service.RepairCheckListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/checklist/*")
@Log4j
@AllArgsConstructor
public class CheckListController {

	private RepairCheckListService service;

	@GetMapping(value = "/list")
	public void list(Criteria cri, Model model){
		log.info("list: " + cri);
		
		model.addAttribute("checkList", service.getList(cri));

		int total = service.getTotal(cri);
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping(value = "/register")
	public void register(Model model) {
		model.addAttribute("checkList", service.getList());
	}
	
	@PostMapping(value = "/register")
	public String register(RepairCheckListVO checkList, RedirectAttributes rttr) {
		log.info("register: " + checkList);
		
		service.register(checkList);
		
		rttr.addFlashAttribute("result", checkList.getCheckListid());
		
		return "redirect:/checklist/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("checkListid") Long checkListid, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("checkList", service.get(checkListid));
		model.addAttribute("list", service.getList());
	}
	
	@PostMapping(value="/modify")
	public String modify(RepairCheckListVO checkList, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + checkList);
		
		if(service.modify(checkList)) {
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
	
		return "redirect:/checklist/list" + cri.getListLink();
	}
	
	@PostMapping(value="/remove")
	public String remove(@RequestParam("checkListid") Long checkListid, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove: " + checkListid);
		
		if(service.remove(checkListid)) {
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/checklist/list" + cri.getListLink();
	}
}
