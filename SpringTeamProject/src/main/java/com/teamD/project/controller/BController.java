package com.teamD.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamD.project.command.BCommand;
import com.teamD.project.command.BMyInfoCommand;
import com.teamD.project.command.BLoginCommand;
import com.teamD.project.command.BRegiCommand;
import com.teamD.project.util.Constant;

@Controller
public class BController {
	BCommand command;
	JdbcTemplate template;
	@Autowired
	public BController(JdbcTemplate template) {
		this.template = template;
		Constant.template = this.template;
	}
	
	@RequestMapping("/index")
	public String test(Model model) {
		
		return "index";
	}
	
	@RequestMapping("/regi")
	public String regi(HttpServletRequest request, Model model) {
		System.out.println("regi()");
		model.addAttribute("request", request);
		command = new BRegiCommand();
		command.execute(model);
		return "redirect:index";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model) {
		System.out.println("login()");
		model.addAttribute("request", request);
		command = new BLoginCommand();
		command.execute(model);
		return "redirect:index";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		System.out.println("logout()");
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:index";
	}
	
	@RequestMapping("/myInfo")
	public String myInfo(HttpServletRequest request, Model model) {
		System.out.println("myInfo()");
		model.addAttribute("request", request);
		command = new BMyInfoCommand();
		command.execute(model);
		return "redirect:index";
	}
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		System.out.println("list()");
		model.addAttribute("request", request);
		
		return "list";
	}
}
