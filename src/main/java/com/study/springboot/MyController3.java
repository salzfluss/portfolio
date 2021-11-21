
package com.study.springboot;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.springboot.dao.IItemsDao;
import com.study.springboot.dao.IItemsQnADao;
import com.study.springboot.dao.IMemberDao;
import com.study.springboot.dao.INoticeDao;
import com.study.springboot.dao.IOrderListDao;
import com.study.springboot.dao.IQnAAnswerDao;
import com.study.springboot.dao.IReviewDao;
import com.study.springboot.dto.ItemsDto;
import com.study.springboot.dto.ItemsQnADto;
import com.study.springboot.dto.QnAAnswerDto;
import com.study.springboot.dto.ReviewDto;
import com.study.springboot.service.FileUploadService;
import com.study.springboot.service.FileUploadService2;
import com.study.springboot.service.ItemsService;
import com.study.springboot.service.MemberService;


@Controller
public class MyController3 {

	
	@Autowired // 객체 초기화
	private INoticeDao noticeDao;
	
	@Autowired
	private IOrderListDao orderListDao;
	
	@Autowired
	private IMemberDao memberDao;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	FileUploadService fileUploadService;
	
	@Autowired
	FileUploadService2 fileUploadService2;
	
	@Autowired
	private ItemsService itemsService;

	@Autowired
	private IItemsDao dao;
	
	@Autowired
	private IReviewDao review_dao;
	
	@Autowired
	private IItemsQnADao items_qna_dao;
	
	@Autowired
	private IQnAAnswerDao qna_answer_dao;

	
	// 관리자-아이템 부분
	
	@RequestMapping("/items_list")
	public String list( Model model ) throws Exception {
		
		
		
		model.addAttribute("list", dao.list());
		
		
        return "admin/items_list";
	}
	

	@RequestMapping("items_delete")
	public String delete( @RequestParam("item_idx") String item_idx, Model model ) {
		
		dao.item_delete(item_idx);
		
		return "redirect:/items_list" ;
		
	}
	
	@RequestMapping("items_list_contents")
	public String item_list_content(@RequestParam("item_idx") String item_idx, Model model ) {
		
		model.addAttribute("dto", dao.itemsContent(item_idx));
		
		model.addAttribute("review_list", review_dao.review_list(item_idx));
		
		model.addAttribute("items_qna_list", items_qna_dao.items_qna_list(item_idx));

		
		return "admin/items_list_contents";
	}
	
	@RequestMapping("items_correction")
	public String itemsCorrection( @RequestParam("item_idx") String item_idx, Model model ) {
		model.addAttribute("dto", dao.item_correction(item_idx));
		
		return "admin/items_correction";
		
	}
	
	@RequestMapping("itemsUpdate")
	public String itemsUpdate( @RequestParam("item_idx") String item_idx,
							  @RequestParam("item_category") String item_category,
							  @RequestParam("item_option") String item_option,
							  @RequestParam("item_name") String item_name,
							  @RequestParam("item_price") String item_price,
							  @RequestParam("item_MainImg") MultipartFile item_MainImg,
							  @RequestParam("item_img") MultipartFile item_img,
							  @RequestParam("item_content") String item_content,
							 Model model ) {
		
		
		System.out.println("item_MainImg:" + item_MainImg );
		System.out.println("item_img:" + item_img );
		Long size = item_MainImg.getSize();
		Long size2 = item_img.getSize();
		System.out.println("size" + size);
		System.out.println("size2" + size2);
		
	
			
			System.out.println("file is not null!");
			String url = fileUploadService.restore(item_MainImg);
			String url2 = fileUploadService.restore2(item_img);
			
			
			//String url = fileUploadService.restore(file);
			//String url을 정의 = fileuploadservice의 restore() 함수의 결과값으로 나오는 url을 대입.
			System.out.println("url:" + url);
			System.out.println("url2:" + url2);
			//url: C:/Users/SOGMi/Documents/SKK/springboot/Ex13_FileUplpoadWithParam/src/main/resources/static/img/user/파일명.jpg
			model.addAttribute("url", url);
			model.addAttribute("url2", url2);
			
			//"url"이라는 이름의 model에 url값을 저장
			
		
		
		
		dao.itemsUpdate(item_idx, item_category, item_name, item_price, item_option, url, url2, item_content);
		
		return "redirect:/items_list";
		
	}
	
