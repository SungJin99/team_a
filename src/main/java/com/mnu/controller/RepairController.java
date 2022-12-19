package com.mnu.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mnu.domain.Criteria;
import com.mnu.domain.PageDTO;
import com.mnu.domain.RepairVO;
import com.mnu.service.RepairService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/repair/*")
@Log4j
@AllArgsConstructor
public class RepairController {
	
	private RepairService service;

	@GetMapping(value = "/list")
	public void list(Criteria cri, Model model){
		log.info("list: " + cri);
		
		model.addAttribute("repair", service.getList(cri));
		int total = service.getTotal(cri);
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping(value = "/register")
	public void register(Model model) {
		model.addAttribute("car", service.getCarList());
		model.addAttribute("checklist", service.getCheckList());
	}
	
	@PostMapping(value = "/register")
	public String register(RepairVO repair, RedirectAttributes rttr) {
		log.info("register: " + repair);
		
		service.register(repair);
		
		rttr.addFlashAttribute("result", repair.getRepairid());
		
		return "redirect:/repair/list";
	}

	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("repairid") Long repairid, String series, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("repair", service.get(repairid));
		model.addAttribute("car", service.getCarList());
		model.addAttribute("checkList", service.getCheckList());

	}
	
	@PostMapping(value="/modify")
	public String modify(RepairVO repair, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + repair);
		
		if(service.modify(repair)) {
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
	
		return "redirect:/repair/list" + cri.getListLink();
	}
	
	@PostMapping(value="/remove")
	public String remove(@RequestParam("repairid") Long repairid, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove: " + repairid);
		
		if(service.remove(repairid)) {
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/repair/list" + cri.getListLink();
	}
}
