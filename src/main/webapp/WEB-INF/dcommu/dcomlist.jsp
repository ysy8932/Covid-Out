<%@page import="java.util.List"%>
<%@page import="spring.card.dao.CardDao"%>
<%@page import="spring.dto.CardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="<%=request.getContextPath()%>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(document).ready(function() {
		$("#btn-insert").click(function() {
			var loginok= $("#loginok").val();
			if(loginok != ""){
				location.href="writeform?cmidnum=${mdto.mnum}&pageNum=${currentPage }";
			}else{
				alert("회원가입후 다시 이용해주세요");
				location.href="/member/login";
			}
		});
		
		//전체 선택하면 입력단어 지워주기
		$("#searchType").change(function(){
			$("#keyword").val("");
		});
	});//$function close
	
	/* 검색 함수*/
function callCardList() {
		var searchType=$("#searchType").val();
		var keyword=$("#keyword").val();
		var num=$("#num").val();
		//alert(word+","+search);
		//alert(search+":"+word);
		//검색한 값이랑 단어의 값을 넣으면
		//전체 선택했을 경우,
		$.ajax({
			type:"get",
			dataType: "json",
			url:"/doctor/dsearch",
			data:{"searchType":searchType,"keyword":keyword},
			success:function(data){
				//alert(data);
				
				var s = '';
				$.each(data,function(index,item){
					var cphoto = item.cphoto;
					var csubject = item.csubject;
					var cwriter = item.cwriter;
					var cwritedate = item.cwritedate;
					s+='<img src="https://previews.123rf.com/images/sapannpix/sapannpix1604/sapannpix160400008/54710924-%EC%9D%98%EC%82%AC%EC%99%80-%EA%B0%84%ED%98%B8%EC%82%AC-%EB%B0%8F-%EC%9D%98%EB%A3%8C-%EC%A7%81%EC%9B%90%EC%9D%80-%ED%8F%89%EB%A9%B4-%EB%94%94%EC%9E%90%EC%9D%B8-%EC%95%84%EC%9D%B4%EC%BD%98-%EC%84%B8%ED%8A%B8.jpg" width="0px" height="0px"/>'
					s+='<div class="dcom-prod-list-bar dcom-con">';
					s+='<div class="dcom-prod-list-box">';
					s+='<ul class="dcom-row">';
					s+='<li class="dcom-cell">';
					s+='<a href="detail?num='+num+'&pageNum=${currentPage }&key=list">';
					s+='<div class="dcom-img-bar">';
					s+='<div class="dcom-img-box">';
					s+='<img src="${pageContext.request.contextPath}/resources/save/'+cphoto+'"alt="">';
					s+='</div>';
					s+='<div style="position: relative; max-width: 100%; background-color: black; display: block; white-space: nowrap;">';
					s+='<div class="dcom-prod-subject">'+csubject+'</div>';
					s+='<div class="dcom-prod-writer">'+cwriter+'</div>';
					s+='<div class="dcom-prod-day">'+cwritedate+'</div>';	
					s+='</div></div></a></li></ul></div></div>';
					
				});
				$("#cnffur").html(s);
			}
		});
	}
/* 검색 함수*/
</script>
<style>
	/* 배너 */
/* .img-cover{position: absolute;height: 100%;width: 100%;background-color: rgba(0, 0, 0, 0.5);z-index:1;} */
.sub_visual .txt{position: absolute;top:50%;left:50%;transform: translate(-50%, -50%);color: black;z-index: 2;text-align: center;}
.sub_visual .txt h1:after{display:block;width:40px;height:3px;margin:32px auto;background:white;content:'';}
.sub_visual .txt p{font-size: 14pt; font-weight: 300;}
.sub_visual{position: relative;background-image: url("${root}/image/dcommu_visual.png");
				height: 400px;background-size:cover;background-position:center;}
/* 배너 */
</style>
	