	@RequestMapping("items_register")
	public String itemsRegister() {
		
	
		
		return "admin/items_register";
	}
	
	
	@RequestMapping("itemsRegisterForm")
	public String itemsRegisterForm( @RequestParam("item_category") String item_category,
		                        	@RequestParam("item_option") String item_option,
									@RequestParam("item_name") String item_name,
									@RequestParam("item_price") String item_price,
									@RequestParam("item_MainImg") MultipartFile item_MainImg,
									@RequestParam("item_img") MultipartFile item_img,
									@RequestParam("item_content") String item_content,
									HttpServletRequest request,
									Model model) {
					
		
		
	
			//"url"이라는 이름의 model에 url값을 저장
			
			String category = request.getParameter("item_category");
			System.out.println("item_category:"+category);
			
			
			if(category.equals("Ring")) {
				System.out.println("--------카테고리가 Ring이다----------");
				
				System.out.println("item_category:"+item_category);
				System.out.println("item_name:"+item_name);
				System.out.println("item_price:"+item_price);
				System.out.println("item_option:"+item_option);
				System.out.println("item_content:"+item_content);
				
				String ring_url = fileUploadService.ring_url(item_MainImg);
				String ring_url2 = fileUploadService.ring_url2(item_img);
				
				System.out.println("ring_url:"+ring_url);
				System.out.println("ring_url2:"+ring_url2);
				dao.write(item_category, item_name, item_price, item_option, ring_url, ring_url2, item_content);
				
			}
			if(category.equals("Necklace")) {
				System.out.println("--------카테고리가 Necklace이다---------");
				
				System.out.println("item_category:"+item_category);
				System.out.println("item_name:"+item_name);
				System.out.println("item_price:"+item_price);
				System.out.println("item_option:"+item_option);
				System.out.println("item_content:"+item_content);
				
				String necklace_url = fileUploadService.necklace_url(item_MainImg);
				String necklace_rul2 = fileUploadService.necklace_url2(item_img);
				
				System.out.println("necklace_url:"+necklace_url);
				System.out.println("necklace_url2:"+necklace_rul2);
				dao.write(item_category, item_name, item_price, item_option, necklace_url, necklace_rul2, item_content);
				
			}
			if(category.equals("Bracelet")) {
				System.out.println("---------카테고리가 Bracelet이다--------");
				
				System.out.println("item_category:"+item_category);
				System.out.println("item_name:"+item_name);
				System.out.println("item_price:"+item_price);
				System.out.println("item_option:"+item_option);
				System.out.println("item_content:"+item_content);
				
				String bracelet_url = fileUploadService.bracelet_url(item_MainImg);
				String bracelet_url2 = fileUploadService.bracelet_url2(item_img);
				
				System.out.println("bracelet_url:"+bracelet_url);
				System.out.println("bracelet_url2:"+bracelet_url2);
				dao.write(item_category, item_name, item_price, item_option, bracelet_url, bracelet_url2, item_content);
				
			}
			if(category.equals("Earring")) {
				System.out.println("---------카테고리가 Earring이다--------");
				
				System.out.println("item_category:"+item_category);
				System.out.println("item_name:"+item_name);
				System.out.println("item_price:"+item_price);
				System.out.println("item_option:"+item_option);
				System.out.println("item_content:"+item_content);
				
				String earring_url = fileUploadService.earring_url(item_MainImg);
				String earring_url2 = fileUploadService.earring_url2(item_img);
				
				System.out.println("earring_url:"+earring_url);
				System.out.println("earring_url2:"+earring_url2);
				dao.write(item_category, item_name, item_price, item_option, earring_url, earring_url2, item_content);
				
			}
			
		
			
		
		return "redirect:/items_list"; //list로 리다이렉트 시킴
	}
	
	
	
	
	// 사용자-아이템 리스트
	@RequestMapping("items_view_all")
	public String allItemsView( HttpServletRequest request, Model model ) {
		
		model.addAttribute("list", dao.list());
		
		String user_id = (String)request.getSession().getAttribute("member_id");
		model.addAttribute("memberDto", memberDao.MyInfoCheckView(user_id));
		
		return "user/items/items_view_all";
	}
	
	
	@RequestMapping("items_view")
	public String itemsView(@RequestParam("item_category") String item_category, Model model) {
		
	
		return "user/items/items_view";
	}
	
	
	
