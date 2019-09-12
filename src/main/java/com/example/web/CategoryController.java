package com.example.web;

import com.example.entity.Category;
import com.example.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("category")
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/findAll.do")
	public String findAll(ModelMap map){
		List<Category> parents = categoryService.findAll();
		System.out.println("parents:"+parents);
		map.addAttribute("parents", parents);
		return "/jsps/left";
	}
}
