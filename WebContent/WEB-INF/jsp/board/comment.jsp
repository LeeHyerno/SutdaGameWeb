<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>댓글 작성</title>
</head>
<style>
body{
	background-color: #363636;
}
.container{
	margin: auto;
}
h3{
	border-bottom: 1px solid white;
}
textarea{
	width: 80%;
	resize: none;
	background-color: #363636;
	color: white;
}
#commentBtn{
	width: 10%;
	background-color: #363636;
	color: white;
}
#commentImg{
	background-image: url('/img/comment.png');
	background-repeat: no-repeat;
	width: 472.5px;
}
#reCommentImg{
	background-image: url('/img/reComment.png');
	background-repeat: no-repeat;
	width: 472.5px;
}
</style>
<body>
	<div class="container">
		<h3>댓글</h3>
		<div class="commentList">
			<c:choose>
				<c:when test="${comment ne null}">
					<c:forEach var="comment" items="${comment}" varStatus="status">
						<table id="commentImg">
							<tr>
								<td>&emsp;&emsp;&emsp;<c:out value="${comment.player.nickname}"/></td>
							</tr>
							<tr>
								<td style="color: white;"><br>&emsp;&emsp;<c:out value="${comment.content}"/></td>
							</tr>
							<tr>
								<td style="float: right; color: white; padding-right: -10px;">${comment.regdate}</td>
							</tr>
							<tr>
								<td><button onclick="selectRecomment(this)" data-no="<c:out value='${comment.no }' />" data-p="1" style="background-color: #363636; margin-top: 10px; color: white;">답글이 <c:out value="${comment.replyCount}" />개 있습니다.</button></td>
							</tr>
							<tr>
								<td><input placeholder="답글" class="reComment" style="background-color: #363636; color: white;"><button id="reCommentBtn" onclick="writeReComment(this)" data-no='<c:out value="{comment.no}"/>' style="background-color: #363636; color: white;">답글 입력</button></td>
							</tr>
						</table>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h3>댓글이 없습니다.</h3>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="commentWrite">
			<textarea placeholder="댓글 입력.."></textarea>
			<button id="commentBtn" onclick="writeComment()">확인</button>
		</div>
	</div>
</body>

<script>
	//답글 더보기
	function selectRecomment(e){
		
		$.ajax({
	  		url:'/ajax/selectRecomment',
	  		type: 'POST',
		      data: {  no:$(e).data("no"), p:$(e).data("p") },
		      success: function(data) {
			      $(e).data("p",$(e).data("p")+1);
			     for(var i=0; i<data.length;i++){
				     $(e).parent().parent().prepend(
						     "<tr><td>작성일:</td><td>"+data[i].regdate+"</td></tr>"+
							"<tr><td>"+data[i].player.nickname + "</td><td>"+data[i].content+"</td></tr>");
			     }
		      },
		      error:function(textStatus, errorThrown){
	             alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
	      }
		});
	}
	//댓글 더보기
	function selectComment(e){
		$.ajax({
	  		url:'/ajax/selectComment',
	  		type: 'POST',
		      data: {  no:$(e).data("no"), p:$(e).data("p") },
		      success: function(data) {
		    	  $(e).data("p",$(e).data("p")+1);
			     for(var i=0; data.length;i++){
				     $(e).parent().parent().prepend(
						     "<tr><td style='background-image: url('/img/reComment.png')'>작성일:</td><td>"+data[i].regdate+"</td></tr>"+
							"<tr><td>"+data[i].player.nickname + "</td><td>"+data[i].content+"</td></tr>");
			     }
		      },
		      error:function(textStatus, errorThrown){
	             alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
	      }
		});
	}

	//댓글 입력
	function writeComment() {
		$.ajax({
	  		url:'/ajax/commentInsert',
	  		type: 'POST',
		      data: {  content:$(".commentBox").val(), boardNo:${post.no } },
		      success: function() {
			      alert("댓글 입력 성공");
		      },
		      error: function(statusText) {
		    	  console.log(statusText);
			  }
		});
	}

	//답글 입력
	function writeReComment(e) {
		$.ajax({
	  		url:'/ajax/commentReInsert',
	  		type: 'POST',
		      data: {  content:$(e).parent().children(".reCommnet").val(), no:$(e).data("no") },
		      success: function() {
			      alert("댓글 입력 성공");
		      },
	    	  error:function(textStatus, errorThrown){
	             alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
			}
		});
	}
	//답글 삭제
	function deleteComment(e) {
		$.ajax({
	  		url:'/ajax/commentDelete',
	  		type: 'POST',
		      data: {  content:$(e).parent().children(".reCommnet").val(), no:$(e).data("no") },
		      success: function() {
			      alert("댓글 입력 성공");
		      },
	    	  error:function(textStatus, errorThrown){
	             alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
			}
		});
	}
	
	//답글 수정
	function updateComment(e) {
		$.ajax({
	  		url:'/ajax/commentUpdate',
	  		type: 'POST',
		      data: {  content:$(e).parent().children(".reCommnet").val(), no:$(e).data("no") },
		      success: function() {
			      alert("댓글 입력 성공");
		      },
	    	  error:function(textStatus, errorThrown){
	             alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
			}
		});
	}

	//좋아요
    var likeCheck = ${likeCheck};
	function likeBoard() {
		likeCheck = !likeCheck;

		$.ajax({
	  		url:'/ajax/likeBoard',
	  		type: 'POST',
		      data: {  no:${post.no} },
		      success: function(data) {
		    	  $('#likeCount').text(data);
					var src = "/img/";
		    	  if(likeCheck){
		    		  src+="likeBtn2.png";
			   	  } else {
			   		src+="likeBtn1.png";
				 }
			     $('#like').attr("src",src)
		      },
	    	  error:function(textStatus, errorThrown){
	             alert("죄송합니다\n 예상치 못한 에러가 발생하였습니다.\n 나중에 다시 시도해주세요");
			}
		});
	}
	</script>
</html>