<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>무통장입금</title>
<style>
    .select_box01{
        height:40px;
        width:300px;
        border:1px solid #d6d6d6;
        text-align: center;
    }
    #intro_box{
        padding:0;
    }
    #intro_box li{
        list-style: none;
        font-size: 13px;
        padding-top:5px;
        color:#484848;
    }
</style>
<body>
    <select name="numbersel" id="number_box" class="select_box01">
        <option selected value="choice">입금 계좌번호 선택(반드시 주문자 성함으로 입금)</option>
        <option value="국민은행">국민은행 123-321-2345 예금주:(주)비쥬</option>
        <option value="우리은행">우리은행 123-1234-142 예금주:(주)비쥬</option>
        <option value="농협은행">농협은행 123-567-9009 예금주:(주)비쥬</option>
    </select>
    <ul id="intro_box">
        <li>· 선택된 입금계좌로 인터넷 뱅킹, 은행 방문 등을 통해 입금해주세요.</li>
        <li>· 반드시 입금 기한 내에 정확한 결제금액을 입금해 주세요.</li>
        <li>· 입금 기한이 지나면 주문은 자동으로 취소됩니다.</li>
    </ul>
</body>
</html>