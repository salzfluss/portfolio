package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDto {

	private int review_idx;      
	private int item_idx_fk;
	private String review_image;   
    private Date review_date;    
    private String review_name;    
    private String review_content; 
    private String review_score;
    

	public ReviewDto() {
		
	}       
	
    
    public ReviewDto(int review_idx, int item_idx_fk, String review_image, Date review_date, String review_name,
			String review_content, String review_score) {
		super();
		this.review_idx = review_idx;
		this.item_idx_fk = item_idx_fk;
		this.review_image = review_image;
		this.review_date = review_date;
		this.review_name = review_name;
		this.review_content = review_content;
		this.review_score = review_score;
	}


	public int getReview_idx() {
		return review_idx;
	}


	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}


	public int getItem_idx_fk() {
		return item_idx_fk;
	}


	public void setItem_idx_fk(int item_idx_fk) {
		this.item_idx_fk = item_idx_fk;
	}


	public String getReview_image() {
		return review_image;
	}


	public void setReview_image(String review_image) {
		this.review_image = review_image;
	}


	public Date getReview_date() {
		return review_date;
	}


	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}


	public String getReview_name() {
		return review_name;
	}


	public void setReview_name(String review_name) {
		this.review_name = review_name;
	}


	public String getReview_content() {
		return review_content;
	}


	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}


	public String getReview_score() {
		return review_score;
	}


	public void setReview_score(String review_score) {
		this.review_score = review_score;
	}




	
    
}