	@RequestMapping("/items_view_best")
	public String bestView(Model model) {
		
		model.addAttribute("list", dao.bestList());
		
		return "user/items/items_view_best";
	}
	
	@RequestMapping("/items_view_new")
	public String newView(Model model) {
		
		model.addAttribute("list", dao.newList());
		
		return "user/items/items_view_new";
	}
	
	@RequestMapping("/items_view_ring")
	public String ringView(Model model) {
		
		model.addAttribute("list", dao.ringList());
		
		return "user/items/items_view_ring";
	}
	
	@RequestMapping("/items_view_necklace")
	public String necklaceView(Model model) {
		
		model.addAttribute("list", dao.necklaceList());
		
		return "user/items/items_view_necklace";
	}
	
	@RequestMapping("/items_view_bracelet")
	public String braceletView(Model model) {
		
		model.addAttribute("list", dao.braceletList());
		
		return "user/items/items_view_bracelet";
	}
	
	@RequestMapping("/items_view_earrings")
	public String earringsView(Model model) {
		
		model.addAttribute("list", dao.earringsList());
		
		return "user/items/items_view_earrings";
	}
	
	
	@RequestMapping("items_content")
	public String itemsContent(@RequestParam("item_idx") String item_idx,  HttpServletRequest request, Model model ) {
		
		model.addAttribute("dto", dao.itemsContent(item_idx));
		
		String user_id = (String)request.getSession().getAttribute("member_id");
		model.addAttribute("memberDto", memberDao.MyInfoCheckView(user_id));
		
		model.addAttribute("review_list", review_dao.review_list(item_idx));
		
		model.addAttribute("items_qna_list", items_qna_dao.items_qna_list(item_idx));
		
		return "user/items/items_content";
	}
	
	@RequestMapping("reviewForm")
	public String reviewForm( @RequestParam("item_idx_fk") int item_idx_fk,
							@RequestParam("review_image") String review_image,
							@RequestParam("review_name") String review_name,
							@RequestParam("review_content") String review_content,
							@RequestParam("review_score") String review_score,
							@RequestParam("item_idx") String item_idx,
							Model model, RedirectAttributes redirectAttributes) {
					
		//SimpleBbsDto dto = new SimpleBbsDto( 0, writer, title, content );
		ReviewDto dto = new ReviewDto(); 
		dto.setItem_idx_fk(item_idx_fk);
		dto.setReview_image(review_image);
		dto.setReview_name(review_name);
		dto.setReview_content(review_content);
		dto.setReview_score(review_score);
		
		//Mybatis에서 insert, update, delete는 자동으로 int타입의 값을 반환해 준다
		//resultType="_int"를 설정하지 않아도 됨. _int : primary type  int : Integer
		int result = review_dao.reviewForm( dto );
		
		//int result = dao.writeDao(writer, title, content);
		System.out.println( "result:" + result);
		
		redirectAttributes.addAttribute("item_idx", item_idx);
		
		return "redirect:/items_content"; //list로 리다이렉트 시킴	
		}
	
//	@RequestMapping("reviewForm")
//	public String reviewForm( @RequestParam("item_idx_fk") int item_idx_fk,
//							@RequestParam("review_image") MultipartFile review_image,
//							@RequestParam("review_name") String review_name,
//							@RequestParam("review_content") String review_content,
//							@RequestParam("review_score") String review_score,
//							@RequestParam("item_idx") String item_idx,
//							Model model, RedirectAttributes redirectAttributes) {
//						
//			System.out.println("review_image:" + review_image );
//			Long size = review_image.getSize();
//			System.out.println("size" + size);
//	
//	
//			System.out.println("file is not null!");
//			String url = fileUploadService.restore(review_image);
//
//	
//			//String url = fileUploadService.restore(file);
//			//String url을 정의 = fileuploadservice의 restore() 함수의 결과값으로 나오는 url을 대입.
//			System.out.println("url:" + url);
//			//url: C:/Users/SOGMi/Documents/SKK/springboot/Ex13_FileUplpoadWithParam/src/main/resources/static/img/user/파일명.jpg
//			model.addAttribute("url", url);
//			
//			//"url"이라는 이름의 model에 url값을 저장
//			
//		
//			review_dao.review_write(item_idx_fk, url, review_name, review_content, review_score);
//		
//		redirectAttributes.addAttribute("item_idx", item_idx);
//		
//		return "redirect:/items_content"; //list로 리다이렉트 시킴	
//		}
	
