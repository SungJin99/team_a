package com.mnu.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mnu.domain.RentVO;
import com.mnu.domain.Criteria;
import com.mnu.domain.PageDTO;
import com.mnu.service.RentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/rent/*")
@Log4j
@AllArgsConstructor
public class RentController {

	private RentService service;

	@GetMapping(value = "/list")
	public void list(Criteria cri, Model model){
		log.info("list: " + cri);
		
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping(value = "/register")
	public void register(Model model) {
		model.addAttribute("car", service.getCarList());
		model.addAttribute("client", service.getClientList());
	}
	
	@PostMapping(value = "/register")
	public String register(RentVO rent, RedirectAttributes rttr) {
		log.info("register: " + rent);
		
		service.register(rent);
		
		rttr.addFlashAttribute("result", rent.getRentid());
		
		return "redirect:/rent/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("rentid") Long rentid, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("rent", service.get(rentid));
		model.addAttribute("car", service.getCarList());
		model.addAttribute("client", service.getClientList());
	}
	
	@PostMapping(value="/modify")
	public String modify(RentVO rent, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + rent);
		
		if(service.modify(rent)) {
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
	
		return "redirect:/rent/list" + cri.getListLink();
	}
	
	@PostMapping(value="/remove")
	public String remove(@RequestParam("rentid") Long rentid, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove: " + rentid);
		
		if(service.remove(rentid)) {
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/rent/list" + cri.getListLink();
	}
}
