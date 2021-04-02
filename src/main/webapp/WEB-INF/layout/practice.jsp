<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- section 지정 -->
	<div id="full-page">
	
	
	
	
		<div class="section sec0">
			<div class="sec0_content">
				내용1
			</div>
			<div class="sec0_content">
				내용2
			</div>
		</div>
		
		
		
		
		<div class="section sec1">
			<div class="sec1_content">
				내용1
			</div>
			<div class="sec1_content">
				내용2
			</div>
		</div>
		
		
		
		
		<div class="section sec2">
			<div class="sec2_content">
				내용1
			</div>
		</div>
		
		
		
		
		<div class="section sec3 fp-auto-height">
			<footer>
				<div class="footer_info">
		            <div class="info">
		                <P class="footer_title">INFO</P>
<pre>		           

콘텐츠산업진흥법에 의한 표시
① 콘텐츠의 명칭 : 의약정보
② 콘텐츠의 제작 및 표시 : 2021년 02월 21일 
③ 콘텐츠의 제작자 : 산넘어 산
④ 콘텐츠의 이용조건 : 동의없이 무단복제 및 가공을 금함
</pre>
	           		</div>
	            	<div class="help">
<P class="footer_title">GET HELP</P>
<pre>
	
<span>* 운영시간 이후에는 e-메일 문의 가능</span>
<span class="phone">010-0000-0000</span>
e-메일 : <a href="sanneommeo@bitcamp.com">sanneommeo@bitcamp.com</a> | Fax : 02:000:0000
<span class="glyphicon glyphicon-alert alert"></span>전화 전 확인하세요.
</pre>
	            	</div>
	        	</div>
	        </footer>
		</div>
	</div>
	
	

</body>
<!-- 풀페이지를 위해 body가 끝나는 부분에 script 작성. -->
<script>
	new fullpage('#full-page',{
		licenseKey:'6619A8BC-AED84394-82634D72-D582DA68',
		navigation:true,
		navigationTooltips:['Home','About','Contact'],
		scrollingSpeed:1000,
		//스크롤이 시작할 때.
		//origin : 원래 있었던 섹션에 대한 정보(0부터)
		//destination : 이동하는 섹션에 대한 정보
		//direction : 방향
		onLeave:function(origin, destination, direction){
			if(destination.index == 1){
				$('.sec1 .fp-tableCell > div.sec1_content').css('opacity','0');
			}
		},
		//스크롤이 끝났을 때.
		afterLoad:function(origin, destination, direction){
			if(destination.index == 1){
				$('.sec1 .fp-tableCell > div.sec1_content').css('opacity','1');
			}
		}
		
	});
</script>
</html>