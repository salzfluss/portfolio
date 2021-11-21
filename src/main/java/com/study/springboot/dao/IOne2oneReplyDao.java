package com.study.springboot.dao;

import java.sql.Date;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.study.springboot.dto.One2oneReplyDto;


@Mapper
public interface IOne2oneReplyDao {

	
	
	public int reply(String one2one_reply_idx, String one2one_reply_name, String one2one_reply_title, String one2one_reply_content);

	public List<One2oneReplyDto> list(String one2one_idx);
	
	public List<One2oneReplyDto> reply_list(String one2one_idx);
	
	public int modify( String one2one_reply_idx, String one2one_reply_name, 
			String one2one_reply_title, String one2one_reply_content );
	
	

}
