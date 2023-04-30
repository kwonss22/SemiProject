<%@page import="com.travelez.app.member.dto.MemberDto"%>
<%@page import="com.travelez.app.notice.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 답글 | 여행이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../asset/css/reset.css">
<link rel="stylesheet" href="../asset/css/common.css">
<link rel="stylesheet" href="../asset/css/bbslist.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<%
	NoticeDTO dto = (NoticeDTO)request.getAttribute("dto");
%>
<jsp:include page="/WEB-INF/views/member/header.jsp"/>
<div align="center" id="app" class="container">

<h2>부모글</h2>

<table border="2" class="table table-sm table-write table-answer">
<col width="100px"><col width="500px">
<tr>
	<th>작성자</th>
	<td><%=dto.getId() %></td>
</tr>
<tr>
	<th>제목</th>
	<td><%=dto.getTitle() %></td>
</tr>
<tr>
	<th>작성일</th>
	<td><%=dto.getWdate() %></td>
</tr>
<tr>
	<th>조회수</th>
	<td><%=dto.getReadcount() %></td>
</tr>
<tr>
	<th>내용</th>
	<td style="background-color: white;">
		<textarea rows="10" cols="50" style="width:100%;" readonly><%=dto.getContent() %></textarea>
	</td>
</tr>
</table>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
%>

<h2>답글</h2>

<form action="answerAf.do" method="post">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>">

<table border="1"  class="table table-sm table-write">
<col width="100px"><col width="500px">
<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" size="50" readonly="readonly" value="<%=login.getTeId() %>">
	</td>
</tr>
<tr>
	<th class="align-middle">제목</th>
	<td>
		<input type="text" name="title" size="50" class="form-control form-control-lg  writeTitle"  placeholder="제목기입" >
	</td>	
</tr>
<tr>
	<th>내용</th>
	<td class="write-content">
		<textarea rows="10" cols="50" name="content"  class="form-control write-update" placeholder="내용기입"></textarea>
	</td>
</tr>
<tr class="writeBtn">
	<td colspan="2" align="center" style="padding-top: 20px">
		<input type="submit" value="작성완료" class="btn btn-primary">
	</td>
</tr>
</table>
</form>

</div>

<jsp:include page="/WEB-INF/views/member/footer.jsp"/>
</body>
</html>



