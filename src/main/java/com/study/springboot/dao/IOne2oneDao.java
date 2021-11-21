package com.study.springboot.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.study.springboot.dto.One2oneDto;




@Mapper
public interface IOne2oneDao {
	List<One2oneDto> list();

	List<One2oneDto> listPageDao(String start, String end);

	One2oneDto viewDao(String one2one_idx);
	
	public int modify( String one2one_idx, String one2one_category, String one2one_img, String one2one_name, String one2one_pw,
			String one2one_title, String one2one_content );
	
	public int write( String one2one_category, String one2one_img, String one2one_name, String one2one_pw,
			String one2one_title, String one2one_content );

	public int delete(String one2one_idx);

}

