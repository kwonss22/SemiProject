<%@page import="com.travelez.app.myplan.dto.MyPlanDto"%>
<%@page import="com.travelez.app.myplan.dto.MyPlanDetailDto"%>
<%@page import="com.travelez.app.member.dto.MemberDto"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
String message = (String)request.getAttribute("message");
MemberDto userInfo = (MemberDto) request.getAttribute("userInfo");
MyPlanDetailDto planSeq = (MyPlanDetailDto)request.getAttribute("planSeq");
MyPlanDto myplan = (MyPlanDto)request.getAttribute("myPlan");

if (message != null && !message.equals("")) {
	if (message.equals("MEMBER_ADD_YES")) {
	%>
	<script type="text/javascript">
		alert("성공적으로 가입되었습니다. 로그인해주십시오");
		location.href = "/member/login.do";
	</script>
	<%
	} else if (message.equals("MEMBER_ADD_NO")){
	%>
	<script type="text/javascript">
		alert("가입되지 않았습니다. 다시 가입해 주십시오");
		location.href = "/member/regi.do";
	</script>
	<%
	}else if (message.equals("MEMBER_UPDATE_YES")) {
	%>
		<script type="text/javascript">
			alert("수정되었습니다.");
			
			location.href = "/member/myProfile.do?teId=<%=userInfo.getTeId() %>";
		</script>
		<%
	} else if (message.equals("MEMBER_UPDATE_NO")){
	%>
	<script type="text/javascript">
		alert("수정에 실패하였습니다.");
		
		location.href = "/member/myProfile.do?teId=<%=userInfo.getTeId() %>";
	</script>
	<%
	}else if (message.equals("UNREGI_YES")) {
	%>
		<script type="text/javascript">
			alert("회원탈퇴되었습니다.");
			
			location.href = "../home.do";
		</script>
		<%
	} else if (message.equals("UNREGI_NO")){
	%>
	<script type="text/javascript">
		alert("아이디와 비밀번호가 일치하지 않습니다.");
		location.href = "../home.do";
	</script>
	<%
	}else if (message.equals("UPDATEPWD_YES")) {
	%>
		<script type="text/javascript">
			alert("비밀번호가 변경되었습니다. 다시 로그인해주십시오.");
			
			location.href = "../home.do";
		</script>
		<%
	} else if (message.equals("UPDATEPWD_NO")){
	%>
	<script type="text/javascript">
		alert("비밀번호변경에 실패하였습니다.");
		location.href = "../home.do";
	</script>
	<%
	}else if (message.equals("MYPLAN_LIST_ADD_OK")) {
	%>
		<script type="text/javascript">
			alert("여행을 등록하였습니다. ");
			
			location.href = "/member/myPlanList.do?teId=<%=login.getTeId() %>";
		</script>
		<%
	} else if (message.equals("MYPLAN_LIST_ADD_NO")){
	%>
	<script type="text/javascript">
		alert("여행등록에 실패하였습니다.");
		location.href = "/member/myPlanList.do?teId=<%=login.getTeId() %>";
	</script>
	<%
	}else if (message.equals("ADD_PLAN_OK")) {
	%>
		<script type="text/javascript">
			alert("여행일정을 등록했습니다. ");
			
			location.href = "/member/myPlanDetail.do?seq=<%=planSeq.getSeq() %>";
		</script>
		<%
	} else if (message.equals("ADD_PLAN_NO")){
	%>
	<script type="text/javascript">
		alert("여행일정 등록에 실패하였습니다.");
		location.href = "/member/myPlanDetail.do?seq=<%=planSeq.getSeq() %>";
	</script>
	<%
	}else if (message.equals("UPDATE_PLAN_OK")) {
	%>
		<script type="text/javascript">
			alert("여행일정이 수정되었습니다. ");
			
			location.href = "/member/myPlanDetail.do?seq=<%=planSeq.getSeq() %>";
		</script>
		<%
	} else if (message.equals("UPDATE_PLAN_NO")){
	%>
	<script type="text/javascript">
		alert("여행일정 수정이 실패하였습니다.");
		location.href = "/member/myPlanDetail.do?seq=<%=planSeq.getSeq() %>";
	</script>
	<%
	}else if (message.equals("DELETE_PLAN_OK")) {
	%>
		<script type="text/javascript">
			alert("여행일정이 삭제되었습니다. ");
			
			location.href = "/member/myPlanDetail.do?seq=<%=myplan.getSeq() %>";
		</script>
		<%
	} else if (message.equals("DELETE_PLAN_NO")){
	%>
	<script type="text/javascript">
		alert("여행일정 삭제를 실패하였습니다.");
		location.href = "/member/myPlanDetail.do?seq=<%=myplan.getSeq() %>";
	</script>
	<%
	}else if (message.equals("DELETE_PLANLIST_OK")) {
		%>
			<script type="text/javascript">
				alert("여행일정이 삭제되었습니다. ");
				
				location.href = "/member/myPlanList.do?teId=<%=login.getTeId() %>";
			</script>
			<%
		} else if (message.equals("DELETE_PLANLIST_NO")){
		%>
		<script type="text/javascript">
			alert("여행일정 삭제를 실패하였습니다.");
			location.href = "/member/myPlanList.do?teId=<%=login.getTeId() %>";
		</script>
		<%
	}else if (message.equals("UPDATE_PLANLIST_OK")) {
		%>
		<script type="text/javascript">
			alert("여행일정이 수정되었습니다. ");
			
			location.href = "/member/myPlanList.do?teId=<%=login.getTeId() %>";
		</script>
		<%
	} else if (message.equals("UPDATE_PLANLIST_NO")){
	%>
	<script type="text/javascript">
		alert("여행일정 수정을 실패하였습니다.");
		location.href = "/member/myPlanList.do?teId=<%=login.getTeId() %>";
	</script>
	<%
	}
}

%>
