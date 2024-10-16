package mvc.cgapp.controller;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.cj.Session;

import jakarta.servlet.http.HttpSession;
import mvc.cgapp.model.AdminModel;
import mvc.cgapp.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	
	
	@RequestMapping("/adminloginpage")
	public String adminLogin(@ModelAttribute("admindetails") AdminModel adminModel) {
		return "AdminLoginPage";
	}
	
	@PostMapping("/validadmin")
	public String checkAdmin(AdminModel adminModel,Model model,HttpSession session) {
		String adminName=adminModel.getAdminName();
		String adminPass=adminModel.getAdminPassword();
		System.out.println(adminName+adminPass);
		
		
		boolean res=adminService.checkValidAdmin(adminName, adminPass);
		if(res==true) {
			session.setAttribute("adminName", adminName);
			session.setAttribute("adminPass", adminPass);
			System.out.println("hii");
			return "redirect:/adminside";
		}else {
		model.addAttribute("msg","Invalid Credentials ☹️");
		return "AdminLoginPage";
		}
	}
	
	@RequestMapping("/")
	public String indexPage() {
		return "index";
	}
	
	@RequestMapping("/logoutbtn")
	public String logoutbtn(HttpSession session) {
		session.invalidate();
		return "index";
	}

}
