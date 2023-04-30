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
	    <link rel="stylesheet" href="../asset/css/myPlanList.css">
	    <link rel="stylesheet" href="../asset/css/addClass.css">
	    
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	    <script type="text/javascript" src="../asset/script/mypageUtil.js"></script>
</head>
<body>
<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	MyPlanDto mdto = (MyPlanDto)request.getAttribute("myPlan");
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
			<div class="rightMyPlan">
				<div class="planTitle">
				    <h2>My Travel</h2>
				</div>
			</div>
			<div class="myPlanList">
				<div class="planListWrap">
					<div class="planListUpdate">
						<form action="/member/myPlanListUpdateAf.do" method="get" id="planListUpdateForm">
							<input type="hidden" name="seq" value="<%= mdto.getSeq()%>">
							<div class="planInputBox">
								<span>여행지</span>
								<input type="text" name="tePlace" value="<%= mdto.getTePlace()%>" id="tePlace">
							</div>
							<div class="planInputBox tripDayUpdate">
								<span>여행일</span>
					             <div class="goTripDay">
					                 <label for="goTripDayUpdate">
					                     <input type="date" id="goTripDayUpdate" name="teGoDay" value="<%= mdto.getTeGoDay()%>" min="{{goDay}}">
					                     <div class="dayUpdateCustom" id="goDayUpdate"><%= mdto.getTeGoDay()%></div>
					                 </label>
					             </div>
					             <span class="and"> ~ </span>
					             <div class="endTripDay">
					                 <label for="endTripDayUpdate">
					                     <input type="date" id="endTripDayUpdate" name="teEndDay" value="<%= mdto.getTeEndDay()%>" min="{{endDay}}">
					                     <div class="dayUpdateCustom" id="endDayUpdate"><%= mdto.getTeEndDay()%></div>
					                 </label>
					             </div>
					        </div>
					        <button type="button" id="dayUpdateBtn">수정완료</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
		
	<jsp:include page="/WEB-INF/views/member/footer.jsp"/>
		
	<script type="text/javascript">
		
		const goTripDayUpdate = document.getElementById("goTripDayUpdate");
		const endTripDayUpdate = document.getElementById("endTripDayUpdate");
		const goDayUpdate = document.getElementById("goDayUpdate");
		const endDayUpdate = document.getElementById("endDayUpdate");
		const tePlace = document.getElementById("tePlace");
			
		const dayUpdateBtn = document.getElementById("dayUpdateBtn");
		const planListUpdateForm = document.getElementById("planListUpdateForm");
		
	

		// input="date" custom

		dateCustom(goTripDayUpdate, goDayUpdate);
		dateCustom(endTripDayUpdate, endDayUpdate);
		
		// 오늘날짜이전 선택 막기
		var goDay = new Date().toISOString().split("T")[0];
		goTripDayUpdate.setAttribute("min", goDay);
		
		// goDay이전 선택 막기
		goTripDayUpdate.addEventListener("change", function(){
		    var endDay = goTripDayUpdate.value;
		    endTripDayUpdate.setAttribute("min", endDay); 
		})
		
		// 다시 입력할 때 빨간테두리 제거
		inputChk(tePlace);
		
		// 일정추가버튼 눌렀을 때 빈칸확인
		dayUpdateBtn.addEventListener("click", function() {
			if(goTripDayUpdate.value == ""){
				nullFalseChk(goTripDayUpdate);
			} else if(endTripDayUpdate.value == ""){
				nullFalseChk(endDayUpdate);
			} else if(tePlace.value == "") {
				nullFalseChk(tePlace);
			} else {
				planListUpdateForm.submit();
			}
		});
		

		
		
	</script>
</body>
</html>
