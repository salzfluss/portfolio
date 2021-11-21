package com.study.springboot;


import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.springboot.dao.ICartDao;
import com.study.springboot.dao.IItemsDao;
import com.study.springboot.dao.IMemberDao;
import com.study.springboot.dao.INoticeDao;
import com.study.springboot.dao.IOne2oneDao;
import com.study.springboot.dao.IOne2oneReplyDao;
import com.study.springboot.dao.IOrderListDao;
import com.study.springboot.dto.One2oneDto;
import com.study.springboot.dto.One2oneReplyDto;
import com.study.springboot.dto.cartDto;
import com.study.springboot.service.FileUploadService2;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import com.study.springboot.service.MemberService;


@Controller
public class MyController4 {
	
	@Autowired
	private IOne2oneDao one2one_dao;
	
	@Autowired
	private IOne2oneReplyDao reply_dao;
	
	@Autowired
	private ServletContext context;
	
	@Autowired
	private INoticeDao notice_dao;
	
	@Autowired
	private IItemsDao dao;

	@Autowired
	private ICartDao cart_dao;
	
	@Autowired
	private IOrderListDao order_dao;
	
	@Autowired
	private IMemberDao member_dao;
	
	@Autowired
	private MemberService memberService;
	

	
	

	
	@RequestMapping("/one2one")
	public /*@ResponseBody*/ String root( RedirectAttributes redirect ) {
		
		redirect.addAttribute("page", "1");
		
		System.out.println("one2one으로 리다이렉트");
		return "redirect:one2one_list"; //list URI로 리다이렉트 시킨다.
	}

