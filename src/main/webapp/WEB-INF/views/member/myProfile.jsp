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
	    <link rel="stylesheet" href="../asset/css/myProfile.css">
	    <link rel="stylesheet" href="../asset/css/addClass.css">
	    
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	    <script type="text/javascript" src="../asset/script/mypageUtil.js"></script>
</head>
<body>
<% 
	MemberDto login = (MemberDto)session.getAttribute("login");
	MemberDto dto = (MemberDto)request.getAttribute("userInfo");
	
%>
	<jsp:include page="/WEB-INF/views/member/header.jsp"/>
	
	<main>
		<div class="mypageSideMenu">
			<div class="userProfile">
				<img src="<%=dto.getTeProfile()%>" alt="">
				<p><%=dto.getTeId() %></p>
			</div>
			<div class="sideMenu">
			    <a href="/member/myPlanList.do?teId=<%=dto.getTeId() %>" type="button" id="mySchedule">나의 일정</a>
			    <a href="/member/myProfile.do?teId=<%=dto.getTeId() %>" type="button" id="myProfile">나의 프로필</a>
			</div>
			<a href="unRegi.do" class="unRegi">회원탈퇴 ></a>
		</div>
		
		<div class="rightMyprofile">
			<form action="/member/updateUserInfo.do" method="post" enctype="multipart/form-data" id="userUpdateForm">
			    <div class="profile">
			        <div class="roundImg"><img src="<%= dto.getTeProfile() %>" alt="프로필이미지"></div>
			        <input type="file" id="profile" name="fileload">
			        <input type="hidden" name="teProfile" value="<%= dto.getTeProfile() %>">
			        <label for="profile"><img src="../asset/images/update.png" alt="프로필이미지업로드"></label>
			    </div>  <!-- end of profile -->
			    <span class="uNoti">* 변경가능</span>
			    <div class="userId">
			        <span>아이디</span>
			        <input type="text" name="teId" id="userId" value="<%= dto.getTeId() %>" readonly="readonly">
			    </div>  <!-- end of userId -->
			    <div class="userName">
			        <span>이름</span>
			        <input type="text" name="teName" id="userName" value="<%= dto.getTeName() %>" readonly="readonly">
			    </div>  <!-- end of userName -->
			    <div class="userEmail">
			        <span>이메일</span>
			        <input type="text" name="teEmail" id="userEmail" value="<%= dto.getTeEmail() %>" readonly="readonly">
			    </div>  <!-- end of userEmail -->
			    <div class="userTel">
			        <span>전화번호*</span>
			        <input type="text" name="tePhoneNum" id="userTel" value="<%= dto.getTePhoneNum() %>">
			    </div>   <!-- end of userTel -->
			    <div class="userbirth">
			        <span>생년월일</span>
			        <input type="text" name="teBirth" id="userBirth" value="<%= dto.getTeBirth() %>" readonly="readonly">
			    </div>  <!-- end of userbirth -->
			    <div class="userPreferTrip">
			        <span>선호하는<br>여행스타일*</span>
			        <input type="text" name="tePreferTrip" id="userPrefer" value="<%= dto.getTePreferTrip() %>">
			    </div>  <!-- end of preferTrip -->
			    <div class="updateUserBtn">
			        <button type="button" id="mypageUpdateBtn">수정</button>
			        <a href="/member/updatePwd.do?teId=<%= dto.getTeId() %>">비밀번호변경</a>
			    </div>
			</form>
		</div>
	</main>
	
    <jsp:include page="/WEB-INF/views/member/footer.jsp"/>
    
	<script type="text/javascript">
	window.onload = function(){
		const pThumbnail = document.getElementById("profile");
		const userTel = document.getElementById("userTel");
		const mypageUpdateBtn = document.getElementById("mypageUpdateBtn");
	
		// 프로필 이미지 등록시 썸네일 변경
		pThumbnail.addEventListener('change', function(event){
			setThumbnail(event)
		});
		// 수정버튼 눌렀을 때 빈칸인지 확인 후 제출 
		mypageUpdateBtn.addEventListener("click", function(){
			if(userTel.value === "" || userTel.value.length < 11) {
				nullFalseChk(userTel);
			} else {
				document.getElementById("userUpdateForm").submit();
			}
		});
	}		
	</script>
	
	
</body>

</html>