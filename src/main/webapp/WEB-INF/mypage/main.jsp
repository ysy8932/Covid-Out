<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="mypage_wrapper">
	<div class="mypage_hadder">
		<div class="header_title">
			My Page
		</div>
	</div>
	
	<div class="mypage_menubar">
		<ul class="mypage_menu_icon">
			<li class="mpick">
				<a href="${root}/mypage.main">
					<div class="mypage_icon icon_mypage"></div>
					마이페이지
				</a>
			</li>
		
			<li>
				<a href="${root}/mypage.content">
					<div class="mypage_icon icon_mycontent"></div>
					내가 쓴 글
				</a>
			</li>
			<li>
				<a href="${root}/mypage.scrap">
					<div class="mypage_icon icon_scrap"></div>
					스크랩
				</a>
			</li>
			<li>
				<a href="${root}/mypage.reservation">
					<div class="mypage_icon icon_reservation"></div>
					예약내역
				</a>
			</li>
		</ul>
	</div>
	
	
	
	<div class="mycontent_info">
			
		<div class="myinformation_title">나의 정보</div>
			
			<div class="myinformation_card">
				
	<%-- 		<div>
					<img src="${root}/image/covid_symbol.png" />
				</div> --%>
				<div class="myinformation_cardIn">
					<div class="myinformation_name" style="display:flex">
						${mdto.mid}
					<c:if test="${mdto.mrole==0}">
						<h2>&nbsp;&nbsp;일반회원</h2>
					</c:if>
					<c:if test="${mdto.mrole==1}">
						<h2>&nbsp;&nbsp;전문회원</h2>
					</c:if>
					</div>
				
					<h4>${mdto.mnick}</h4>
				
					<h4>${mdto.memail}</h4>
				
					<h4>${mdto.mhp}</h4>
					<div class="myinformation_btn">	
						<button type="button" id="mupdate_btn">정보수정</button>
						<button type="button" id="mdelete_btn">회원탈퇴</button>
						<button type="button" id="updatempw_btn">비밀번호 변경</button>
					</div>
				</div>
				<div class="myinformation_img">
				
				</div>
			</div>		
		</div>

</div>


<!-- 회원수정 모달 -->
<div class="modal fade" id="updateMember" role="dialog">
   <div class="modal-dialog">

      <div class="modal-content" style="z-index: 11;">
         <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal">&times;</button>
             <h4 class="modal-title">회원정보를 수정하시려면 비밀번호를 입력해주세요.</h4>
         </div>
         <form action="${root}/member/update.passcheck" method="post">
              <div class="modal-body" style="display:flex; justify-content: center; align-items: center;">
               <label class="signup_input">
                  <input type="password" name="mpw" style="font-family:serif; class="mpw" required>
                  <span class="signup_input_sp"> <span class="glyphicon glyphicon-lock"></span> Password</span>
               </label>
              </div>
              <div class="modal-footer">
                 <button type="submit" class="btn btn-default">수정하기</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
              </div>
           </form>
      </div>
    </div>
</div>
<!--// 회원수정 모달 -->
<!-- 회원정보 삭제 모달 -->
<div class="modal fade" id=deleteMember role="dialog">
   <div class="modal-dialog">

      <div class="modal-content" style="z-index: 11;">
         <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal">&times;</button>
             <h4 class="modal-title">탈퇴를 원하시면 비밀번호를 입력해주세요.</h4>
         </div>
         <form action="${root}/member/del.passcheck" method="post">
              <div class="modal-body" style="display:flex; justify-content: center; align-items: center;">
               <label class="signup_input">
                  <input type="password" name="mpw" style="font-family:serif; class="mpw" required>
                  <span class="signup_input_sp"> <span class="glyphicon glyphicon-lock"></span> Password</span>
               </label>
              </div>
              <div class="modal-footer">
                 <button type="submit" class="btn btn-default">수정하기</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
              </div>
           </form>
      </div>
    </div>
</div>
<!--//회원정보 삭제 모달 -->

<!-- 회원정보 삭제 모달 -->
<div class="modal fade" id=updatempw role="dialog">
   <div class="modal-dialog">

      <div class="modal-content" style="z-index: 11;">
         <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal">&times;</button>
             <h4 class="modal-title">비밀번호를 입력해주세요.</h4>
         </div>
         <form action="${root}/member/updatepass" method="post">
              <div class="modal-body" style="display:flex; justify-content: center; align-items: center; flex-direction: column;">
               <label class="signup_input">
                  <input type="password" name="mpw" class="mpw" style="font-family:serif; required>
                  <span class="signup_input_sp"> <span class="glyphicon glyphicon-lock"></span> Password</span>
               </label>
               <br>
               <label class="signup_input">
                  <input type="password" name="upmpw0" style="font-family:serif; class="mpw" required>
                  <span class="signup_input_sp"> <span class="glyphicon glyphicon-lock"></span> Update Your Password</span>
               </label>
               <br>
               <label class="signup_input">
                  <input type="password" name="upmpw1" style="font-family:serif; class="mpw" required>
                  <span class="signup_input_sp"> <span class="glyphicon glyphicon-lock"></span> Check your Password</span>
               </label>
              </div>
              <div class="modal-footer">
                 <button type="submit" class="btn btn-default">수정하기</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
              </div>
           </form>
      </div>
    </div>
</div>
<!--//회원정보 삭제 모달 -->

</body>
<script type="text/javascript">
//정보수정
   $(document).ready(function(){
      $("#mupdate_btn").click(function(){
         $("#updateMember").modal();
      });
   });
//회원탈퇴
   $(document).ready(function(){
      $("#mdelete_btn").click(function(){
         $("#deleteMember").modal();
      });
   });
//비밀번호 수정
   $(document).ready(function(){
      $("#updatempw_btn").click(function(){
         $("#updatempw").modal();
      });
   });
</script>

</html>