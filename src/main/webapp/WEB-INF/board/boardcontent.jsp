<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
<!-- css -->
<link rel="stylesheet" href="${root}/css/board/boardcontent.css" />

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- smarteditior -->
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- jquery  -->
<script type="text/javascript">  
$(function(){
	
	answer_list();
	
	/// 댓글 삭제하기
	$(document).on("click","a.del",function(){
			//idx 읽기
			var aidx=$(this).attr("aidx");
			if(confirm("댓글을 삭제하려면 [확인]을 눌러주세요")==true){				
				$.ajax({
					type:"get",
					url:"answerdelete",
					data:{"aidx":aidx},
					dataType:"html",
					success:function(data)
					{
						answer_list();//댓글 다시 출력					
					}
				});
			}
		});
	
	
	/////////////댓글 저장
	$("#ans_savebtn").click(function(){
		
		var acnum=$("#acnum").val();
		var amidnum=$("#amidnum").val();
		var awriter=$("#awriter").val();
		var amemo = $("#amemo").val();
		
		//alert(acnum+"/"+amidnum+"//"+awriter+"///"+amemo);
		
		$.ajax({
			type:"post",
			url:"answersave",
			data:{"acnum":acnum,"amidnum":amidnum,"awriter":awriter,"amemo":amemo},
			dataType:"html",
			success:function(data)
			{
				$("#amemo").val("");
				answer_list();
				alert("success!!!!!");
				
			}

		});  

	});
	
});

/* function 끝*/

function answer_list()

	{
		//db로부터 댓글 목록을 가져와서 id "answer" 출력하기
		var acnum=$("#acnum").val();

		
		$.ajax({
			type:"get",
			url:"answerlist",
			dataType:"json",
			data:{"acnum":acnum},
			success:function(data){				
				var s="<div class = 'each_comments'>";
				$.each(data,function(i,n){

					s+= "<div style ='padding : 20px 20px 0 20px;'><a class='awriter'>"+n.awriter+"</a><span>"+n.awritedate+"</span>";
					s+= "<div class='atag'><a class='update' href='answerupdpass?aidx="+n.aidx+"' aidx="+n.aidx+">수정</a><a class='del' aidx="+n.aidx+">삭제</a></div></div>";
					s+= "<div class ='board_memo' style ='padding-bottom : 20px; padding-left:20px;border-bottom : 1px solid #ddd'>"+n.amemo+"</div>";
				});

				s+="</div>";
				$("#board_comments").html(s);
			}

		});

	}

</script>
</head>
<body>
 <!-- 스크랩 로그인 안했을 때 Modal -->
  <div class="modal fade" id="bModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">로그인을 해주세요.</h4>
        </div>
        <div class="modal-body">
          <p>로그인하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='/member/login'">확인</button>
        </div>
      </div>
      
    </div>
  </div>
  <!-- Modal -->
  
  <!-- 스크랩삭제 모달 -->
   <div class="modal fade" id="mybModaldelscrap" role="dialog" style="margin-top: 100px;">
      <div class="modal-dialog">

         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header" style="padding: 35px 50px;">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h3>
					게시물을 스크랩취소하시겠습니까?
               </h3>
            </div>
            <form action="boardscrapdel" method="post" class="form-inline">
               <input type="hidden" name="scnum" value="0">
				<input type="hidden" name="sbnum" value="${dto.bnum}">
				<input type="hidden" name="smidnum" value="${mdto.mnum}">
				<input type="hidden" name="num" value="${dto.bnum}">
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
  
  <!-- 스크랩추가 모달 -->
	<div class="modal fade" id="mybModalscrap" role="dialog" style="margin-top: 100px;">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3>
						게시물을 스크랩하시겠습니까?
					</h3>
				</div>
				<form action="boardscrap" method="post" class="form-inline">
					<input type="hidden" name="scnum" value="0">
					<input type="hidden" name="sbnum" value="${dto.bnum}">
  					<input type="hidden" name="smidnum" value="${mdto.mnum}">
  					<input type="hidden" name="num" value="${dto.bnum}">
                	<input type="hidden" name="pageNum" value="${pageNum}"> 	
					<div class="modal-body" style="padding: 40px 50px; text-align: center;">
						<button type="submit" class="modal-btn modal-btn-yes" style="width: 80px;">확인</button>
                  		<button type="button" class="modal-btn modal-btn-no" style="width: 80px;" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
  
	<div class="board_contentlayout">

		<div class="board_contentsmain">
			<h3 onclick = "location.href='../board/list'" >의료정보 커뮤니티</h3>
		</div>
	</div>
	
	<div class="board_contentsc">			
		<div class="board_contentsform">						
			<h3> ${dto.bsubject}</h3>
			<h4> ${dto.bwriter}</h4>
			<h4> 조회수 : ${dto.breadcount}</h4>
			 
			 <c:forEach var="a" items="${hdto}">
						<div class="hashtag">
							<span class="glyphicon glyphicon-ok"></span> ${a.hashtag}
						</div>
			</c:forEach>
			 
		</div>
		<hr>
			<div class ="board_concon">
			<p>${dto.bcontent}</p>
			</div>				
	</div>	
			<div class ="board_conbtngrp">
				<hr>
				<button type="button" class="bbtn board_clistbtn" onclick = "location.href='../board/list'">목록</button>
				<c:if test="${mdto.mnum == dto.bmidnum }">
					<button type ="button" class ="bbtn board_cupdbutton" onclick="location.href='updatepassform?num=${dto.bnum}&pageNum=${pageNum}'" >수정</button>			
					<button type ="button" class ="bbtn board_cdelbutton" onclick="location.href='deletepassform?num=${dto.bnum}'">삭제</button>
				</c:if>
				<%-- <c:if test="${mdto != null }"></c:if> --%>
				
				<c:if test="${loginok != null }">
					<c:if test="${boardcheck>0}">
						<button type ="button" class ="bbtn board_cscrdbutton" id="scrapdel-btn" style="background-color: #F7D14C;" data-toggle="modal" data-target="#mybModaldelscrap">스크랩</button>
					</c:if>
					<c:if test="${boardcheck==0||boardcheck==null}">
						<button type ="button" class ="bbtn board_cscrbutton" id="scrap-btn" data-toggle="modal" data-target="#mybModalscrap">스크랩</button>
					</c:if>
				</c:if>
				<c:if test="${loginok == null}">
					<button type ="button" class ="bbtn board_cscrbutton" data-toggle="modal" data-target="#bModal">스크랩</button>
				</c:if>

			
			</div>
			
			<div class ="comments_section">
			<span class="glyphicon glyphicon-expand">  댓글 총 ${totalCount}개</span>
			<hr>
			<div id = "board_comments" class ="board_comments">
			
			</div>
			
			<div class="ans_writeform form-inline form-group" >
			<div>
			<div class ="ans_id">
			<input type="hidden" class="form-control input-sm" id="acnum" value ="${dto.bnum}">
			<input type="hidden" class="form-control input-sm" id="amidnum" value ="${mdto.mnum}">
			<input type="hidden" class="form-control input-sm" id="awriter" value ="${mdto.mnick}">
			
			<div> ${mdto.mnick}</div>
			
			</div>
			<textarea class = "ans_writearea" id="amemo" name="amemo"> </textarea>
			<button class ="ans_savebtn" id = "ans_savebtn" type ="button" >댓글쓰기</button>
			</div>
			</div>
			</div>
</body>

</html>