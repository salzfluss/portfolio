<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>  

<c:import url="../user_header.jsp" />

<link rel="stylesheet" href="/css/user/user_cart.css">

	<script language="JavaScript">

   	var item_price;
    var item_amount;

    function init () {
    	item_price = document.form.item_price.value;
    	item_amount = document.form.item_amount.value;
    	document.form.sum.value = item_price;
    	change();
    }

    function add ( index ) {
    	 
    	hm = eval('document.form.item_amount' + index);

		hm.value ++ ;
  	
    }

    function del ( index ) {
        
    	hm = eval('document.form.item_amount' + index);
    	
    		if (hm.value > 1) {
    			hm.value -- ;
    			
    		}
    } 

    function change( index )  {
    
    	item_price = eval('document.form.item_price' + index + '.value');
    	hm = eval('document.form.item_amount' + index);
    	sum = eval('document.form.sum' + index);
    	total = document.form.total;
    	
    	sum.value = parseInt(hm.value * item_price) + " ì";

		
    	var listsize = document.getElementById('listsize').value;

  		var sume = 0;
  		
  		for(var i = 0; i<listsize; i++){

  			item_price = eval('document.form.item_price' + i + '.value');
  	    	hm = eval('document.form.item_amount' + i);
  	    	sum = eval('document.form.sum' + i + '.value');

  	    	sume += parseInt(sum);
  	  
  		} 		

      	total.value = parseInt(sume) + 2500;

    
    	tv = parseInt(total.value);
    	
    	if(tv >= 30000){ 
			console.log("ifì  ìì sume"+sume);
        	document.form.transfee.value = 0 ;
        	total.value = parseInt(sume) ;
        	
        	}else { 

        		document.form.transfee.value = 2500 ; 
            	total.value = parseInt(sume) + 2500;}
				    	  
    	}


    
	//íì´ì§ ë¡ë©ì ìëì¼ë¡ ììëë í¨ì
	$(document).ready(function() { 

		var listsize = document.getElementById('listsize').value;

		var sume = 0;
		
		for(var i = 0; i<listsize; i++){

			item_price = eval('document.form.item_price' + i + '.value');
	    	hm = eval('document.form.item_amount' + i);
	    	sum = eval('document.form.sum' + i + '.value');

	    	sume += parseInt(sum);

	    	console.log(item_price);
	    	console.log(sum);
	    	console.log(sume);
		}
		
		
    	total = document.form.total;

    	total.value = parseInt(sume) + 2500;

    	console.log(sume);

    	
	
    	tv = parseInt(total.value);

    	if(tv >= 30000){ 

        	document.form.transfee.value = 0 ;

        	total.value = parseInt(sume) ;
        	
        	}else { 

        		document.form.transfee.value = 2500 ; 
        		total.value = parseInt(sume) + 2500 ;
        		}
    	
	});

