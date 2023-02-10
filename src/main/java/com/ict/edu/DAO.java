package com.ict.edu;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class DAO {
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	} 

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	//DB처리 메서드들
	
	
	//전체보기 
    public List<VO> getList(){
    	String sql = "select * from members order by m_idx";
    	return jdbcTemplate.query(sql,new RowMapper() {
    		@Override
    		public VO mapRow(ResultSet rs, int rowNum) throws SQLException {
    			VO vo = new VO();
    			vo.setM_idx(rs.getString(1));
    			vo.setM_id(rs.getString(2));
    			vo.setM_pw(rs.getString(3));
    			vo.setM_name(rs.getString(4));
    			vo.setM_reg(rs.getString(5).substring(0, 10));;
    			vo.setM_addr(rs.getString(6));
    			return vo;
    		}
		});
    }
    
    //한개 보기
    public List<VO> getOneList(String m_idx) {
    	String sql = "select * from members where m_idx= ?"/*?->prepare statement*/;
    	return jdbcTemplate.query(sql, new RowMapper() {
    		
    		@Override
    		public VO mapRow(ResultSet rs, int rowNum) throws SQLException {
    			VO vo = new VO();
    			
    			vo.setM_idx(rs.getString(1));
    			vo.setM_id(rs.getString(2));
    			vo.setM_pw(rs.getString(3));
    			vo.setM_name(rs.getString(4));
    			vo.setM_reg(rs.getString(5).substring(0, 10));;
    			vo.setM_addr(rs.getString(6));
    			return vo;
    		}
		},m_idx);
    	
    }
    
    //insert, update, delete=> jdbcTemplate.update(sql, ? 대신 들어갈 값)-> 여러개면 
    //값 여러개 주면 됨
    public int getDelete(String m_idx) {
    	String sql = "delete from members where m_idx = ?";
    	return jdbcTemplate.update(sql,m_idx);
    }
    
    
	
   

}