<body>
<div class="sub_visual bg-menu">
    <div class="txt">
        <!-- <h1>커뮤니티</h1>
        <p>의견을 공유하세요</p> -->
    </div>
    <div class="img-cover"></div>
</div>
	<!-- <div class="dcom-top-bn-box con">
		<div class="dcom-img-mainbox">
			<img style="height: 400px;"
				src="https://www.fashionseoul.com/wp-content/uploads/2017/01/20170112_SBS-2.jpg"
				alt="">
		</div>
	</div -->
	<input type="hidden" id="loginok" value="${mdto.mid }" />
	<!-- search start -->
	<div class="dcom-search-bar">
		<div class="dcom-search-box">
			<div class="dcom-tc">
				<c:if test="${totalCount==0 }">
					<div>
						<b>등록된 글이 없습니다</b>
					</div>
				</c:if>
				<c:if test="${totalCount>0 }">
					<div>
						<b>총 ${totalCount }개의 게시글이 등록되어있습니다</b>
					</div>
				</c:if>
			</div>
			<div class="form-inline">
			<input type="hidden" id="totalCount" name="totalCount" value="${totalCount }">
			<input type="hidden" id="currentPage" name="currentPage" value="${currentPage}">
				<select id="searchType" name="searchType" style="width: 100px; height: 32px;">
					<option value="all">전체</option>
					<option value="t">제목</option>
					<option value="c">내용</option>
					<option value="w">작성자</option>
				</select> 
				<input class="form-control" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요" />
				<button id="searchBtn" class="dcom-search-btn" onclick="callCardList()">검 색</button>
				<button type="button" id="btn-insert" class="dcom-write-btn" style="width: 100px;">게시글작성</button>
			</div>
			
		</div>
	</div>
	<!-- search end -->
	<jsp:include page="dcomlistslide.jsp"></jsp:include>
	<hr class="slideline">
	
  	<!-- card start-->
	<div class="dcom-prod-list-bar dcom-con" id="cnffur">
		<div class="dcom-prod-list-box">
			<ul class="dcom-row">
				<c:forEach var="d" items="${list }" varStatus="i">
					<input type="hidden" id="num" value="${d.cnum}">
					<li class="dcom-cell"><a href="detail?num=${d.cnum}&pageNum=${currentPage }&key=list">
							<input type="hidden" value="${i.count}">
							<div class="dcom-img-bar">
								<div class="dcom-img-box">
								<!-- 상대경로  ${pageContext.request.contextPath}-->
									<img src="${pageContext.request.contextPath}/resources/save/${d.cphoto }" alt=""
										onerror="this.src='${pageContext.request.contextPath}/resources/image/nonimg.png'">
								</div>
								<div style="position: relative; max-width: 100%; background-color: #eee; display: block; white-space: nowrap; padding: 10px;">
									<div class="dcom-prod-subject">${d.csubject}</div>
									<div class="dcom-prod-writer">${d.cwriter}</div>
									<div class="dcom-prod-day">
										<fmt:formatDate value="${d.cwritedate}" pattern="yyyy MM-dd HH:mm" />
									</div>
								</div>
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- card end-->
	<div class="page-bar">
		<ul class="pagination page-box">
			<c:if test="${startPage>1 }">
				<li class="page-item">
					<a class="page-link" href="list?pageNum=${startPage-1 }">이전</a>
				</li>
			</c:if>
			<!-- 페이지 번호 -->
			<c:forEach var="pp" begin="${startPage }" end="${endPage }">
				<c:if test="${pp==currentPage }">
					<li class="page-item">
						<a class="page-link" href="list?pageNum=${pp }">${pp }</a>
					</li>
				</c:if>
				<c:if test="${pp!=currentPage }">
					<li class="page-item">
						<a class="page-link" href="list?pageNum=${pp }">${pp }</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<totalPage}">
				<li class="page-item">
					<a class="page-link" href="list?pageNum=${endPage+1 }">이전</a>
				</li>
			</c:if>
		</ul>
</div>
</body>
</html>