	@RequestMapping("itemQnA")
	public String itemQnA( @RequestParam("item_idx") String item_idx, Model model ) {
		model.addAttribute("dto", dao.itemsContent(item_idx));
		
	return "user/items/items_qna";
	}
	
	@RequestMapping("itemsQnAForm")
	public String itemsQnAForm( @RequestParam("items_qna_idx_fk") int items_qna_idx_fk,
							@RequestParam("items_qna_title") String items_qna_title,
							@RequestParam("items_qna_name") String items_qna_name,
							@RequestParam("items_qna_password") String items_qna_password,
							@RequestParam("items_qna_secret") String items_qna_secret,
							@RequestParam("items_qna_content") String items_qna_content,
							@RequestParam("item_idx") String item_idx,
							Model model, RedirectAttributes redirectAttributes) {
					
		//SimpleBbsDto dto = new SimpleBbsDto( 0, writer, title, content );
		ItemsQnADto dto = new ItemsQnADto(); 
		dto.setItems_qna_idx_fk(items_qna_idx_fk);
		dto.setItems_qna_title(items_qna_title);
		dto.setItems_qna_name(items_qna_name);
		dto.setItems_qna_password(items_qna_password);
		dto.setItems_qna_secret(items_qna_secret);
		dto.setItems_qna_content(items_qna_content);
		
		//Mybatis에서 insert, update, delete는 자동으로 int타입의 값을 반환해 준다
		//resultType="_int"를 설정하지 않아도 됨. _int : primary type  int : Integer
		int result = items_qna_dao.itemsQnAForm( dto );
		
		//int result = dao.writeDao(writer, title, content);
		System.out.println( "result:" + result);
		
		redirectAttributes.addAttribute("item_idx", item_idx);
		
		return "redirect:/items_content"; //list로 리다이렉트 시킴
	}
	
	@RequestMapping("itemQnAview")
	public String itemQnAview(@RequestParam("item_idx") String item_idx, 
								@RequestParam("items_qna_idx") String items_qna_idx, 
								Model model ) {
		
		model.addAttribute("dto", dao.itemsContent(item_idx));
		
		model.addAttribute("items_qna_dto", items_qna_dao.itemQnAview(items_qna_idx));

		model.addAttribute("qna_answer_list", qna_answer_dao.qna_answer_list(items_qna_idx));
		
		
	return "user/items/items_qna_view";
	}
	
	@RequestMapping("itemsQnAcorrection")
	public String itemsQnAcorrection( @RequestParam("item_idx") String item_idx, 
										@RequestParam("items_qna_idx") String items_qna_idx, 
										Model model ) {
		
		model.addAttribute("dto", dao.itemsContent(item_idx));
		
		model.addAttribute("items_qna_dto", items_qna_dao.itemQnAview(items_qna_idx));
		
	return "user/items/items_qna_correction";
	}
	
	
	@RequestMapping("itemsQnAUpdate")
	public String itemsQnAUpdate( @RequestParam("items_qna_idx") String items_qna_idx,
							  @RequestParam("items_qna_title") String items_qna_title,
							  @RequestParam("items_qna_name") String items_qna_name,
							  @RequestParam("items_qna_password") String items_qna_password,
							  @RequestParam("items_qna_secret") String items_qna_secret,
							  @RequestParam("items_qna_content") String items_qna_content,
								@RequestParam("item_idx") String item_idx,
								Model model, RedirectAttributes redirectAttributes) {
		
		items_qna_dao.itemsQnAUpdate(items_qna_idx,  items_qna_title,  items_qna_name,  items_qna_password,  items_qna_secret,  items_qna_content);
		
		redirectAttributes.addAttribute("item_idx", item_idx);
		redirectAttributes.addAttribute("items_qna_idx", items_qna_idx);
		
		return "redirect:/itemQnAview";
		
	}
	
