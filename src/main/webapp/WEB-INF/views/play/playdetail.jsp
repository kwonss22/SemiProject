<%@page import="com.travelez.app.play.dto.PlayDto"%>
<%@page import="com.travelez.app.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>playdetail</title>


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css">
<link rel="stylesheet" href="../asset/css/reset.css">
<link rel="stylesheet" href="../asset/css/common.css">
<link rel="stylesheet" href="../asset/css/playlist.css">
	
</head>
<body>

	<%
	MemberDto login = (MemberDto) session.getAttribute("login");

	PlayDto dto = (PlayDto) request.getAttribute("pdto");
	%>

<jsp:include page="/WEB-INF/views/member/header.jsp"/>
	<div class="playTitleBg" style="background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.7)),url(/upload/play/<%=dto.getpNewfilename() %>);">
		<h2 style="font-size:3em; font-weight:600; width:1000px; margin:0 auto; color:#fff;"><%=dto.getpTitle() %></h2>
		<p style="color:#fff; width:1000px; margin:15px auto 0; font-size:1.2em;"><%=dto.getpLocation() %></p>
		<span class="playWriter"><%=dto.getpId() %></span>
	</div>
	<div align="center" class="playDetail">
		
		<div>
			<div style="width: 1000px;">
				<img src="/upload/play/<%=dto.getpNewfilename() %>" style="width: 100%;" alt="사진">
			</div>
		</div>
		<br>

		<p class="playDetailContent"><%=dto.getpContent() %></p>


		<%
		if (dto.getpId().equals(login.getTeId())) {
		%>
		<button type="button" onclick="updateBtn(<%=dto.getpSeq() %>)"
			class="btn"
			style="background-color: rgb(100, 189, 234); color: white">수정</button>
		<button type="button" onclick="deleteBtn(<%=dto.getpSeq() %>)"
			class="btn"
			style="background-color: rgb(100, 189, 234); color: white">삭제</button>
		<%
		}
		%>

		<button type="button" onclick="goplayBtn()" class="btn"
			style="background-color: rgb(100, 189, 234); color: white">목록으로</button>
	</div>

	<script type="text/javascript">
	
	var btn = document.getElementById("btn");
	
	
	function updateBtn(p_seq){
	    location.href = "playupdate.do?&pSeq=" + p_seq;
	}
	function deleteBtn(p_seq){
		location.href = "playdelete.do?&pSeq=" + p_seq;
	}
	function goplayBtn(){
		location.href = "play.do";
	}
	
	</script>

	<div id="app" class="container playComment">

		<form action="playCommentWriteAf.do" id="frm" method="post">
			<input type="hidden" name="pSeq" value="<%=dto.getpSeq()%>">
			<input type="hidden" name="pId" value="<%=login.getTeId()%>">

			<table>
				<col width="1500px">
				<col width="150px">

				<tr>
					<td colspan="2">comment</td>
				</tr>

				<tr>
					<td><textarea rows="3" class="form-control" id="p_content"
							name="pContent"></textarea></td>
					<td style="padding-left: 30px">
						<button type="button" id="writeBtn"
							class="btn btn-block p-4" style="background-color: rgb(100, 189, 234); color: white">댓글 등록</button>
					</td>
				</tr>
			</table>
		</form>

		<br> <br>

		<table class="table table-sm">
			<col width="500">
			<col width="500">
			<tbody id="tbody">
			</tbody>
		</table>
	</div>
<jsp:include page="/WEB-INF/views/member/footer.jsp"/>
	<script type="text/javascript">
	$(document).ready(function(){
		

		$("#writeBtn").click(function() {
			
			if ($("#p_content").val().trim() == "") {
				alert("내용을 기입해 주십시오");
				return;
			} else {
				$("#frm").submit();
			}
		});
		
		$.ajax({
			url:"./playCommentList.do",
			type:"get",
			data:{ "pSeq":<%=dto.getpSeq() %> },
			success:function(list){
				
				//비워주기
				$("#tbody").html("");
				
				$.each(list, function(index, item){
				    let Str = "<tr class='table-info'>"
				        	+ "<td>작성자:" + item.pId + "</td>"
				        	+ "<td style='text-align: right;'>작성일:" + item.pWdate + "</td>"
				        	+ "</tr>"
				        	+ "<tr>"
				        	+ "<td>" + item.pContent + "</td>"
				        	+ "<td style='text-align: right;'> <a href='cdelete.do?pAnswerSeq=" + item.pAnswerSeq + "&pSeq=" + item.pSeq + "'>" + "삭제</a></td>"
				        	+ "</tr>";
					
					$("#tbody").append(Str);
				});
			},
			error:function(){
				alert('error');
			}
			
		});
	});
	</script>



</body>
</html>