
package com.study.springboot;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.study.springboot.service.ItemsService;
import com.study.springboot.dao.IItemsDao;
import com.study.springboot.dao.IMemberDao;
import com.study.springboot.dao.INoticeDao;
import com.study.springboot.dao.IOrderListDao;
import com.study.springboot.dto.ItemsDto;
import com.study.springboot.service.FileUploadService;
import com.study.springboot.service.MemberService;

@Controller
public class MyController2 {
	
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
	private IItemsDao itemsDao;
	@Autowired
	private ItemsService itemsService;
	
	// 메인 페이지
	@RequestMapping("/")
	public /* @ResponseBody */ String root() {
		return "redirect:main"; 
	}
	
	// 관리자 페이지
	// 회원목록
	@RequestMapping("/member_list")
	public String memberList(Model model) {
		
		model.addAttribute("memberList", memberDao.MemberList());
		
		return "admin/member_list"; // member_list.jsp 디스패치
	}
	
	// 회원정보 보기
	@RequestMapping("/memberView")
	public String memberView(@RequestParam("member_idx") String member_idx, Model model) {
		
		System.out.println(member_idx);
		
		model.addAttribute("memberDto", memberDao.MemberView(member_idx));
		
		return "admin/member_contents"; // member_contents로 디스패치
	}
	
	// 회원정보 수정
	@RequestMapping( value = "/updateMember", method = RequestMethod.POST )
	public String updateMember(@RequestParam("member_idx") String member_idx,
								@RequestParam("member_id") String memeber_id,
								@RequestParam("member_pw") String member_pw,
								@RequestParam("member_name") String member_name,
								@RequestParam("member_email1") String member_email1,
								@RequestParam("member_email2") String member_email2,
								@RequestParam("member_phone") String member_phone,
								@RequestParam("member_postcode") String member_postcode,
								@RequestParam("member_address1") String member_address1,
								@RequestParam("member_address2") String member_address2,
								@RequestParam("member_gender") String member_gender,
								Model model) {
		
		memberDao.updateMember(member_idx, 
								memeber_id,
								member_pw, 
								member_name, 
								member_email1,
								member_email2,
								member_phone,
								member_postcode,
								member_address1,
								member_address2,
								member_gender);
		
		return "redirect:member_list";
	}
	
	// 회원목록 삭제
	@RequestMapping("/deleteMember")
	public String deleteMember(@RequestParam("member_idx") String member_idx, Model model) {
		
		memberDao.deleteMember(member_idx);
		
		return "redirect:member_list";
	}
	// 공지사항 목록
	@RequestMapping("/notice_list")
	public String noticeList(Model model) {

		model.addAttribute("noticeList", noticeDao.noticeList());

		return "admin/notice_list"; // notice_list.jsp 디스패치
	}
	
	// 공지사항 뷰
	@RequestMapping("/noticeContents")
	public String noticeContents(@RequestParam("notice_idx") String notice_idx, Model model) {
		
		// 조회수 증가
		noticeDao.noticeHit(notice_idx);
		model.addAttribute("noticeDto", noticeDao.noticeContents(notice_idx));
		
		return "admin/notice_contents"; // notice_contents로 디스패치
	}
	
	// 공지사항 등록이동
	@RequestMapping("/writeNoticeForm")
	public String writeNoticeForm() throws Exception {
		
		String path = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
		System.out.println("path:" + path );
		
		return "admin/notice_write";
	} 
	
