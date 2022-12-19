package com.mnu.controller;


import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mnu.domain.CarAttachVO;
import com.mnu.domain.CarVO;
import com.mnu.domain.Criteria;
import com.mnu.domain.PageDTO;
import com.mnu.service.CarService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/car/*")
@Log4j
@AllArgsConstructor
public class CarController {
	
	private CarService service;
	
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
	public String register(CarVO car, RedirectAttributes rttr) {
		log.info("=========================");
		log.info("register: " + car);
		//service.register(car);
		
//		if(car.getAttachList() != null) {
//			car.getAttachList().forEach(attach -> log.info(attach));
//			log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//		}
		
		log.info("=========================");
		
		service.register(car);
		
		rttr.addFlashAttribute("result", car.getCarid());
		
		return "redirect:/car/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("carid") Long carid, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("car", service.get(carid));
	}
	
	@PostMapping(value="/modify")
	public String modify(CarVO car, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + car);
		
		if(service.modify(car)) {
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
	
		return "redirect:/car/list" + cri.getListLink();
	}
	
	@PostMapping(value="/remove")
	public String remove(@RequestParam("carid") Long carid, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove: " + carid);
		
		List<CarAttachVO> attachList = service.getCarAttachList(carid);
		
		if(service.remove(carid)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/car/list" + cri.getListLink();
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<CarAttachVO>> getAttachList(Long carid) {

		log.info("getAttachList " + carid);

		return new ResponseEntity<>(service.getCarAttachList(carid), HttpStatus.OK);

	}
	
	private void deleteFiles(List<CarAttachVO> attachList) {

		if (attachList == null || attachList.size() == 0) {
			return;
		}

		log.info("delete attach files...................");
		log.info(attachList);

		attachList.forEach(attach -> {
			try {
				Path file = Paths.get(
						"d:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());

				Files.deleteIfExists(file);

				if (Files.probeContentType(file).startsWith("image")) {

					Path thumbNail = Paths.get("d:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_"
							+ attach.getFileName());

					Files.delete(thumbNail);
				}

			} catch (Exception e) {
				log.error("delete file error" + e.getMessage());
			} // end catch
		});// end foreachd
	}
	
}