	//호출 URL : localhost:8090/one2one
	//실제호출될 페이지 "/WEB-INF/views/admin/one2one_list.jsp"가 호출됨.
	@RequestMapping( value="/one2one_list", method=RequestMethod.GET)
	public String one2one(HttpServletRequest request, Model model) {
		
		String page = request.getParameter("page");
		System.out.println( "page:" + page);
		model.addAttribute("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 5; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size); //5, 10, 15 페이지 끝 줄번호
		
		System.out.println("startRowNum:"+startRowNum);
		System.out.println("endRowNum:"+endRowNum);
		
		//model.addAttribute("list", dao.listDao());
		model.addAttribute("list", one2one_dao.listPageDao(String.valueOf(startRowNum), String.valueOf(endRowNum)));  //최상위 10개
	
		
		
		System.out.println("리다이렉트 받은후 one2one_list로 model 넘김");
		return "admin/one2one_list";  //"admin/one2one_list.jsp" 페이지를 디스패치 해줌.
	}
	
	//호출 URL : localhost:8090/one2one_view
	//실제호출될 페이지 "/WEB-INF/views/admin/one2one_view.jsp"가 호출됨.
	@RequestMapping(value="/one2one_view", method=RequestMethod.GET)
	public String one2one_view(@RequestParam("one2one_idx") String one2one_idx,		
							   
							   Model model) {
		
		
		model.addAttribute("dto", one2one_dao.viewDao(one2one_idx) );
		model.addAttribute("list", reply_dao.list(one2one_idx));
			
		model.addAttribute("one2one_idx", one2one_idx);
		
		
		return "admin/one2one_view";  //"admin/one2one_view.jsp" 페이지를 디스패치 해줌.
	}
	
	@RequestMapping("/reply.do")
	public String reply( @RequestParam("one2one_reply_idx") String one2one_reply_idx,
						 @RequestParam("one2one_reply_name") String one2one_reply_name,
						 @RequestParam("one2one_reply_title") String one2one_reply_title,
						 @RequestParam("one2one_reply_content") String one2one_reply_content,
						 Model model) {
		System.out.println("reply.do 호출됨");
		
		System.out.println(one2one_reply_idx);
		System.out.println(one2one_reply_name);
		System.out.println(one2one_reply_title);
		System.out.println(one2one_reply_content);
		
		int result = reply_dao.reply(one2one_reply_idx, one2one_reply_name, one2one_reply_title, one2one_reply_content);
	    System.out.println( "result:" + result); //성공시 insert갯수(1)로 리턴함.
				
	    return "redirect:one2one";
	}
	
	
	@RequestMapping("/modify.do")
	public String update( 
						@RequestParam("one2one_reply_idx") String one2one_reply_idx,
						@RequestParam("one2one_reply_name") String one2one_reply_name,
						@RequestParam("one2one_reply_title") String one2one_reply_title,
						@RequestParam("one2one_reply_content") String one2one_reply_content,
						Model model) {
		
		reply_dao.modify(one2one_reply_idx, one2one_reply_name, one2one_reply_title, one2one_reply_content);
				
		return "redirect:one2one"; 
	}
	
	
	/*-------------------------------------user부분------------------------------------*/
	
	
	@RequestMapping("/user")
	public String user(HttpServletRequest request, Model model, RedirectAttributes redirect) { 
		
		String user_id = (String)request.getSession().getAttribute("member_id");
		model.addAttribute("memberDto", member_dao.MyInfoCheckView(user_id));
		
		redirect.addAttribute("page", "1");
		
		System.out.println("user_one2one으로 리다이렉트");
		
	return "redirect:user_one2one"; 
	
	}
	
	@RequestMapping( value="/user_one2one", method=RequestMethod.GET)
	public String user_one2one(HttpServletRequest request, 
			                    Model model) {
		
		String user_id = (String)request.getSession().getAttribute("member_id");
		model.addAttribute("memberDto", member_dao.MyInfoCheckView(user_id));
		
		String page = request.getParameter("page");
		System.out.println( "page:" + page);
		model.addAttribute("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 10; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size); //5, 10, 15 페이지 끝 줄번호
		
		System.out.println("startRowNum:"+startRowNum);
		System.out.println("endRowNum:"+endRowNum);
		
		//model.addAttribute("list", dao.listDao());
		model.addAttribute("list", one2one_dao.listPageDao(String.valueOf(startRowNum), String.valueOf(endRowNum)));  //최상위 10개
	
		
		
		System.out.println("리다이렉트 받은후 one2one_list로 model 넘김");
		return "user/user_one2one_list";  //"admin/one2one_list.jsp" 페이지를 디스패치 해줌.
	}
	

	@RequestMapping("/user_one2one_write")
	public String one2one_write(HttpServletRequest request, 
            Model model) { 
	
		String user_id = (String)request.getSession().getAttribute("member_id");
		model.addAttribute("memberDto", member_dao.MyInfoCheckView(user_id));
		System.out.println("one2one_write로 이동");
		
	return "user/user_one2one_write"; 
	
	}
	
	@RequestMapping("/user_one2one_write.do")
	public String one2one_write(  
			
			@RequestParam("one2one_category") String one2one_category,
			@RequestParam("one2one_pw") String one2one_pw,
			@RequestParam("one2one_name") String one2one_name,
			@RequestParam("one2one_title") String one2one_title,
			@RequestParam("one2one_content") String one2one_content,
			@RequestParam("file") MultipartFile file,
			Model model) {
		
		System.out.println("file:" + file );
		Long size = file.getSize();
		System.out.println("size" + size);
		
		
		if(size != 0){ 
			
			System.out.println("file is not null!");
			String url = fileUploadService2.restore(file);
			
			//String url = fileUploadService.restore(file);
			//String url을 정의 = fileuploadservice의 restore() 함수의 결과값으로 나오는 url을 대입.
			System.out.println("url:" + url);
			//url: C:/Users/SOGMi/Documents/SKK/springboot/Ex13_FileUplpoadWithParam/src/main/resources/static/img/user/파일명.jpg
			model.addAttribute("url", url);		
			//"url"이라는 이름의 model에 url값을 저장
			
			System.out.println("one2one_write.do 호출됨");
			System.out.println(one2one_category);
			System.out.println(one2one_pw);
			System.out.println(one2one_name);
			System.out.println(one2one_title);
			System.out.println(one2one_content);
		
			one2one_dao.write(one2one_category, url, one2one_name, one2one_pw,one2one_title, one2one_content);
	
		} 
		
		
		if(size == 0) {
			
			System.out.println("file is null!");
			
			
			System.out.println("one2one_write.do 호출됨");
			System.out.println(one2one_category);
			System.out.println(one2one_pw);
			System.out.println(one2one_name);
			System.out.println(one2one_title);
			System.out.println(one2one_content);
		
			one2one_dao.write(one2one_category, null, one2one_name, one2one_pw,one2one_title, one2one_content);
			
			
		}
		

		
		
		return "redirect:user"; 
	}
	
	@RequestMapping("/user_one2one_pwchk")
	public String user_one2one_pwchk(@RequestParam("one2one_idx") String one2one_idx,	
			                        
									Model model) {

	model.addAttribute("dto", one2one_dao.viewDao(one2one_idx) );
	model.addAttribute("one2one_idx", one2one_idx);
	System.out.println(one2one_idx);
	
	
		
	return "user/user_one2one_pwchk"; 
	
	}
	
	
	@RequestMapping("/user_one2one_view")
	public String user_one2one_view(@RequestParam("one2one_idx") String one2one_idx,		
			                        
									Model model) {

	
		model.addAttribute("dto", one2one_dao.viewDao(one2one_idx) );
		model.addAttribute("list", reply_dao.list(one2one_idx));
		
	
		
	return "user/user_one2one_view"; 
	
	}
	
	@RequestMapping("/user_one2one_modify")
	public String user_one2one_modify(@RequestParam("one2one_idx") String one2one_idx,		
								    HttpServletRequest request,
									Model model) {

		String user_id = (String)request.getSession().getAttribute("member_id");
		model.addAttribute("memberDto", member_dao.MyInfoCheckView(user_id));
		
		model.addAttribute("dto", one2one_dao.viewDao(one2one_idx) );
		model.addAttribute("list", reply_dao.list(one2one_idx));
		
	return "user/user_one2one_modify"; 
	
	}
	
	@RequestMapping("/one2one_modify.do")
	public String user_one2one_update( 
						@RequestParam("one2one_idx") String one2one_idx,
						@RequestParam("one2one_category") String one2one_category,
						@RequestParam("one2one_pw") String one2one_pw,
						@RequestParam("one2one_name") String one2one_name,
						@RequestParam("one2one_title") String one2one_title,
						@RequestParam("one2one_content") String one2one_content,
						@RequestParam("file") MultipartFile file,
						Model model) {
		
		System.out.println("file:" + file );
		Long size = file.getSize();
		System.out.println("size" + size);
				
		
		System.out.println(one2one_idx);
		System.out.println(one2one_category);
		System.out.println(one2one_pw);
		System.out.println(one2one_name);
		System.out.println(one2one_title);
		System.out.println(one2one_content);
		
	if(size != 0){ 
			
			System.out.println("file is not null!");
			String url = fileUploadService2.restore(file);
			
			//String url = fileUploadService.restore(file);
			//String url을 정의 = fileuploadservice의 restore() 함수의 결과값으로 나오는 url을 대입.
			System.out.println("url:" + url);
			//url: C:/Users/SOGMi/Documents/SKK/springboot/Ex13_FileUplpoadWithParam/src/main/resources/static/img/user/파일명.jpg
			model.addAttribute("url", url);		
			//"url"이라는 이름의 model에 url값을 저장
			
			System.out.println("one2one_write.do 호출됨");
			System.out.println(one2one_category);
			System.out.println(one2one_pw);
			System.out.println(one2one_name);
			System.out.println(one2one_title);
			System.out.println(one2one_content);
		
			one2one_dao.modify(one2one_idx, one2one_category, url, one2one_name, one2one_pw, one2one_title, one2one_content);
	
		} 
		
		
		if(size == 0) {
			
			System.out.println("file is null!");
			
			
			System.out.println("one2one_write.do 호출됨");
			System.out.println(one2one_category);
			System.out.println(one2one_pw);
			System.out.println(one2one_name);
			System.out.println(one2one_title);
			System.out.println(one2one_content);
		
			one2one_dao.modify(one2one_idx, one2one_category, null, one2one_name, one2one_pw, one2one_title, one2one_content);
		
			
			
		}
		
	
		
		return "redirect:user"; 
	}
	
	@RequestMapping("/user_one2one_delete")
	public String user_one2one_delete(@RequestParam("one2one_idx") String one2one_idx,		
			   
									Model model) {


		model.addAttribute("dto", one2one_dao.viewDao(one2one_idx) );
		model.addAttribute("list", reply_dao.list(one2one_idx));
		
		one2one_dao.delete(one2one_idx);
		
	return "redirect:user"; 
	
	}
	
	/*-------------------------------------파일업로드 부분------------------------------------*/
	
	@Autowired
	private FileUploadService2 fileUploadService2;
	
	@RequestMapping("/uploadForm")
	public String uploadForm() {

		return "user/upload";
	}

	@Bean(name = "multipartResolver2")
	public CommonsMultipartResolver multipartResolver2() {
		CommonsMultipartResolver multipartResolver2 = new CommonsMultipartResolver();
		multipartResolver2.setMaxUploadSize(200000000);
		multipartResolver2.setMaxInMemorySize(200000000);
		multipartResolver2.setDefaultEncoding("utf-8");
		return multipartResolver2;
	}
	
	@RequestMapping(value = "/uploadOk", method = RequestMethod.POST)
	public @ResponseBody String uploadOk(
			Model model, 

			@RequestParam("filename") MultipartFile file) {

	
		String url = fileUploadService2.restore(file);
		System.out.println("url:" + url);
		//url:C:/Users/SOGMi/Documents/SKK/springboot/Ex13_FileUplpoadWithParam/src/main/resources/static/upload/2021816113346798.jpg

		model.addAttribute("url", url);
		return "result";

	}
	
	/*-------------------------------------notice 부분------------------------------------*/

	
	@RequestMapping("/user_notice")
	public String user_notice(RedirectAttributes redirect) {
		
		redirect.addAttribute("page", "1");
		
		System.out.println("notice_list 로 리다이렉트");

		return "redirect:user_notice_list";
	}
	
	@RequestMapping( value="/user_notice_list", method=RequestMethod.GET)
	public String notice_list(HttpServletRequest request, Model model) {
		
		String page = request.getParameter("page");
		System.out.println( "page:" + page);
		model.addAttribute("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 5; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size); //5, 10, 15 페이지 끝 줄번호
		
		System.out.println("startRowNum:"+startRowNum);
		System.out.println("endRowNum:"+endRowNum);
		
		//model.addAttribute("list", dao.listDao());
		model.addAttribute("list", notice_dao.listPageDao(String.valueOf(startRowNum), String.valueOf(endRowNum)));  //최상위 10개
	
		
		
		System.out.println("리다이렉트 받은후 user_notice로 model 넘김");
		return "user/user_notice";  
	}
	
	@RequestMapping("/user_notice_view")
	public String user_notice_view(@RequestParam("notice_idx") String notice_idx,		
			   
									Model model) {


		//조회수 증가
		notice_dao.hit( notice_idx );
		
		model.addAttribute("dto", notice_dao.contentView(notice_idx) );
		
	
		
	return "user/user_notice_view"; 
	
	}
	
	/*-------------------------------------장바구니 부분------------------------------------*/



	@RequestMapping("/cart")
	public String cart(HttpServletRequest request, Model model) {
		
		
		
		String user_id = (String)request.getSession().getAttribute("member_id");
		model.addAttribute("memberDto", member_dao.MyInfoCheckView(user_id));
		
		String pre_item_idx = (String)request.getSession().getAttribute("item_idx");
		model.addAttribute("item_idx", pre_item_idx);
	
	
		model.addAttribute("list", cart_dao.cartlist(user_id));
		model.addAttribute("listsize", cart_dao.cartlist(user_id).size());
		
		return "user/cart";
	}
	
	@RequestMapping("/cart_add")
	public String cart_add(  
			@RequestParam("member_id") String member_id,
			@RequestParam("item_idx") String item_idx,
			@RequestParam("item_img") String item_img,
			@RequestParam("item_name") String item_name,
			@RequestParam("item_category") String item_category,
			@RequestParam("item_price") String item_price,
			@RequestParam("item_amount") String item_amount,
			@RequestParam("item_content") String item_content,		
			HttpServletRequest request,
			Model model) {
		
		String user_id = (String)request.getSession().getAttribute("member_id");
		model.addAttribute("memberDto", member_dao.MyInfoCheckView(user_id));
	
		
		
		
		cart_dao.write(member_id, item_category, item_name, item_price, item_amount, item_img, item_content);
		
		System.out.println("장바구니에 저장하자!");
		System.out.println("member_id:"+member_id);
		System.out.println("item_idx:"+item_idx);
		System.out.println("item_img:"+item_img);
		System.out.println("item_name:"+item_name);
		System.out.println("item_category"+item_category);
		System.out.println("item_amount:"+item_amount);
		System.out.println("item_price:"+item_price);
		System.out.println("item_content:"+item_content);
	
		
		//return "redirect:items_view_all";
		return "redirect:items_view_all";
	}
	
		
	
	@RequestMapping("/cart_delete")
	public String cart_delete(@RequestParam("cart_item_idx") String cart_item_idx,		
							 
									Model model) {
		
		
	
		cart_dao.delete(cart_item_idx);
		
		
		System.out.println("delete함수");
		
	return "redirect:cart"; 
	
	}
	
	
	@RequestMapping("/order_view")
	public String order_view( @RequestParam("transfee") String transfee, 
							 @RequestParam("total") String total, 
							 @RequestParam("listsize") String listsize,
							 @RequestParam("page_url") String page_url,
							 HttpServletRequest request,
							 Model model) {
		
		String user_id = (String)request.getSession().getAttribute("member_id");
		model.addAttribute("memberDto", member_dao.MyInfoCheckView(user_id));
		
		model.addAttribute("list", cart_dao.list());
		model.addAttribute("listsize", listsize);
		model.addAttribute("transfee", transfee);
		model.addAttribute("total", total);
		model.addAttribute("page_url", page_url);
		
		String pre_item_idx = (String)request.getSession().getAttribute("item_idx");
		model.addAttribute("item_idx", pre_item_idx);
		
		System.out.println("++++cart _ listsize"+listsize);
		
		
		if( Integer.parseInt(listsize) >= 0) {
			model.addAttribute("item_amount0", request.getParameter("item_amount0"));
			
			String cart_item_idx0 = request.getParameter("cart_item_idx0");
			System.out.println("cart_item_idx0:"+cart_item_idx0);
			System.out.println(request.getParameter("item_amount0"));
			
			cart_dao.modify(cart_item_idx0, request.getParameter("item_amount0"));
		}
		if( Integer.parseInt(listsize) >= 1) {
			model.addAttribute("item_amount1", request.getParameter("item_amount1"));
			String cart_item_idx1 = request.getParameter("cart_item_idx1");
			System.out.println("cart_item_idx1:"+cart_item_idx1);
			
			cart_dao.modify(cart_item_idx1, request.getParameter("item_amount1"));
		}
		if( Integer.parseInt(listsize) >= 2) {
			model.addAttribute("item_amount2", request.getParameter("item_amount2"));
			String cart_item_idx2 = request.getParameter("cart_item_idx2");
			System.out.println("cart_item_idx2:"+cart_item_idx2);
			
			cart_dao.modify(cart_item_idx2, request.getParameter("item_amount2"));
		}
		if( Integer.parseInt(listsize) >= 3) {
			model.addAttribute("item_amount3", request.getParameter("item_amount3"));
			String cart_item_idx3 = request.getParameter("cart_item_idx3");
			System.out.println("cart_item_idx3:"+cart_item_idx3);
			
			cart_dao.modify(cart_item_idx3, request.getParameter("item_amount3"));
		}
		if( Integer.parseInt(listsize) >= 4) {
			model.addAttribute("item_amount4", request.getParameter("item_amount4"));
			String cart_item_idx4 = request.getParameter("cart_item_idx4");
			System.out.println("cart_item_idx4:"+cart_item_idx4);
			
			cart_dao.modify(cart_item_idx4, request.getParameter("item_amount4"));
		}
		if( Integer.parseInt(listsize) >= 5) {
			model.addAttribute("item_amount5", request.getParameter("item_amount5"));
			String cart_item_idx5 = request.getParameter("cart_item_idx5");
			System.out.println("cart_item_idx5:"+cart_item_idx5);
			
			cart_dao.modify(cart_item_idx5, request.getParameter("item_amount5"));
		}
		
		
		
		return "user/order_payment";
	}
	
	
	@RequestMapping("/order_view2")
	public String order_view2( @RequestParam("transfee") String transfee, 
							 @RequestParam("total") String total, 
							 @RequestParam("page_url") String page_url, 
							 @RequestParam("member_id") String member_id,
							@RequestParam("item_idx") String item_idx,
							@RequestParam("item_img") String item_img,
							@RequestParam("item_name") String item_name,
							@RequestParam("item_category") String item_category,
							@RequestParam("item_price") String item_price,
							@RequestParam("item_amount") String item_amount,
							@RequestParam("item_content") String item_content,	
							 HttpServletRequest request,
							 Model model) {
		
		String user_id = (String)request.getSession().getAttribute("member_id");
		model.addAttribute("memberDto", member_dao.MyInfoCheckView(user_id));
		
		request.getSession().setAttribute("item_idx", item_idx);
		
		String pre_item_idx = (String)request.getSession().getAttribute("item_idx");
		model.addAttribute("item_idx", pre_item_idx);
		
		model.addAttribute("listsize", "0");
		
		
		
		model.addAttribute("transfee", transfee);
		model.addAttribute("total", total);
		model.addAttribute("page_url", page_url);
		model.addAttribute("item_img", item_img);
		model.addAttribute("item_name", item_name);
		model.addAttribute("item_category", item_category);
		model.addAttribute("item_price", item_price);
		model.addAttribute("item_amount", item_amount);
		model.addAttribute("item_content", item_content);
		

		
		return "user/order_payment";
	}
	
	
	
	@RequestMapping("/card_payment")
	public String card_payment(	Model model) {


		
	return "user/payment/card_payment";
	
	}
	
	@RequestMapping("/deposit_bank")
	public String deposit_bank(	Model model) {


	return "user/payment/deposit_bank";
	
	}

	@RequestMapping("/account_trans")
	public String account_trans(	Model model) {

		
	return "user/payment/account_trans";
	
	}
	
	@PostMapping("/order_receipt")
	public String order_receipt(@RequestParam("totalview") String totalview,
			@RequestParam("pay_method") String pay_method,
			@RequestParam("listsize") String listsize,
			HttpServletRequest request,
			Model model){
		
		System.out.println("listsize:"+ listsize);
		String user_id = (String)request.getSession().getAttribute("member_id");
		model.addAttribute("memberDto", member_dao.MyInfoCheckView(user_id));
	
		model.addAttribute("list", cart_dao.list());
		model.addAttribute("listsize", listsize);
		
		model.addAttribute("order_list", order_dao.OrderReceipt(user_id));
		
		model.addAttribute("totalview", totalview);
		model.addAttribute("pay_method", pay_method);
	
		System.out.println("listsize"+listsize);
		
		int listsizeint = Integer.parseInt(listsize);
		System.out.println("listsizeint"+listsizeint);
		
if(listsizeint == 0) {
			
			String cart_item_idx = request.getParameter("cart_item_idx");
			String product_img = request.getParameter("product_img");			
			String item_name = request.getParameter("item_name");
			String item_amount = request.getParameter("item_amount");	
			String sum = request.getParameter("sum");	
			String transfee = request.getParameter("transfee");	
			String total = request.getParameter("totalview");
			String member_id = request.getParameter("member_id");
			String member_name = request.getParameter("member_name");			
			String member_phone = request.getParameter("member_phone");
			String member_email1 = request.getParameter("member_email1");
			String member_email2 = request.getParameter("member_email2");
			String member_postcode = request.getParameter("member_postcode");
			String member_address1 = request.getParameter("member_address1");
			String member_address2 = request.getParameter("member_address2");
			String order_request = request.getParameter("order_request");
			String paymethod = request.getParameter("pay_method");
			String order_status = "결제완료";
			//String order_number = "1";
			String order_number = request.getParameter("uuid");
			
			model.addAttribute("uuid", order_number);
			
			request.getSession().setAttribute("uuid", order_number);
		
			System.out.println("listsize는 0이다! ");
			
			order_dao.write(order_number, member_name, member_id, member_phone, member_postcode+member_address1+member_address2, product_img, item_name, item_amount, order_request, paymethod, order_status, total);
			
		}
		
		for(int i = 0; i < listsizeint; i++) {
			
			String cart_item_idx = request.getParameter("cart_item_idx"+i);
			String product_img = request.getParameter("product_img"+i);			
			String item_name = request.getParameter("item_name"+i);
			String item_amount = request.getParameter("item_amount"+i);	
			String sum = request.getParameter("sum"+i);	
			String transfee = request.getParameter("transfee"+i);	
			String total = request.getParameter("totalview");
			String member_id = request.getParameter("member_id");
			String member_name = request.getParameter("member_name");			
			String member_phone = request.getParameter("member_phone");
			String member_email1 = request.getParameter("member_email1");
			String member_email2 = request.getParameter("member_email2");
			String member_postcode = request.getParameter("member_postcode");
			String member_address1 = request.getParameter("member_address1");
			String member_address2 = request.getParameter("member_address2");
			String order_request = request.getParameter("order_request");
			String paymethod = request.getParameter("pay_method");
			String order_status = "결제완료";
			//String order_number = "1";
			String order_number = request.getParameter("uuid");
			
			model.addAttribute("order_number", order_number);
			model.addAttribute("uuid", order_number);
			
			request.getSession().setAttribute("uuid", order_number);
			
			
			System.out.println("write,..............");
			System.out.println("order_number:" + order_number);
			order_dao.write(order_number, member_name, member_id, member_phone, member_postcode+member_address1+member_address2, product_img, item_name, item_amount, order_request, paymethod, order_status, total);
		
		}
		
		
		
		
		return "redirect:order_receipt2";
	}
	
	
	@GetMapping("/order_receipt2")
	public String order_receipt(
			HttpServletRequest request,
			Model model) {
		
		String user_id = (String)request.getSession().getAttribute("member_id");
		model.addAttribute("memberDto", member_dao.MyInfoCheckView(user_id));
		
		String guid = (String)request.getSession().getAttribute("uuid");
		
		
		
		model.addAttribute("order_list", order_dao.OrderReceipt(user_id));

		System.out.println("guid:"+guid);
		
		return "user/payment/order_receipt";
	
	}

	
}
