package com.kg.fieldluxe;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kg.fieldluxe.commons.SearchVO;
import com.kg.fieldluxe.product.model.ListData;
import com.kg.fieldluxe.product.service.IProductService;

@Controller
public class HomeController {
	
	@Autowired
	private IProductService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model, SearchVO search) {
		List<ListData> list = service.getProductList(search);
		model.addAttribute("productList", list);
		return "main";
	}
	
}
