<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<c:url value='/resources/vendor/jquery/jquery.js'/>"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style>
    #mask {  
      position:absolute;  
      z-index:9000;  
      background-color:#000;  
      display:none;  
      left:0;
      top:0;
    }
    .window{
      display: none;
      position:absolute;  
      left:100px;
      top:100px;
      z-index:10000;
    }
    
    
    .layer {
    position: fixed;
    width: 40%;
    left: 50%;
    margin-left: -20%; /* half of width */
    height: 300px;
    top: 50%;
    margin-top: -150px; /* half of height */
    overflow: auto;

    /* decoration */
    border: 1px solid #000;
    background-color: #eee;
    padding: 1em;
    box-sizing: border-box;
	}

	.hidden {
    	display: none;
	}
    </style>
    <script src="https://code.jquery.com/jquery-latest.js"></script> 
    <script>
    function wrapWindowByMask(){
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  

        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $('#mask').css({'width':maskWidth,'height':maskHeight});  

        //애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
        $('#mask').fadeTo("fast", 0.8);

        //윈도우 같은 거 띄운다.
        $('.window').show();
    }

    $(document).ready(function(){
        //검은 막 띄우기
        $('.openMask').click(function(e){
            e.preventDefault();
            wrapWindowByMask();
        });

        //닫기 버튼을 눌렀을 때
        $('.window .close').click(function (e) {  
            //링크 기본동작은 작동하지 않도록 한다.
            e.preventDefault();  
            $('#mask, .window').hide();  
        });       

        //검은 막을 눌렀을 때
        $('#mask').click(function () {  
            $(this).hide();  
            $('.window').hide();  
        });      
    });
    
    $('#open').click(function () {
        console.log("AAA");
        var $layer = $('.js-layer');
        $layer.removeClass('hidden');
    });
    </script>
</head>
<body>
    <div id="mask"></div>
    <div class="window">
        <input type="button" class="close" value="나는야 닫기 버튼(.window .close)"/>
    </div>
    <a href="#" class="openMask">검은 막 띄우기</a>
    
    <div class="js-layer  layer  hidden">
    	AAAAAAAAAAAAAAAAAAAAAAAA
	</div>
	<button type="button" class="js-open" id="open">Open Layer</button>
</body>
</html>