<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 

<c:import url="../user_header.jsp" />

<link rel="stylesheet" href="/css/user/join01.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<div class="join_page">
	
        <div><h3>회원가입</h3></div>
        
        <form action="joinMember" method="post" name="userInfo" onsubmit="return checkValue()">
            <table class="join_table">
            <tr>
                <td>아이디 *</td>
            </tr>
            <tr>
                <td>
                    <input type="text" class="id_input" name="member_id" id="member_id">
                    <input type="button" class="idcheck" onclick="idCheck()" value="중복 확인" >
                    <input type="hidden" name="member_id_check" id="member_id_check"  value="no">
                </td>
            </tr>
            <tr>
                <td>이메일 *</td>
            </tr>
            <tr>
                <td>
                    <input type="text" class="email_input" name="member_email1" id="member_email1">@
                    <input type="text" class="email_input" name="member_email2" id="member_email2">
                </td>
            </tr>
            <tr>
                <td>이름 *</td>
            </tr>
            <tr>
                <td>
                    <input type="text" class="infoBox" name="member_name" id="member_name" >
                </td>
            </tr>
            <tr>
                <td>비밀번호 *</td>
            </tr>
            <tr>
                <td>
                    <input type="password" class="infoBox" name="member_pw" id="member_pw">
                </td>
            </tr>
            <tr>
                <td>비밀번호 확인 *</td>
            </tr>
            <tr>
                <td>
                    <input type="password" class="infoBox" name="member_pw_check" id="member_pw_check" value="${memberDto.member_pw}">
                </td>
            </tr>
            <tr>
                <td>휴대폰 번호 *</td>
            </tr>
            <tr>
                <td>
                    <input type="text" class="phone" name="member_phone1" id="member_phone1" >-
                    <input type="text" class="phone" name="member_phone2" id="member_phone2" >-
                    <input type="text" class="phone" name="member_phone3" id="member_phone3" >
                </td>
            </tr>
            <tr>
                <td>우편번호 *</td>
            </tr>
            <tr>
                <td>
                    <input type="text" class="postcode" name="member_postcode" id="member_postcode">
                    <input type="button" class="search_pc" value="검색" onclick="showPostcode()">
                </td>
            </tr>
            <tr>
                <td>주소 *</td>
            </tr>
            <tr>
                <td>
                    <input type="text" class="infoBox" name="member_address1" id="member_address1">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" class="infoBox" name="member_address2" id="member_address2">
                </td>
            </tr>
            <tr>
                <td>생년월일 *</td>
            </tr>
            <tr>
                <td>
                    <input type="date" name="member_birthdate" id="member_birthdate" class="infoBox" pattern="\d{4}-\d{2}-\d{2}" >
                </td>
            </tr>
            <tr>
                <td>성별 *</td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="member_gender" id="member_gender" value="male">남자
                    <input type="radio" name="member_gender" id="member_gender" value="female">여자
                    <input type="radio" name="member_gender" id="member_gender" value="non">선택안함
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" class="check_all">
                    <label for="checkbox">
                        모두 동의합니다.
                    </label>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" class="check" id="checkbox">
                    <label for="checkbox">
                        (필수) 이용약관과 개인정보 수집 및 이용에 동의합니다.
                    </label>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" class="check" id="checkbox">
                    <label for="checkbox">
                        (필수) 만 14세 이상입니다.
                    </label>
                    <h6>만 19세 미만의 미성년자가 결제 시 법정대리인이 결제를 취소할 수 있습니다.</h6>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" class="check" >
                    <label for="checkbox">
                        (선택) 이메일 및 SNS 마케팅 정보 수신에 동의합니다.
                    </label>
                    <h6>회원은 언제든지 회원 정보에서 수신 거부로 변경할 수 있습니다.</h6>
                </td>
            </tr>
        </table>
        <div class="join_bt">
            <input type="submit" value="가입하기">
        </div>
        </form>
    </div>
    
    <script>
    
    // 아이디 중복 확인
    function idCheck() {
    	
        var member_id = $('#member_id').val();
        
        if(!member_id){
            alert("아이디를 입력하세요.");
            return false;
        }

        $.ajax({
        url : 'http://localhost:8090/join01/idCheckAjax?member_id='+member_id,
            type : 'get',
            success : function(data) {
                console.log("1 = 중복됨, 0 = 중복안됨 : "+ data);							
                
                var data_num = Number( data );
                
                if (data_num >= 1) {
                    // 1 : 아이디가 중복되는 문구
                    alert("아이디가 중복됩니다.");
                    $('#member_id_check').val("no");
                } else {
                    // 0 : 아이디가 안됨.
                    alert("아이디가 사용 가능합니다.");
                    $('#member_id_check').val("yes");
                }
            }, 
            error : function() {
                    console.log("실패");
            }
        });
           
    } 
    
    // 우편번호 찾기
    function showPostcode() {
		new daum.Postcode({
			oncomplete : function(data){
				// 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드 작성하는 부분
				
				// 각 주소의 노출 규칙에 따라 주소를 조합한다
				// 내려오는 변수가 값이 없을 경우엔 공백('')값을 가지므로 이를 참고해서 분기한다
				var fullAddr = ''; // 최종 주소 변수
				var extraAddr = ''; // 조합형 주소 변수
				
				// 사용자가 선택한 주소 타입에 따라 해당 주소값을 가져온다
				if(data.userSelectedType === 'R'){ // 사용자가 도로명 주소를 선택
					fullAddr = data.roadAddress;
				} else { // 지번 주소 선택
					fullAddr = data.jibunAddress;
				}
				
				// 사용자가 선택한 주소가 도로명 타입일 때 조합한다
				if(data.userSelectedType ==='R'){
					if(data.bname !== ''){
						extraAddr += data.bname;
					}
					if(data.buildingName !== ''){
						extraAddr += ( extraAddr !== ''?', ' + data.builingName : data.builingName );
					}
					
					// 조합형 주소 유무에 따라 양쪽 괄호 추가하여 최종 주소 만든다
					fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')': '');
				}
				
				// 우편번호와 주소정보를 해당 필드에 넣는다
				document.getElementById('member_postcode').value = data.zonecode; // 5자리 새 우편번호
				document.getElementById('member_address1').value = fullAddr;
				// 커서를 추가 상세주소 필드에 이동
				document.getElementById('member_address2').focus();
			}
		}).open();
    }

    // 체크박스 모두 체크
    $( document ).ready( function() {
    $( '.check_all' ).click( function() {
        $( '.check' ).prop( 'checked', this.checked );
    } );
    } );
    
    function checkValue() {
        
    	var pw = $("#member_pw").val();
    	var num = pw.search(/[0-9]/g);
    	var eng = pw.search(/[a-z]/ig);
    	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    	
        if(!document.userInfo.member_id.value) { //empty: null, 길이 0
            alert("아이디을 입력해주세요.");
            document.getElementById('member_id').focus();
            return false; //submit전송이 안됨
        }
        
        if(!document.userInfo.member_email.value) {
            alert("이메일을 입력해주세요.");
            document.getElementById('member_email').focus();
            return false; 
        }
        if(!document.userInfo.member_name.value) { //empty: null, 길이 0
            alert("이름을 입력해주세요.");
            document.getElementById('member_name').focus();
            return false; //submit전송이 안됨
        }
        if(!document.userInfo.member_pw.value) { //empty: null, 길이 0
            alert("비밀번호를 입력해주세요.");
            document.getElementById('member_pw').focus();
            return false; //submit전송이 안됨
        }
        if(pw.length < 8 || pw.length > 20){
    		alert("비밀번호를 8~20자리 이내로 입력해주세요.");
    		document.getElementById('member_pw').focus();
    		return false;
    	}
        if(pw.search(/\s/) != -1){
    		alert("비밀번호를 공백 없이 입력해주세요.");
    		document.getElementById('member_pw').focus();
    		return false;
    	}
        if(num<0 || eng<0 || spe<0) {
    		alert("영문, 숫자, 특수문자를 혼합하여 비밀번호를 입력해주세요.");
    		document.getElementById('member_pw').focus();
    		return false;
    	} 
        if( ! (document.userInfo.member_pw.value == document.userInfo.member_pw_check.value) ) {
            alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
            document.getElementById('member_pw').focus();
            return false; //submit전송이 안됨
        }
        if(!document.userInfo.member_phone1.value) { //empty: null, 길이 0
            alert("휴대폰 번호를 입력해주세요.");
            document.getElementById('member_phone1').focus();
            return false; //submit전송이 안됨
        }
        if(!document.userInfo.member_phone2.value) { //empty: null, 길이 0
            alert("휴대폰 번호를 입력해주세요.");
            document.getElementById('member_phone2').focus();
            return false; //submit전송이 안됨
        }
        if(!document.userInfo.member_phone3.value) { //empty: null, 길이 0
            alert("휴대폰 번호를 입력해주세요.");
            document.getElementById('member_phone3').focus();
            return false; //submit전송이 안됨
        }
        if(!document.userInfo.member_postcode.value) {
            alert("우편번호를 입력해주세요.");
            document.getElementById('member_postcode').focus();
            return false; 
        }
        if(!document.userInfo.member_address1.value) {
            alert("주소를 입력해주세요");
            document.getElementById('member_address1').focus();
            return false; 
        } 
        if(!document.userInfo.member_address2.value) {
            alert("주소를 입력해주세요");
            document.getElementById('member_address2').focus();
            return false; 
        } 
        if(!document.userInfo.checkbox.value) {
            alert("필수약관에 동의해주세요.");
            return false; 
        } 
        
        return true;
    }
    
    </script>
    
    <c:import url="../user_footer.jsp" />
    