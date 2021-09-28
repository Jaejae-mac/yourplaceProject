package com.yourplace.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

	@GetMapping(value="/index-admin.mdo")
	public void index()
	{
		System.out.println("[Controller] Index Page 호출");
	}
	
}
