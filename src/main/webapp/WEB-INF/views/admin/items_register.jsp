
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %> 
    

<c:import url="header.jsp" />
<link rel="stylesheet" href="/css/admin/item_register.css">

        <div class="item_register">
	        <form action="itemsRegisterForm" method="POST" name="form" enctype="multipart/form-data">
	        
	            <div class="sub_box">
	                <div class="sub_name">
	                    <h2>상품등록</h2>
	                </div>
	            </div>
	            <div class="orderer_info">
                    <table>
                        <colgroup>
                            <col style="width:168px">
                        </colgroup>
                        <tbody class="orderer_body">
                            <tr>
                                <th scope="row">
                                    <div class="category">
                                        카테고리
                                    </div>
                                </th>
                                <td>
                                    <select name="item_category" id="email_box" class="select_box">
                                        <option selected value="Choice">선택하세요</option>
                                        <option value="Ring">Ring</option>
                                        <option value="Necklace">Necklace</option>
                                        <option value="Bracelet">Bracelet</option>
                                        <option value="Earring">Earring</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <div class="category">
                                        옵션
                                    </div>
                                </th>
                                <td>
                                    <select name="item_option" id="email_box" class="select_box">
                                        <option selected value="Choice">선택하세요</option>
                                        <option value="Best">Best</option>
                                        <option value="New">New</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <div class="name_register">
                                        상품명
                                    </div>
                                </th>
                                <td>
                                    <input type="text" name="item_name" id="sender" class="MS_input_txt">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <div class="price_register">
                                        가격
                                    </div>
                                </th>
                                <td>
                                    <input type="text" name="item_price" id="sender" class="MS_input_txt">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <div class="img_register">
                                        메인이미지등록
                                    </div>
                                </th>
                                <td>
                                    <input type="file" name="item_MainImg">  
                              
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <div class="img_register">
                                        이미지등록
                                    </div>
                                </th>
                                <td>
                                   <input type="file" name="item_img"> 
                              <!--   <input type="text" name="item_img" value="테스트">   -->  
                                </td>
                            </tr>
                            <tr class="item_detail">
                                <th scope="row">
                                    <div>
                                        상세내용
                                    </div>
                                </th>
                                <td>
                                    <textarea id="notice_contents" cols="100" rows="10" name="item_content">
                                            
                                        </textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
	            </div>
	            <div class="button_box">
	                <input type="submit" value="등록" class="register_btn">
	                <button type="button" onClick="location.href='/items_list'" class="cancle_btn">취소</button>
	            </div>
            </form>
        </div>
    </div>
    
</body>

</html>