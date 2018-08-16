package com.teamD.project.BDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import com.teamD.project.BDto.BDto;
import com.teamD.project.command.BCommand;
import com.teamD.project.util.Constant;

public class BDao {
	String dbPwd = "";
	JdbcTemplate template;
	BCommand command;
	public BDao() {
		this.template = Constant.template;
	}
	public void regi(final BDto dto) {
		
		template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				String sql = "insert into member (name, id, pwd, pwd2, email, gender) values(?,?,?,?,?,?)";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getId());
				pstmt.setString(3, dto.getPwd());
				pstmt.setString(4, dto.getPwd2());
				pstmt.setString(5, dto.getEmail());
				pstmt.setString(6, dto.getGender());
				return pstmt;
			}
		});
	}
	public BDto login(String id, String pwd) {
		String sql= "select * from member where id = "+"'" + id+"'";
		return template.queryForObject(sql, new BeanPropertyRowMapper<BDto>(BDto.class));
//		String sql= "select pwd from member where id = ?";
//		String passwd = template.queryForObject(sql, new Object[] { id }, String.class);
//		System.out.println("password = " + passwd);
//		return null;
	}
	
}
