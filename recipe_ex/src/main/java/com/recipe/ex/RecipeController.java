package com.recipe.ex;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/recipe/*")
public class RecipeController {

	
	@GetMapping("view")
	public void view() {
		
		
	}
}