/*  
	//íì´ì§ ë¡ë©ì ìëì¼ë¡ ììëë í¨ì
	$(document).ready(function() { 

		var listsize = document.getElementById('listsize').value;

		var sume = 0;
		
		for(var i = 0; i<listsize; i++){

			document.form.transfee.value = 0 ;
	    	
	    	sum = eval('document.form.sum' + i + '.value');

	    	sume += parseInt(sum);
    
		}
		
    	sumview = document.form.sumview;

    	sumview.value = parseInt(sume);

    	console.log(sume);

    	
	
    	tv = parseInt(totalview.value);

    	if(tv >= 30000){ 
    		
        	document.form.transfeeview.value = 0 ;

        	totalview.value = parseInt(sume) ;
        	
        	}else { 

        		document.form.transfeeview.value = 2500 ; 
        		totalview.value = parseInt(sume) + 2500 ;
        		}
    	
	}); */


 	
	$(document).ready(function () {
		  $(document).on("click", "button[name='delbt']", function () {
			var tth = $(this).val();
		    console.log(tth);

		    if(confirm("ì ë§ ì­ì íìê² ìµëê¹??") == true){
		    	location.href="cart_delete?cart_item_idx="+tth;
				console.log("ì­ì ëëidx"+tth);
		    }else{
		    	  return false;
			    }
		    
		  });
		});

	$(document).ready(function() { 

		var link = document.location.href; console.log(link);

		document.form.page_url.value = link;
    	
	});

	</script>

    <!--        cart_section         -->
    <div class="cart" onload="init();"> 
    
   
    
   <form action="order_view" name="form" id="form" method="post">   
   
    <input type="hidden" name="listsize" id="listsize" value="${ listsize }"/>
    <input type="hidden" name="member_id" id="member_id" value="${ memberDto.member_id }" />
    <input type="hidden" name="page_url" value="" />
     
    
    <div class="cart_div">
        <h5 class="cart_title">ì¥ë°êµ¬ë</h5>    
        <table class="cart_table" id="cart_table">
        
           <colgroup>
                <col style="width:5%;">
                <col style="width:40%;">
                <col style="width:20%;">
                <col style="width:20%;">
                <col style="width:10%;">
                <col style="width:10%;">
            </colgroup>
             <thead>
                <th scope="col">ë²í¸</th>      
                <th scope="col">ìíì ë³´</th>
                <th scope="col">ìíê°ê²©</th>
                <th scope="col">ìíìë</th>
                <th scope="col">ìíì´ì¡</th>               
                <th scope="col"></th>
            </thead>
     	     
            <tbody>
              
       			 <c:forEach var="cart_dto" items="${ list }" varStatus="status"> 
                 <tr>                	
                    <td class="idxtd">
                    <input type="hidden" name="cart_item_idx${status.index}" id="idx" value="${ cart_dto.cart_item_idx }"/>
                    <input type="hidden" name="cart_member_id" id="cart_member_id" value="${ cart_dto.cart_member_id }"/>
                    <input type="checkbox" name="checkbox${status.index}" id="chkbox" class="chkbox2" value="${ cart_dto.cart_item_idx }"> <c:out value="${status.count}" /> 
                    </td>
                    <td class="img_sec">
                        <div class="prd_img">                       
                            <img src="${ cart_dto.cart_item_img }" alt="ìíì´ë¯¸ì§">
                        </div>                  
                        <div class="prd_name">
                          ${ cart_dto.cart_item_name }
                          
                        </div>                      
                    </td>
                    <td><input type="text" size="11" value="${ cart_dto.cart_item_price } ì" style="border: none; outline: none; width: 200px; text-align: center;"readonly> </td>
                    <td>                 	  
                        <div class="btn_qty updown">
            			<input type=hidden name="item_price${status.index}" value="${ cart_dto.cart_item_price }">
						<input type="button" value=" - " onclick="del(${status.index});" class="downbt" name="downbt">
						<input type="text" name="item_amount${status.index}" class="item_amount" value="${ cart_dto.cart_item_amount }" size="3" >
						
						<input type="button" value=" + " onclick="add(${status.index});" class="upbt" name="upbt">
                        <input type="button" id="btn" onclick="change(${status.index});" value="ë³ê²½" />
                        </div>                  	 
                    </td>
                    
                    <td><input type="text" id="sum${status.index}" name="sum${status.index}" size="11" value="${ cart_dto.cart_item_price *  cart_dto.cart_item_amount } ì" style="border: none; outline: none; width: 200px; text-align: center;"readonly> </td>
                    
                    <td> <button type="button" class="delete_btn" id="delbt" name="delbt"  value="${ cart_dto.cart_item_idx }">ìíì­ì </button></td>
               			<!-- onClick="location.href='cart_delete?cart_item_idx=${ cart_dto.cart_item_idx }'" -->
                </tr>       
              </c:forEach>
              
              
              
            </tbody>            
        </table>
     
     	
     
     
        </div>
        <br>
        <div id="chkbox_div">
        <span><button type="button" id="all_btn" class="all_btn" name="all_btn" onclick="allcheck()">ì ì²´ì í</button></span>&nbsp<span><button type="button" class="delete_allbtn" id="select_del" name="select_del" onclick="selectdel()">ì íì­ì </button></span>
    			<!-- onClick="this.value=check(this.form.checkbox)" -->
        </div>
        <div class="order_price">     		
            <div class="total_price">       
            	
            	<span style="font-size: 15px;" id="transport">ë°°ì¡ë¹<input type="text" id="transfee" name="transfee" style="border: none; outline: none; width: 50px; text-align: center;" value="2500" readonly/>ì</span>        	            	
           		<br>
                <span>ì´í© <input type="text" id="total" name="total" size="11" style="border: none; outline: none; width: 100px; text-align: center;" readonly/>ì</span>
                
            </div>
  
        </div>
        
    
        <c:if test="${ listsize ne 0 }">  
			        <div class="btn_sec">
			        <!-- <button class="order_btn" type="submit" value="oder" formaction="order_view">ì£¼ë¬¸íê¸°</button> -->
			            <button class="order_btn" type="submit" value="oder" formaction="order_view">ì£¼ë¬¸íê¸°</button>
			        </div>
		  </c:if>
		  
		  <c:if test="${ memberDto.member_id ne null and listsize eq 0 }">  
			        <div class="btn_sec">
			        <!-- <button class="order_btn" type="submit" value="oder" formaction="order_view">ì£¼ë¬¸íê¸°</button> -->
			            <button class="order_btn" type="button" value="order" onclick="chk2();">ì£¼ë¬¸íê¸°</button>
			        </div>
		  </c:if>
		
        <c:if test="${ memberDto.member_id eq null }">  
        		 <div class="btn_sec">          
        		    <button class="order_btn" type="button" value="order" onclick="chk();">ì£¼ë¬¸íê¸°</button>	            	
	             </div>
        </c:if>
        
        
        
         </form>    
    </div>
    
    
    
    <script language="JavaScript">


	function allcheck() { 
		pattern = /^check/; 
		for(i = 0 ; i < document.form.elements.length ; i++){ 

			var ele = document.form.elements[i]; 
			if (pattern.test(ele.name)) ele.checked = !ele.checked; 

			} }
	



	function selectdel(){
		
		var listsize = document.getElementById('listsize').value;

		for(var i = 0; i<listsize; i++){
			var ck = eval('document.form.checkbox' + i);
	    	var ckval = eval('document.form.checkbox' + i + '.value');

	    		if($(ck).prop("checked") == true){
	    		  if(confirm("ì ë§ ì­ì íìê² ìµëê¹??") == true){
			 	   	location.href="cart_delete?cart_item_idx="+ckval;
					console.log("ì­ì ëëidx"+ckval);
			  	  }else{
			    	  return false;
				  	  }}

	    	
			}

		}
	
		
	function chk(){
		alert("ë¡ê·¸ì¸ í´ì£¼ì¸ì");

		return false;
		}

	
	function chk2(){
		alert("ì¥ë°êµ¬ëê° ë¹ì´ììµëë¤");

		return false;
		}
	

	
	</script>

  	<c:import url="../user_footer.jsp" />