	// 파일 업로드 설정
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(200000000);
		multipartResolver.setMaxInMemorySize(200000000);
		multipartResolver.setDefaultEncoding("utf-8");
		return multipartResolver;
	}
	
	// 공지사항 글 작성
	@RequestMapping(value = "/writeNotice", method = RequestMethod.POST)
	public String writeBoard(@RequestParam("notice_title") String notice_title,
							 @RequestParam("notice_name") String notice_name,
										@RequestParam("notice_content") String notice_content,
										@RequestParam("file") MultipartFile file,
										Model model) throws Exception {
		
		String notice_img = fileUploadService.restore(file);
		
		System.out.println("notice_title : " + notice_title);
		System.out.println("notice_img : " + notice_img);
		System.out.println("notice_content : " + notice_content);
		System.out.println("notice_name : " + notice_name);
		
		int result = noticeDao.writeNotice(notice_name, notice_title, notice_img, notice_content);
		System.out.println("result : " + result); // 성공 시 1로 리턴
		
		return "redirect:notice_list"; // 데이터를 보내면서 list.jsp 디스패치
	}
	
	// 공지사항 글 수정
	@RequestMapping( value = "/updateNotice", method = RequestMethod.POST )
	public String updateNotice(@RequestParam("notice_idx") String notice_idx,
							@RequestParam("notice_name") String notice_name,
							@RequestParam("notice_title") String notice_title,
							@RequestParam("notice_img") String notice_img,
							@RequestParam("notice_content") String notice_content,
							Model model) {
		
		noticeDao.updateNotice(notice_idx, notice_name, notice_title, notice_img, notice_content);

		return "redirect:notice_list"; // 데이터를 보내면서 list.jsp 디스패치
	}
	
	// 공지사항 글 삭제
	@RequestMapping("/deleteNotice")
	public String deleteNotice(@RequestParam("notice_idx") String notice_idx, Model model) {

		noticeDao.deleteNotice(notice_idx);

		return "redirect:notice_list";
	}
	
	// 주문목록 리스트
	@RequestMapping("/order_list")
	public String OrderList(Model model) {

		model.addAttribute("orderList", orderListDao.OrderList());

		return "admin/order_list"; // order_list.jsp 디스패치
	}
	
	// 주문내역 보기
	@RequestMapping("orderListView")
	public String OrderListView(@RequestParam("order_list_idx") String order_list_idx, 
								Model model) {
		
		model.addAttribute("orderListDto", orderListDao.OrderListView(order_list_idx));
		
		model.addAttribute("memberDto", memberDao.MemberView(order_list_idx));
		
		return "admin/order_list_view"; // notice_contents로 디스패치
	}
	
	// 주문취소
	@RequestMapping("/deleteOrderList")
	public String deleteOrderList(@RequestParam("order_list_idx") String order_list_idx, Model model) {

		orderListDao.deleteOrderList(order_list_idx);

		return "redirect:order_list";
	}
	
	// 사용자 페이지
	// 회원가입 페이지
	@RequestMapping( value = "/join01", method = RequestMethod.GET)
	public String joinPage() {
		
		return "user/member/join01";
	}
	
	// 아이디 중복 확인
	@RequestMapping("/join01/idCheckAjax")
	@ResponseBody
	public String idCheckAjax(@RequestParam("member_id") String member_id,
							HttpServletRequest request, 
							Model model) {
		
		int result = memberService.idCheckAjax(member_id);
		System.out.println("result : " + result);
		
		if( result >= 1 ) { // 아이디 중복
			return("1");
		}else {
			return("0");
		}
	}
	
	// 회원가입 완료 페이지
	@RequestMapping("/join02")
	public String joinSuccess() {
		
		return "user/member/join02";
	}
	
	// 회원가입
	@RequestMapping( value = "/joinMember", method = RequestMethod.POST )
	public String joinMember(HttpServletRequest request, Model model) {
		
		String member_id = request.getParameter("member_id");
		String member_email1 = request.getParameter("member_email1");
		String member_email2 = request.getParameter("member_email2");
		String member_name = request.getParameter("member_name");
		String member_pw = request.getParameter("member_pw");
		String member_phone1 = request.getParameter("member_phone1");
		String member_phone2 = request.getParameter("member_phone2");
		String member_phone3 = request.getParameter("member_phone3");
		String member_postcode = request.getParameter("member_postcode");
		String member_address1 = request.getParameter("member_address1");
		String member_address2 = request.getParameter("member_address2");
		String member_birthdate = request.getParameter("member_birthdate");
		String member_gender = request.getParameter("member_gender");
		
		System.out.println("member_id : " + member_id);
		System.out.println("member_email1 : " + member_email1);
		System.out.println("member_email2 : " + member_email2);
		System.out.println("member_name : " + member_name);
		System.out.println("member_pw : " + member_pw);
		System.out.println("member_phone1 : " + member_phone1);
		System.out.println("member_phone2 : " + member_phone2);
		System.out.println("member_phone3 : " + member_phone3);
		System.out.println("member_postcode : " + member_postcode);
		System.out.println("member_address1 : " + member_address1);
		System.out.println("member_address2 : " + member_address2);
		System.out.println("member_birthdate : " + member_birthdate);
		System.out.println("member_gender : " + member_gender);
		
		int result = 0;
		
		try {
			result = memberService.join(member_id, 
										member_email1,
										member_email2,
										member_name, 
										member_pw, 
										member_phone1, 
										member_phone2, 
										member_phone3, 
										member_postcode, 
										member_address1, 
										member_address2, 
										member_birthdate, 
										member_gender);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("result : " + result);
		
		if( result == 1 ) {
			request.getSession().setAttribute("alert", "welcome!");
			
			return "redirect:join02";
		}else {
			model.addAttribute("alert", "join failed");
			
			return "redirect:join01";
		}
	}
	
	// 메인 페이지 이동
	@RequestMapping("/main")
	public String mainPage(HttpServletRequest request, Model model) {
		
		//알럿 메시지 중복 제거
		String alertMessage = (String)request.getSession().getAttribute("alert");
		System.out.println("index alertMessage:" + alertMessage);
		
		if( alertMessage != null) {
			request.setAttribute("alert", alertMessage);
			request.getSession().setAttribute("alert", null);
		}
		
		model.addAttribute("list", itemsDao.list());
		
		return "user/main";
	}
	
	// 장바구니 페이지
	@RequestMapping("/mypage_cart")
	public String cartPage() {
		return "user/mypage/cart";
	}
	
	// 로그인 페이지
	@RequestMapping( value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		
		return "user/member/login";
	}
	
	// 로그인하기
	@RequestMapping( value = "/loginMember", method = RequestMethod.POST )
	public String loginMember(@RequestParam("member_id") String member_id,
								@RequestParam("member_pw") String member_pw,
								HttpServletRequest request,
								Model model) {
		
		int result = memberService.loginMember(member_id, member_pw);
		System.out.println("result : " + result);
		
		if( result == 1 ) {
			System.out.println("alert : " + "login!");
			request.getSession().setAttribute("alert", "login!");
			request.getSession().setAttribute("member_id", member_id);
			
			if( member_id.equals("admin") ) {
				return "redirect:member_list";
			}
			
			return "redirect:main";
			
		} else {
			System.out.println("alert : " + "fail login!");
			//request.getSession().setAttribute("alert", "fail login!");
			
			model.addAttribute("alert", "fail login!");
			model.addAttribute("mainPage", "member/login.jsp");
			
			return "user/member/login";
		}
		
	}
	
	// 로그아웃 하기
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, Model model) {
		
		request.getSession().invalidate();
		
		request.getSession().setAttribute("alert", "logout!");
		
		return "redirect:main";
	}
	
	// 아이디 찾기
	@RequestMapping("/findId")
	public String findId( HttpServletRequest request, Model model ) {
		
		return "user/member/findId";
	}
	@RequestMapping("/findIdAction")
	public String findIdAction(@RequestParam("member_name") String member_name,
							@RequestParam("member_email1") String member_email1,
							@RequestParam("member_email2") String member_email2,
							HttpServletRequest request,
							Model model) {
		
		String member_id = memberService.FindId(member_name, member_email1, member_email2);
		System.out.println("member_id : " + member_id);
		if( !member_id.equals("") ) {
			request.setAttribute("member_id", member_id);
		} else {
			request.setAttribute("member_id", null);
		}
		
		return "user/member/findId";
	}
	
	// 비밀번호 찾기
	@RequestMapping("/findPw")
	public String findPw( HttpServletRequest request, Model model ) {
		
		return "user/member/findPw";
	}
	@RequestMapping("/findPwAction")
	public String findPwAction(@RequestParam("member_name") String member_name,
							@RequestParam("member_id") String member_id,
							@RequestParam("member_email1") String member_email1,
							@RequestParam("member_email2") String member_email2,
							HttpServletRequest request,
							Model model) {
		
		String member_pw = memberService.FindPw(member_name, member_id, member_email1, member_email2);
		System.out.println("member_pw : " + member_pw);
		if( !member_pw.equals("") ) {
			request.setAttribute("member_pw", member_pw);
		} else {
			request.setAttribute("member_pw", null);
		}
		
		return "user/member/findPw";
	}
	
	// 아이템 보기
	@RequestMapping("/item_view")
	public String itemView() {
		
		return "user/item_view";
	}
	
	// 마이페이지
	@RequestMapping("/my_order")
	public String myOrderPage(
			HttpServletRequest request,
			Model model) {
		
		String user_id = (String)request.getSession().getAttribute("member_id");
		model.addAttribute("myOrderList", orderListDao.MyOrderList(user_id));
		
		model.addAttribute("memberDto", memberDao.MyInfoCheckView(user_id));
		
		return "user/mypage/my_order";
	}
	
	// 배송조회 팝업
	@RequestMapping("/delivery_info")
	public String deliveryInfo(HttpServletRequest request, Model model) {
		return "user/mypage/delivery_info";
	}
	
	// 마이페이지 주문내역 보기
	@RequestMapping("/myOrderInfo")
	public String MyOrderInfo(@RequestParam("order_number") String order_number,
								Model model) {
		
		model.addAttribute("orderListDto", orderListDao.MyOrderInfo(order_number));
		
		return "user/mypage/my_order_info";
	}
	
	// 마이페이지 비밀번호 확인 페이지
	@RequestMapping("/my_info_checkPw")
	public String myInfoCheckPage(@RequestParam("member_id") String member_id,
									Model model) {
		
		model.addAttribute("memberDto", memberDao.MyInfoCheckView(member_id));
		System.out.println(memberDao.MyInfoCheckView(member_id));
		
		return "user/mypage/my_info_checkPw";
	}
	
	// 마이페이지 비밀번호 확인
	@RequestMapping( value = "/myInfoCheck", method = RequestMethod.POST )
	public String myInfoCheck(@RequestParam("member_id") String member_id, 
								@RequestParam("member_pw") String member_pw,
								HttpServletRequest request,
								Model model) {
		
		int result = memberService.myInfoCheck(member_id, member_pw);
		System.out.println("result : " + result);
		
		if( result == 1 ) {
			request.getSession().setAttribute("alert", "checked!");
			request.getSession().setAttribute("member_id", member_id);
			
			return "redirect:my_info_change";
		} else {
			System.out.println("alert : " + "fail!");
			
			return "redirect:my_info_checkPw";
		}
	}
	
	// 개인정보수정 페이지
	@RequestMapping("/my_info_change")
	public String myInfoChangeView(HttpServletRequest request,
									Model model) {
		
		String user_id = (String)request.getSession().getAttribute("member_id");
		model.addAttribute("memberDto", memberDao.MyInfoChangeView(user_id));
		
		return "user/mypage/my_info_change";
	}
	// 이메일 중복 확인
	@RequestMapping("/my_info_change/emailCheckAjax")
	@ResponseBody
	public String emailCheckAjax(@RequestParam("member_email1") String member_email1,
							@RequestParam("member_email2") String member_email2,
							HttpServletRequest request, 
							Model model) {
		
		int result = memberService.emailCheckAjax(member_email1, member_email2);
		System.out.println("result : " + result);
		
		if( result >= 1 ) { // email 중복
			return("1");
		}else {
			return("0");
		}
	}
	// 개인정보수정
	@RequestMapping( value = "/myInfoChange", method = RequestMethod.POST )
	public String myInfoChange(@RequestParam("member_idx") String member_idx,
								@RequestParam("member_id") String memeber_id,
								@RequestParam("member_pw") String member_pw,
								@RequestParam("member_name") String member_name,
								@RequestParam("member_email1") String member_email1,
								@RequestParam("member_email2") String member_email2,
								@RequestParam("member_phone") String member_phone,
								@RequestParam("member_postcode") String member_postcode,
								@RequestParam("member_address1") String member_address1,
								@RequestParam("member_address2") String member_address2,
								@RequestParam("member_gender") String member_gender,
								Model model) {
		
		memberDao.updateMember(member_idx, 
								memeber_id,
								member_pw, 
								member_name, 
								member_email1,
								member_email2,
								member_phone,
								member_postcode,
								member_address1,
								member_address2,
								member_gender);
		
		return "redirect:my_order";
	}
	
	

	
	

	
}

