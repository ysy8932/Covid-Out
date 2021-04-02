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
<link rel="stylesheet" href="${root}/css/board/boardupdate.css" />

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- smarteditior -->
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- jquery -->
<script type="text/javascript">
$(function(){
	
	hashtag_list();
	
	var grpl = $("div[name=hashtag]").length;
	
	var hbnum = $("#board_bid").val();
	
	$(document).on("click",".hashtag",function(){
		
		 var index = $(".hashtag").index(this);
		 var hashtag = $(".hashtag a").eq(index).text();
		 //alert(hashtag); 	 
				$.ajax({
					type:"post",
					url:"hashtagdel",
					data:{"hbnum":hbnum,"hashtag":hashtag},
					dataType:"html",
					success:function(data)
					{
						hashtag_list();//댓글 다시 출력					
					}
				});
		 
	}); 
	
	$(".board_hashbtn").click(function(){
		
		var text = $("#board_hashtag").val();
		alert(text);
		
		$.ajax({
			type:"post",
			url:"hashtagsave",
			data:{"hbnum":hbnum,"hashtag":text},
			dataType:"html",
			success:function(data)
			{
				hashtag_list();//댓글 다시 출력					
			}
		});
		
	});
	
});

function hashtag_list()

{
	//db로부터 댓글 목록을 가져와서 id "hashtag" 출력하기
	var num=$("#board_bid").val();
	//alert(num);
	
	 $.ajax({
		type:"get",
		url:"hashtaglist",
		dataType:"json",
		data:{"num":num},
		success:function(data){				
			var s="<div class = 'hashtag_all'>";
			$.each(data,function(i,n){
				
				s+="<div class='hashtag' name ='hashtag'>";
				s+= "<span class='glyphicon glyphicon-remove'></span><a class='hashaa'> "+n.hashtag+" </a>";
				s+="</div>";
			});

			s+="</div>";
			$("#board_hashform").html(s);
		}

	});
 
}
</script>

</head>
<body>
	<div class="board_updatelayout">

		<div class="board_updatemain">
			<h3 onclick="location.href='../board/list'" >의료정보 커뮤니티</h3>
			<div style="display: flex; justify-content: center;"></div>
		</div>
	</div>

	<div class="board_updatec">
		<form action="update" method="post" enctype="multipart/form-data">

			<div class="board_updateform">
				<h3>게시글 수정</h3>
				<div class="com-up-wrap">
					<div class="com-up-title">
						<b>글제목</b>
						<input type="text" class="board_topic form-control dcom-row" id="board_topic" name="bsubject" value ="${dto.bsubject}"/>
					</div>
					<input type ="hidden" class="board_bid" id="board_bid" name="bnum" value="${dto.bnum}"  />
					<input type ="hidden" class="board_id" id="board_id" name="bmidnum" value="${mdto.mnum}"  />
					<input type ="hidden" name="pageNum" value ="${pageNum}">
					<input type ="hidden" name="regroup" value ="${dto.regroup}">
					<input type ="hidden" name="restep" value ="${dto.restep}">
					<input type ="hidden" name="relevel" value ="${dto.relevel}">
					<div class="dcom-con dcom-photo">
	         			<b>메인사진</b>
	            		<input type="file" class="form-control dcom-row" style="width: 300px; line-height: 1;" name="file" required="required">    
					</div>
					<div class="com-up-writer">
	         			<b>작성자</b>
						<input type ="text" class="form-control dcom-row" id="board_nick" name="bwriter" readonly="readonly"  value="${mdto.mnick}" />
					</div>
        		 </div>
			</div>

			<div class="board_updatecontents">
				<div class="jsx-2303464893 editor">
					<div class="fr-box fr-basic fr-top" role="application">
						<div class="fr-wrapper show-placeholder" dir="auto">
							<textarea  id="smartEditor" name="bcontent" 
								style="width: 100%; height: 412px; background-color: white; opacity: 1;">${dto.bcontent}</textarea>
						</div>

					</div>
				</div>
			</div>
			<div class="board_hashform" id ="board_hashform">
			
			</div>
			<div class="tagform">
				<input type="text" class="board_hashtag" id ="board_hashtag" />
				<button type="button" class="board_hashbtn">태그 추가</button>
			</div>
			<div class ="board_btngroup" >
			<button type="button" class="board_listbtn" onclick="location.href='../board/list'">목록</button>
			<button type="submit" class="board_savebutton" onclick="submitContents(this)" >저장</button>
			
			</div>
		</form>
	</div>

<script type="text/javascript">
var oEditors = []; 

nhn.husky.EZCreator.createInIFrame({ 
oAppRef : oEditors, 
elPlaceHolder : "smartEditor", //저는 textarea의 id와 똑같이 적어줬습니다. 
sSkinURI : "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html", //경로를 꼭 맞춰주세요! 
fCreator : "createSEditor2", 
htParams : { 
   // 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
   bUseToolbar : true, 
   // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
   bUseVerticalResizer : true, 
   // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
   bUseModeChanger : true 
} 
}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

 // 에디터의 내용이 textarea에 적용된다.

 oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", [ ]);



 // 에디터의 내용에 대한 값 검증은 이곳에서

 // document.getElementById("textAreaContent").value를 이용해서 처리한다.
 try {
     elClickedObj.form.submit();
 } catch(e) { 

 }

}

function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>resources/photo_upload/'+filepath+'">';
    oEditors.getById["smartEditor"].exec("PASTE_HTML", [sHTML]); 

}

</script>
</body>
</html>


