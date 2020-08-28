package project.qrpay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("store")
public class StoreController {
	
	@RequestMapping("/")
	public String main() {
		
		return "storepage/storeSet";
	} //main();
	
	@RequestMapping("header")
	public String header() {
		
		return "storepage/header";
	}
	
	@RequestMapping("category")
	public String category() {
		
		return "storepage/category";
	}
	
	@RequestMapping("menuSet")
	public String menuSet() {
		
		return "storepage/menuSet";
	}
	
	@RequestMapping("menuAdd")
	public String menuAdd() {
		
		return "storepage/menuAdd";
	}
	
} //StoreController();