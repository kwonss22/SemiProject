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
	MemberDto dto = (MemberDto)request.getAttribute("userInfo");
	List<MyPlanDto> list = (List<MyPlanDto>)request.getAttribute("myPlanList");
%>

	<jsp:include page="/WEB-INF/views/member/header.jsp"/>
	
	<main>
		<div class="mypageSideMenu">
			<div class="userProfile">
				<img src="<%=dto.getTeProfile()%>" alt="">
				<p><%=login.getTeId() %></p>
			</div>
			<div class="sideMenu">
			    <a href="/member/myPlanList.do?teId=<%=dto.getTeId() %>" type="button" id="mySchedule">나의 일정</a>
			    <a href="/member/myProfile.do?teId=<%=dto.getTeId() %>" type="button" id="myProfile">나의 프로필</a>
			</div>
			<a href="/member/unRegi.do" class="unRegi">회원탈퇴 ></a>
		</div>
		<div class="myPlanWrap">
			<div class="rightMyPlan">
				<div class="planTitle">
				    <h2>My Travel</h2>
				    <div class="planWriteBtn">
				        <button id="planWriteBtn"><img src="../asset/images/planWriteBtn.png" alt="여행일정추가"></button>
				        <span>여행일정추가</span>
				    </div>
				    <%
					if(list == null || list.size() == 0){
						%>
					<%
					}else{
				    	%>
				    	<button type="button" id="planChange">편집</button>
				    <% 
					}
				%>
				</div>
				<div id="planWrite">
					<form action="/member/myPlanListWrite.do" method="get" id="planListForm">
					<input type="hidden" name="teId" value="<%=login.getTeId() %>">
				     <div class="planInputBox">
				         <span>여행일정</span>
				         <div class="tripDay">
				             <div class="goTripDay">
				                 <label for="goTripDay">
				                     <input type="date" id="goTripDay" name="teGoDay" min="{{goDay}}">
				                     <div class="tripDayCustom" id="goDayCustom">가는날 선택</div>
				                 </label>
				             </div>
				             <div class="endTripDay">
				                 <label for="endTripDay">
				                     <input type="date" id="endTripDay" name="teEndDay" min="{{endDay}}">
				                     <div class="tripDayCustom" id="endDayCustom">오는날 선택</div>
				                 </label>
				             </div>
				         </div>
				     </div>
				     <div class="planInputBox">
				         <span>여행지</span>
				         <input type="text" placeholder="여행지" name="tePlace" id="tePlace">
				     </div>
				     <button type="button" id="planListWriteBtn">일정추가</button>
				    </form>
				</div>
			</div>
			<div class="myPlanList">
				<%
				if(list == null || list.size() == 0){
					%>
				<p id="planNull">여행일정이 없습니다. 새로운 도시로 떠나는 여행일정을 계획해보세요!</p>
				<%
				}else{
					
					for(int i = 0;i < list.size(); i++){
						MyPlanDto mdto = list.get(i);
						%>
							<div class="planList">
								<a href="/member/myPlanDetail.do?seq=<%=mdto.getSeq() %>" class="planContent">
									<span class="planListTitle"><%= mdto.getTePlace()%></span>
									<span class="planListDay"><%= mdto.getTeGoDay()%> ~ <%= mdto.getTeEndDay()%></span>
								</a>
								<div class="planChangeBtn">
									<a href="/member/myPlanListUpdate.do?seq=<%= mdto.getSeq() %>" class="myplanListUpdate">수정</a>
									<a href="/member/myPlanListDelete.do?seq=<%= mdto.getSeq() %>" class="myplanListDelete">삭제</a>
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
		
		const planWrite = document.getElementById("planWrite");
		const planWriteBtn = document.getElementById("planWriteBtn");

		const goTripDay = document.getElementById("goTripDay");
		const goDayCustom = document.getElementById("goDayCustom");
		const endTripDay = document.getElementById("endTripDay");
		const endDayCustom = document.getElementById("endDayCustom");
		const tePlace = document.getElementById("tePlace");
		
		const planListWriteBtn = document.getElementById("planListWriteBtn");
		const planChange = document.getElementById("planChange");
		const planChangeBtn = document.getElementsByClassName("planChangeBtn");

		
		
		// 여행일정추가 버튼 누르면 보여지기
		planWrite.style.display = "none";
		
		planWriteBtn.addEventListener("click", function() {
			if (planWrite.style.display === "none") {
				planWrite.style.display = "block";
			} else {
				planWrite.style.display = "none";
			}
		});

		// input="date" custom
		dateCustom(goTripDay, goDayCustom);
		dateCustom(endTripDay, endDayCustom);
		
		// 오늘날짜이전 선택 막기
		var goDay = new Date().toISOString().split("T")[0];
		goTripDay.setAttribute("min", goDay);
		
		// goDay이전 선택 막기
		goTripDay.addEventListener("change", function(){
		    var endDay = goTripDay.value;
		    endTripDay.setAttribute("min", endDay); 
		})
		
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
		
		// 다시 입력할 때 빨간테두리 제거
		dateInputChk(goTripDay, goDayCustom);
		dateInputChk(endTripDay, endDayCustom);
		inputChk(tePlace);
		
		// 일정추가버튼 눌렀을 때 빈칸확인
		planListWriteBtn.addEventListener("click", function() {
			if(goTripDay.value == ""){
				nullFalseChk(goDayCustom);
			} else if(endTripDay.value == ""){
				nullFalseChk(endDayCustom);
			} else if(tePlace.value == "") {
				nullFalseChk(tePlace);
			} else {
				document.getElementById("planListForm").submit();
			}
		});
		
		
	</script>
</body>
</html>
