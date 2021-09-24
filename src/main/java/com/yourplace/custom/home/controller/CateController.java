package com.yourplace.custom.home.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yourplace.custom.home.service.CategoryService;
import com.yourplace.custom.home.vo.PlaceCardVO;

@Controller
public class CateController {
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/category.do")
	public String categoryForm(@RequestParam String maincate, @RequestParam String subcate, Model model) {
		List<PlaceCardVO> list = categoryService.getCatePlace(maincate, subcate);
		if(list != null) {
			model.addAttribute("placeCateList", list);
		}
		System.out.println(maincate);
		System.out.println(subcate);
		return "indexCategory";
	}
}