	@RequestMapping("itemsQnAPassword")
	public String itemsQnAPassword( @RequestParam("item_idx") String item_idx, 
										@RequestParam("items_qna_idx") String items_qna_idx, 
										Model model ) {
		
		model.addAttribute("dto", dao.itemsContent(item_idx));
		model.addAttribute("items_qna_dto", items_qna_dao.itemQnAview(items_qna_idx));
		
	return "user/items/items_qna_password";
	}
	
	@RequestMapping("itemListQna")
	public String itemListQna(@RequestParam("item_idx") String item_idx, 
								@RequestParam("items_qna_idx") String items_qna_idx, 
								Model model ) {
		
		model.addAttribute("dto", dao.itemsContent(item_idx));
		
		model.addAttribute("items_qna_dto", items_qna_dao.itemQnAview(items_qna_idx));
		
	return "admin/items_list_qna";
	}
	
	@RequestMapping("itemListReview")
	public String itemListReview(@RequestParam("item_idx") String item_idx, 
								@RequestParam("review_idx") String review_idx,
								Model model ) {
		
		model.addAttribute("dto", dao.itemsContent(item_idx));
		
		model.addAttribute("review_dto", review_dao.itemListReview(review_idx));
		
		
		
		return "admin/items_list_review";
	}
	
	
	@RequestMapping("itemListQnA")
	public String itemListQnA(@RequestParam("item_idx") String item_idx, 
								@RequestParam("items_qna_idx") String items_qna_idx,
								Model model ) {
		
		model.addAttribute("dto", dao.itemsContent(item_idx));
		
		model.addAttribute("items_qna_dto", items_qna_dao.itemQnAview(items_qna_idx));
		
		model.addAttribute("qna_answer_list", qna_answer_dao.qna_answer_list(items_qna_idx));
		
		
		return "admin/items_list_qna";
	}
	
	@RequestMapping("qna_answer_form")
	public String qna_answer_form( @RequestParam("qna_answer_idx_fk") int qna_answer_idx_fk,
									@RequestParam("qna_answer_content") String qna_answer_content,
									@RequestParam("item_idx") String item_idx, 
									@RequestParam("items_qna_idx") String items_qna_idx, 
									Model model, RedirectAttributes redirectAttributes) {
	
		//SimpleBbsDto dto = new SimpleBbsDto( 0, writer, title, content );
		QnAAnswerDto dto = new QnAAnswerDto(); 
		dto.setQna_answer_idx_fk(qna_answer_idx_fk);
		dto.setQna_answer_content(qna_answer_content);
		
		
		//Mybatis에서 insert, update, delete는 자동으로 int타입의 값을 반환해 준다
		//resultType="_int"를 설정하지 않아도 됨. _int : primary type  int : Integer
		int result = qna_answer_dao.qna_answer_form( dto );
		
		//int result = dao.writeDao(writer, title, content);
		System.out.println( "result:" + result);
		
		redirectAttributes.addAttribute("item_idx", item_idx);
		redirectAttributes.addAttribute("items_qna_idx", items_qna_idx);
		
		return "redirect:/itemListQnA"; //list로 리다이렉트 시킴
	}
	
	@RequestMapping("qna_answer_delete")
	public String qna_answer_delete( @RequestParam("qna_answer_idx") String qna_answer_idx, 
									@RequestParam("item_idx") String item_idx, 
									@RequestParam("items_qna_idx") String items_qna_idx, 
									Model model, RedirectAttributes redirectAttributes ) {
		
		qna_answer_dao.qna_answer_delete(qna_answer_idx);
		
		redirectAttributes.addAttribute("item_idx", item_idx);
		redirectAttributes.addAttribute("items_qna_idx", items_qna_idx);
		 
		
		
		return "redirect:/itemListQnA" ;
		
	}
	
	@RequestMapping("item_redirect")
	public String item_redirect( @RequestParam("item_idx") String item_idx,
							Model model, RedirectAttributes redirectAttributes) {
		
		redirectAttributes.addAttribute("item_idx", item_idx);
		
		return "redirect:/items_content"; 
	}
	
	
	
	@RequestMapping("review_delete")
	public String review_delete( @RequestParam("item_idx") String item_idx, 
								@RequestParam("review_idx") String review_idx,
								Model model, RedirectAttributes redirectAttributes ) {
		
		review_dao.review_delete(review_idx);
		
		redirectAttributes.addAttribute("item_idx", item_idx);
		
		return "redirect:/items_content" ;
		
	}
	
}

