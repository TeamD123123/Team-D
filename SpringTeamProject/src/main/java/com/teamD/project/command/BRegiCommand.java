package com.teamD.project.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.teamD.project.BDao.BDao;
import com.teamD.project.BDto.BDto;

public class BRegiCommand implements BCommand {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		BDto dto = new BDto();
		dto.setName(request.getParameter("name"));
		dto.setId(request.getParameter("id"));
		dto.setPwd(request.getParameter("pwd"));
		dto.setPwd2(request.getParameter("pwd2"));
		dto.setEmail(request.getParameter("email"));
		dto.setGender(request.getParameter("gender"));
		BDao dao = new BDao();
		dao.regi(dto);
	}

}
