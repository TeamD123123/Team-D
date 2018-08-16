package com.teamD.project.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.teamD.project.BDao.BDao;
import com.teamD.project.BDto.BDto;

public class BLoginCommand implements BCommand {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String id = request.getParameter("loginId");
		String pwd = request.getParameter("loginPwd");
		BDao dao = new BDao();
		BDto dto = dao.login(id, pwd);
		String dbPwd = dto.getPwd();
		System.out.println(dbPwd);
		System.out.println(pwd);
		if(dbPwd.equals(pwd)) {
			session.setAttribute("sessionID", id);
		}
		
	}

}
