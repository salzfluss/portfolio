package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.study.springboot.dto.ReviewDto;


@Mapper
public interface IReviewDao {

	public List<ReviewDto> review_list(String item_idx);
	public int reviewForm(ReviewDto review_dto);

	public ReviewDto itemListReview(String review_idx);
	
	public int review_write( int item_idx_fk, String review_image, String review_name,
			String review_content, String review_score);
	public int review_delete(String review_idx);
}
