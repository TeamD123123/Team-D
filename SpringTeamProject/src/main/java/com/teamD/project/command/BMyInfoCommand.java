package com.teamD.project.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.teamD.project.BDao.BDao;

public class BMyInfoCommand implements BCommand {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String name = request.getParameter("mName");
		String pwd = request.getParameter("mPwd");
		String email = request.getParameter("mEmail");
		String Sid = (String)session.getAttribute("sessionID");
		System.out.println(Sid);
		BDao dao = new BDao();
		dao.myInfo(name, pwd, email, Sid);
	}
}
