<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.travelez.app.myplan.dto.MyPlanDetailDto"%>
<%@page import="java.util.List"%>
<%@page import="com.travelez.app.myplan.dto.MyPlanDto"%>
<%@page import="com.travelez.app.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마이페이지 | 여행이지</title>
	    <link rel="stylesheet" href="../asset/css/reset.css">
	    <link rel="stylesheet" href="../asset/css/common.css">
	    <link rel="stylesheet" href="../asset/css/mypage.css">
	    <link rel="stylesheet" href="../asset/css/myPlanDetail.css">
	    <link rel="stylesheet" href="../asset/css/addClass.css">
	    
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	    <script type="text/javascript" src="../asset/script/mypageUtil.js"></script>
</head>
<body>
<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	MyPlanDto myplan = (MyPlanDto)request.getAttribute("myPlan");
	List<MyPlanDetailDto> list = (List<MyPlanDetailDto>)request.getAttribute("planDetailList");
%>

	<jsp:include page="/WEB-INF/views/member/header.jsp"/>
	
	<main>
		<div class="mypageSideMenu">
			<div class="userProfile">
				<img src="<%=login.getTeProfile()%>" alt="">
				<p><%=login.getTeId() %></p>
			</div>
			<div class="sideMenu">
			    <a href="/member/myPlanList.do?teId=<%=login.getTeId() %>" type="button" id="mySchedule">나의 일정</a>
			    <a href="/member/myProfile.do?teId=<%=login.getTeId() %>" type="button" id="myProfile">나의 프로필</a>
			</div>
			<a href="/member/unRegi.do" class="unRegi">회원탈퇴 ></a>
		</div>
		<div class="myPlanWrap">
			<div class="tripPlanDetail">
				<span class="planDetailTitle"><%=myplan.getTePlace() %></span>
				<span class="planDetailDay"><%=myplan.getTeGoDay() %> ~ <%=myplan.getTeEndDay() %></span>
				<div class="myPlanBtn">
					<a href="/member/myPlanWrite.do?seq=<%=myplan.getSeq() %>">장소추가</a>
					<button type="button" id="planChange">편집</button>
				</div>
			</div>

			<div class="planDetailList">
				<%
				if(list == null || list.size() == 0){
						
				}else{
					
					for(int i = 0;i < list.size(); i++){
						MyPlanDetailDto mdto = list.get(i);
						%>
						<div class="myPlanDetail">
							<p class="dateTime"><%=mdto.getTeDday()%> <%=mdto.getTeTime()%></p>
							<div class="planDetail">
								<span class="detailPlace"><%= mdto.getTePlace()%></span>
								<span class="detailMemo"><%= mdto.getTeMemo()%></span>
							</div>
							<div class="planChangeBtn">
								<a href="/member/myPlanUpdate.do?teDseq=<%=mdto.getTeDseq() %>&seq=<%=mdto.getSeq() %>" class="myplanUpdate">수정</a>
								<a href="/member/myPlanDelete.do?teDseq=<%=mdto.getTeDseq() %>&seq=<%=mdto.getSeq() %>" class="myplanDelete">삭제</a>
							</div>
						</div>
						<% 
						
					}
				}
				%>
			</div>
		</div>
	</main>
		
	<jsp:include page="/WEB-INF/views/member/footer.jsp"/>
		
	<script type="text/javascript">
		const planChange = document.getElementById("planChange");
		const planChangeBtn = document.getElementsByClassName("planChangeBtn");
		
		// 편집버튼 누르면 수정삭제 버튼 보이기
		for (let i = 0; i < planChangeBtn.length; i++) {
			planChangeBtn[i].style.display = "none";
		}
		
		for (let i = 0; i < planChangeBtn.length; i++) {
			
			planChange.addEventListener("click", function(){
				if (planChangeBtn[i].style.display === "none") {
					planChangeBtn[i].style.display = "flex";
				} else {
					planChangeBtn[i].style.display = "none";
				}
			})
		}
	
		
	</script>
</body>
</html>
