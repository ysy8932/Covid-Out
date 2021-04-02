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
<meta name="viewport"
   content="width=device-width, maximum-scale=1.0, minimum-scale=1, 
user-scalable=yes,initial-scale=1.0, target-densitydpi=medium-dpi" />
<link rel="stylesheet" href="${root}/css/dcommu/normalize.8.0.1.css">
<link rel="stylesheet" href="${root}/css/dcommu/dcomdetail.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
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
</head>
<script type="text/javascript">
   $(document).ready(function(){
     $("#delete-btn").click(function(){
       $("#myModal").modal();
     });
     
     
     $("#scrap-btn").click(function(){
      $("#myModalscrap").modal();
     });
     
     $("#scrapdel-btn").click(function(){
      $("#myModaldelscrap").modal();
     });
   });  
</script>
<body>
	<div class="sub_visual bg-menu">
	    <div class="txt">
	        <!-- <h1>커뮤니티</h1>
	        <p>의견을 공유하세요</p> -->
	    </div>
	    <div class="img-cover"></div>
	</div>
   
   <div class="con-table">
      <div class="con-box">
         <div class="con-title">
            <h1>
               <b>${dto.csubject }</b>
            </h1>
         </div>
         <div class="con-writer">
            <b>${dto.cwriter }</b>
         </div>
         <div class="con-writedate">
            <fmt:formatDate value="${dto.cwritedate }" pattern="yyyy-MM-dd HH:mm" />
            <span class="con-readcount">조회 ${dto.creadcount }</span>
         </div>
         <div class="con-content">
            <pre style="background-color: #fff; padding:10px;
            overflow: auto; white-space: pre-wrap; border: none; font-size: 1.2em; ">${dto.ccontent}</pre>
         </div>
         <div class="con-btn">
            <c:if test="${mdto.mnum == dto.cmidnum}">
            <button type="button" class="cbtn btn-upd"
               style="width: 80px;"
               onclick="location.href='updateform?num=${dto.cnum}&pageNum=${pageNum}'">수정</button>
         
            <button type="button" class="cbtn btn-del" id="delete-btn"
               style="width: 80px;">삭제</button>
            </c:if>
            <!-- 스크랩버튼추가 -->
            <c:if test="${loginok!=null}">
               <c:if test="${cardcheck>0}">
                  <button type="button" class="cbtn btn-scrdel" id="scrapdel-btn"
                     style="width: 80px; background-color: #FFC74F; border: 1px solid #FFC74F; color: #3B281F; font-weight: 400;" >스크랩</button>
               </c:if>
               <c:if test="${cardcheck==null||cardcheck==0}">
                  <button type="button" class="cbtn btn-scr" id="scrap-btn"
                  style="width: 80px;" >스크랩</button>
               </c:if>
            </c:if>
            <!-- 위까지 -->

            <button type="button" class="cbtn btn-list"
            style="width: 80px;"
            onclick="location.href='list?pageNum=${pageNum}'">목록</button>
            
            
         </div>
      </div>
   </div>

   <!-- 모달 -->

   <div class="modal fade" id="myModal" role="dialog" style="margin-top: 130px;">
      <div class="modal-dialog">

         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header" style="padding: 35px 50px; height: 200px;">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h3>
                  게시물을 정말 삭제하시겠습니까?
               </h3>
            </div>
            <form action="delete" method="post" class="form-inline">
               <input type="hidden" name="cnum" value="${dto.cnum}">
                 <input type="hidden" name="pageNum" value="${pageNum }">   
               <div class="modal-body" style="padding: 40px 50px; text-align: center;">
                  <button type="submit" class="modal-btn modal-btn-del" style="width: 80px;">
                     <span class="glyphicon glyphicon-trash"></span> 삭제
                  </button>
                  <button type="button" class="modal-btn modal-btn-no" style="width: 80px;" data-dismiss="modal">
                     <span class="glyphicon glyphicon-remove"></span> 취소
                  </button>
               </div>
            </form>
         </div>
      </div>
   </div>
   
   <!-- 스크랩추가 모달 -->
   <div class="modal fade" id="myModalscrap" role="dialog" style="margin-top: 130px;">
      <div class="modal-dialog">

         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header" style="padding: 35px 50px; height: 200px;">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h3>
                  게시물을 스크랩하시겠습니까?
               </h3>
            </div>
            <form action="cardscrap" method="post" class="form-inline">
               <input type="hidden" name="sbnum" value="0">
               <input type="hidden" name="scnum" value="${dto.cnum}">
                 <input type="hidden" name="smidnum" value="${mdto.mnum}">
                 <input type="hidden" name="num" value="${dto.cnum}">
                 <input type="hidden" name="pageNum" value="${pageNum}">      
               <div class="modal-body" style="padding: 40px 50px; text-align: center;">
                  <button type="submit" class="modal-btn modal-btn-yes" style="width: 80px;">확인</button>
                  <button type="button" class="modal-btn modal-btn-no" style="width: 80px;" data-dismiss="modal">취소</button>
               </div>
            </form>
         </div>
      </div>
   </div>
   
   <!-- 스크랩삭제 모달 -->
   <div class="modal fade" id="myModaldelscrap" role="dialog" style="margin-top: 130px;">
      <div class="modal-dialog">

         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header" style="padding: 35px 50px; height: 200px;">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h3>
                  게시물을 스크랩취소하시겠습니까?
               </h3>
            </div>
            <form action="cardscrapdel" method="post" class="form-inline">
               <input type="hidden" name="sbnum" value="0">
               <input type="hidden" name="scnum" value="${dto.cnum}">   
               <input type="hidden" name="smidnum" value="${mdto.mnum}">
               <input type="hidden" name="num" value="${dto.cnum}">
               <input type="hidden" name="pageNum" value="${pageNum}">     
               <div class="modal-body" style="padding: 40px 50px; text-align: center;">
                  <button type="submit" class="modal-btn modal-btn-yes" style="width: 80px;">확인</button>
                  <button type="button" class="modal-btn modal-btn-no" style="width: 80px;" data-dismiss="modal">취소</button>
               </div>
            </form>
         </div>
      </div>
   </div>
</body>
</html>