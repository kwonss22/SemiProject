<%@page import="com.travelez.app.member.dto.MemberDto"%>
<%@page import="com.travelez.app.play.dto.PlayDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
	MemberDto login = (MemberDto)session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>play</title>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="../asset/jquery/jquery.twbsPagination.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Barlow+Condensed&family=Black+Han+Sans&family=Satisfy&display=swap');
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../asset/css/reset.css">
<link rel="stylesheet" href="../asset/css/common.css">
<link rel="stylesheet" href="../asset/css/playlist.css">

</head>

<body>
<jsp:include page="/WEB-INF/views/member/header.jsp"/>
	<%
	List<PlayDto> list = (List<PlayDto>) request.getAttribute("playlist");
	int pagePlay = (Integer) request.getAttribute("pagePlay");
	int pageNumber = (Integer) request.getAttribute("pageNumber");
	String choice = (String) request.getAttribute("choice");
	String search = (String) request.getAttribute("search");
	%>

<div class="keyVisual">
<div class="container">
    <div id="carouselSample" class="carousel slide" data-ride="carousel">
    
      <!-- 인디케이터(바로 이동할수 있는 바) -->       
      <ol class="carousel-indicators">
        <li data-target="#carouselSample" data-slide-to="0" class="active"></li>
        <li data-target="#carouselSample" data-slide-to="1"></li>
        <li data-target="#carouselSample" data-slide-to="2"></li>
        <li data-target="#carouselSample" data-slide-to="3"></li>
      </ol>
      
      <!-- 캐러셀 -->
      <div class="carousel-inner">
        <!-- First slide -->
        <div class="carousel-item active">
          <img class="d-block w-100" alt="slide" src="../asset/images/spring.jpg">
          <!-- 캡션 -->
          <div class="carousel-caption d-none d-md-block">
          </div>
        </div>
        <!-- Second slide -->
        <div class="carousel-item">          
          <img class="d-block w-100" alt="slide" src="../asset/images/summer.jpg">
          <!-- 캡션 -->
          <div class="carousel-caption d-none d-md-block">
          </div>
        </div>
        <!-- Third slide -->
        <div class="carousel-item">
          <img class="d-block w-100" alt="slide" src="../asset/images/autom.jpg">          
          <!-- 캡션 -->
          <div class="carousel-caption d-none d-md-block">
          </div>
        </div>
         <div class="carousel-item">
          <img class="d-block w-100" alt="slide" src="../asset/images/winter.jpg">          
          <!-- 캡션 -->
          <div class="carousel-caption d-none d-md-block">

          </div>
        </div>
      </div>
 
      <!-- 컨트롤러 부분 -->
      <!-- 앞으로 돌아가는 아이콘 -->
      <a class="carousel-control-prev" href="#carouselSample" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">앞으로</span>
      </a>
      <!-- 다음으로 이동하는 아이콘 -->
      <a class="carousel-control-next" href="#carouselSample" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">다음으로</span>
      </a>
      
    </div>
  </div>
  
	  <div class="playTitle">
	  	<span>이번주 주말에 어디가세요?</span>
	  	<p>여행이지에서 이번주 주말 놀거리를 찾아보세요!</p>
	  </div>
  
  	<div class="playSearch">
		<table
				style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px">
				<tr class="playTr">
				<td style="padding-left: 5px" class="align-middle"><input
						type="text" class="form-control play-search" id="search" name="search"
						placeholder="검색어" value=""></td>
					<td style="padding-left: 5px"><select class="custom-select play-select"
						id="choice" name="choice">
							<option selected>검색</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="location">주소</option>
							<option value="writer">작성자</option>
					</select></td>
					
					<td style="padding-left: 5px"><span>
							<button type="button" class="btn play-searchBtn" onclick="searchBtn()"
								style="background-color: rgb(100, 189, 234); color: white">검색</button>
					</span></td>
				</tr>
		</table>
	</div>
</div>	

	<div align="center">

		<table class="table table-striped playlist"
			style="text-align: center; width: 1000px; border: 1px solid #dddddd">
			<col width="70">
			<col width="600">
			<col width="100">
			<col width="150">
			<col width="150">
			<thead>
				<tr>
					<th>번호</th>
					<th style="text-align: left;">제목</th>
					<th>조회수</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (list == null || list.size() == 0) {
				%>
				<tr>
					<td colspan="5">작성된 글이 없습니다</td>
				</tr>
				<%
				} else {
				for (int i = 0; i < list.size(); i++) {
					PlayDto dto = list.get(i);
					String date = dto.getpWdate();
					date = date.substring(0, 11);
					if (i % 2 == 0) {
				%>
				<tr style="background-color: rgb(100, 189, 234); color: white;">
					<th><%=i + 1 + (pageNumber * 10)%></th>
					<td style="text-align: left; color:#fff;"><a
						 href="playdetail.do?pSeq=<%=dto.getpSeq()%>
						&pId=<%=dto.getpId() %>" style="color:#fff;" ><%=dto.getpTitle()%> 
					</a></td>
					<td><%=dto.getpReadcount()%></td>
					<td><%=dto.getpId()%></td>
					<td><%=date%></td>
				</tr>
				<%
				} else {
				%>
				<tr style="background-color: white; color: rgb(100, 189, 234);">
					<th><%=i + 1 + (pageNumber * 10)%></th>
					<td style="text-align: left;"><a
						href="playdetail.do?pSeq=<%=dto.getpSeq()%>
						&pId=<%=dto.getpId() %>"> <%=dto.getpTitle()%>
					</a></td>
					<td><%=dto.getpReadcount()%></td>
					<td><%=dto.getpId()%></td>
					<td><%=date%></td>
				</tr>
				<%
				}
				}
				}
				%>

			</tbody>
		</table>

		<br>

		<div class="container play-page">
			<nav aria-label="Page navigation">
				<ul class="pagination" id="pagination"
					style="justify-content: center"></ul>
			</nav>
		</div>
		
		<button class="btn play-writeBtn" type="button" onclick="writeBtn()" style="background-color: rgb(100, 189, 234); color: white">글쓰기</button>
	
	</div>
<jsp:include page="/WEB-INF/views/member/footer.jsp"/>

<script type="text/javascript">
	
	let search = "<%=search%>";
	if(search != ""){
		let obj = document.getElementById("choice");
		    obj.value = "<%=choice%>";
			obj.setAttribute("selected", "selected");
		}
		function searchBtn() {
			let choice = document.getElementById('choice').value;
			let search = document.getElementById('search').value;

			location.href = "play.do?&choice=" + choice + "&search=" + search;

		}

		function writeBtn() {
				location.href = "playwrite.do";				
			
		}

		$('#pagination').twbsPagination(
				{
					startPage : <%=pageNumber + 1%>,
					totalPages : <%=pagePlay%>,
					visiblePages : 10,
					first : '<span srid-hidden="true">«</span>',
					prev : "이전",
					next : "다음",
					last : '<span srid-hidden="true">»</span>',
					initiateStartPageClick : false, // onPageClick 자동실행되지 않도록
					onPageClick : function(event, page) {
						// alert(page);
						let choice = document.getElementById('choice').value;
						let search = document.getElementById('search').value;
						location.href = "play.do?choice=" + choice + "&search="
								+ search + "&pageNumber=" + (page - 1);
					}
				});
		</script>

</body>
</html>