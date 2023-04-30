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
	    <link rel="stylesheet" href="../asset/css/myPlanWrite.css">
	    <link rel="stylesheet" href="../asset/css/addClass.css">
	    
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	    <script type="text/javascript" src="../asset/script/mypageUtil.js"></script>
</head>
<body>
<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	MyPlanDto myplan = (MyPlanDto)request.getAttribute("myPlan");
	MyPlanDetailDto mpd = (MyPlanDetailDto)request.getAttribute("myPlanDetail");
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
			<a href="unRegi.do" class="unRegi">회원탈퇴 ></a>
		</div>
		<div class="myPlanWrap">
			<div class="tripPlanDetail">
				<span class="planDetailTitle"><%=myplan.getTePlace()%></span>
				<span class="planDetailDay"><%=myplan.getTeGoDay() %> ~ <%=myplan.getTeEndDay() %></span>
			</div>

			<div class="planDetailList">
				<form action="/member/myPlanUpdateAf.do" method="get" id="planUpdateForm">
					<input type="hidden" name="seq" value="<%=mpd.getSeq()%>">
					<input type="hidden" name="teDseq" value="<%=mpd.getTeDseq()%>">
					<input type="hidden" name="teId" value="<%=mpd.getTeId()%>">
					<div class="planInputBox">
						<span>날짜</span>
						<div class="dayTime InputDay">
							<label for="teDay">
								<input type="date" name="teDday" id="teDay"  value="<%=mpd.getTeDday() %>" min="{{goDay}}"  max="{{endDay}}">
								<div class="daytimeCustom" id="dayCustom"><%=mpd.getTeDday() %></div>
							</label>
						</div>
						<div class="dayTime InputTime">
							<label for="teTime">
								<input type="time" name="teTime" id="teTime" value="<%=mpd.getTeTime() %>">
								<div class="daytimeCustom" id="hmCustom"><%=mpd.getTeTime() %></div>
							</label>
						</div>
					</div>
					<div class="planInputBox">
						<span>장소</span>
						<input type="text" name="tePlace" id="tePlace" placeholder="장소를 입력하세요" value="<%=mpd.getTePlace() %>">
					</div>
					<div class="planInputBox">
						<span>메모</span>
						<textarea name="teMemo" id="teMemo"><%=mpd.getTeMemo() %></textarea>
					</div>
					<button type="button" id="planWriteBtn">수정</button>
				</form>
			</div>
		</div>
	</main>
		
	<jsp:include page="/WEB-INF/views/member/footer.jsp"/>
		
	<script type="text/javascript">
	
		let teDay = document.getElementById("teDay");
		let teTime = document.getElementById("teTime");
		let dayCustom = document.getElementById("dayCustom");
		let hmCustom = document.getElementById("hmCustom");
		let tePlace = document.getElementById("tePlace");
		
		let planWriteBtn = document.getElementById("planWriteBtn");
		
		/* input 입력되면 Custom에 날짜 입력되기 */
		dateCustom(teDay, dayCustom);
		timeCustom(teTime, hmCustom);
		
		// 빈칸이었다가 다시 입력될 때 removeClass
		dateInputChk(teDay, dayCustom);
		dateInputChk(teTime, hmCustom);
		inputChk(tePlace);
		
		// 여행시작일 이전 선택 막기
		var goDay = "<%=myplan.getTeGoDay() %>";
		teDay.setAttribute("min", goDay);
		
		// 여행끝나는날 이후 선택 막기
		var endDay = "<%=myplan.getTeEndDay() %>";
		teDay.setAttribute("max", endDay); 
		
		planWriteBtn.addEventListener("click", function() {
			if(teDay.value == ""){
				nullFalseChk(dayCustom);
			} else if(teTime.value == "") {
				nullFalseChk(hmCustom);
			} else if (tePlace.value == "") {
				nullFalseChk(tePlace);
			} else {
				document.getElementById("planUpdateForm").submit();
			}
		});
		
	</script>
</body>
</html>
