package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.NoticeDto;

@Mapper
public interface INoticeDao {

	List<NoticeDto> list();

	List<NoticeDto> listPageDao(String start, String end);
	
	public int hit(String notice_idx);
	
	public NoticeDto contentView(String notice_idx);
	
	public List<NoticeDto> noticeList();
	public NoticeDto noticeContents(String notice_idx);
	public int writeNoticeDto(NoticeDto noticeDto);
	public int writeNotice(String notice_name, String notice_title, String notice_content, String notice_img);
	public int deleteNotice(String notice_idx);
	public int updateNotice(String notice_idx, String notice_name, String notice_title, String notice_img, String notice_content);
	public int noticeHit(String notice_idx);
	
}
