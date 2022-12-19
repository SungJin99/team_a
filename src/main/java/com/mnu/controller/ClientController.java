package com.mnu.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mnu.domain.ClientVO;
import com.mnu.domain.Criteria;
import com.mnu.domain.PageDTO;
import com.mnu.service.ClientService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/client/*")
@Log4j
@AllArgsConstructor
public class ClientController {

	private ClientService service;

	@GetMapping(value = "/list")
	public void list(Criteria cri, Model model){
		log.info("list: " + cri);
		
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping(value = "/register")
	public void register() {
		
	}
	
	@PostMapping(value = "/register")
	public String register(ClientVO client, RedirectAttributes rttr) {
		log.info("register: " + client);
		
		service.register(client);
		
		rttr.addFlashAttribute("result", client.getClientid());
		
		return "redirect:/client/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("clientid") Long clientid, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("client", service.get(clientid));
	}
	
	@PostMapping(value="/modify")
	public String modify(ClientVO client, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + client);
		
		if(service.modify(client)) {
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
	
		return "redirect:/client/list" + cri.getListLink();
	}
	
	@PostMapping(value="/remove")
	public String remove(@RequestParam("clientid") Long clientid, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove: " + clientid);
		
		if(service.remove(clientid)) {
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/client/list" + cri.getListLink();
	}
}
