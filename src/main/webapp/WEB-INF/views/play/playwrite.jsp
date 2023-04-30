<%@page import="com.travelez.app.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>playwrite</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
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

<link rel="stylesheet" href="../asset/css/reset.css">
<link rel="stylesheet" href="../asset/css/common.css">
<link rel="stylesheet" href="../asset/css/playlist.css">


</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/member/header.jsp"/>
	<%
	MemberDto login = (MemberDto) session.getAttribute("login");
	%>

	
	<div align="center" class="container playWrite">
		<h2>글쓰기</h2>
		<form action="playwriteAf.do" id="frm" method="post"
			enctype="multipart/form-data">
			
				<table class="table table-sm table-write play-write">
				<col width="150px"><col width="500px">
					<tr>
						<th class="align-middle">이미지 파일</th>
						<td><input type="file" name="fileload" class="form-control form-control-lg"></td>
					</tr>
					<tr>
						<th class="align-middle" style="padding:10px 0;">아이디</th>
						<td class="align-middle"><input type="text" name="pId" readonly="readonly"
							value="<%=login.getTeId()%>" class="form-control form-control-lg"></td>
					</tr>
					<tr>
						<th class="align-middle">지역</th>
						<td><input type="text" id="p_title" name="pTitle"
							size="50px" class="form-control form-control-lg"
							placeholder="지역기입"></td>
					</tr>
					<tr>
						<th class="align-middle">제목</th>
						<td><input type="text" id="p_location" name="pLocation"
							size="50px" class="form-control form-control-lg"
							placeholder="제목기입"></td>
					</tr>
					<tr>
						<th class="align-middle">내용</th>
						<td><textarea rows="10" id="p_content" name="pContent"
								class="form-control" placeholder="내용기입"></textarea></td>
					</tr>
				</table>
				<br>
				<button class="btn" type="button" id="writeBtn"
				style="background-color: rgb(100, 189, 234); color: white">글쓰기 완료</button>
				<button class="btn" type="button" id="cancelBtn"
				style="background-color: rgb(100, 189, 234); color: white">취소</button>

			
		</form>
	</div>
<jsp:include page="/WEB-INF/views/member/footer.jsp"/>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#writeBtn").click(function() {

				if ($("#p_title").val().trim() == "") {
					alert("제목을 기입해 주십시오");
					return;
				} else if ($("#p_location").val().trim() == "") {
					alert("지역을 기입해 주십시오");
					return;
				} else if ($("#p_content").val().trim() == "") {
					alert("내용을 기입해 주십시오");
					return;
				} else {
					$("#frm").submit();
				}
			});

			$("#cancelBtn").click(function() {
				location.href = "play.do";
			});
		});
	</script>


</body>
</html>