<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
String playwrite = (String) request.getAttribute("playwrite");
if (playwrite != null && !playwrite.equals("")) {
if (playwrite.equals("OK")) {
%>
<script type="text/javascript">
	alert("성공적으로 작성되었습니다");
	location.href = "play.do";
</script>
<%
} else {
%>
<script type="text/javascript">
	alert("다시 작성해 주십시오");
	location.href = "playwrite.do";
</script>
<%
}
}

String playupdate = (String) request.getAttribute("playupdate");
if (playupdate != null && !playupdate.equals("")) {
int p_seq = (Integer)request.getAttribute("pSeq");
if (playupdate.equals("OK")) {
%>
<script type="text/javascript">
    let p_seq = <%=p_seq%>
	alert("성공적으로 수정 되었습니다.");
	location.href = "playdetail.do?&pSeq=" + p_seq;
</script>
<%
} else {
%>
<script type="text/javascript">
	alert("수정에 실패 했습니다. 다시 작성해 주십시오.");
	let p_seq = <%=p_seq%>
	location.href = "playudate.do?&pSeq=" + p_seq;
</script>
<%
}
}

String playdelete = (String) request.getAttribute("playdelete");
if (playdelete != null && !playdelete.equals("")) {
if (playdelete.equals("OK")) {
%>
<script type="text/javascript">
	alert("성공적으로 삭제되었습니다");
	location.href = "play.do";
</script>
<%
} else {
%>
<script type="text/javascript">
	alert("삭제되지 않았습니다");
	location.href = "play.do";
</script>
<%
}
}
%>







