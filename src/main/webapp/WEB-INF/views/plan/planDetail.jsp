<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <jsp:include page="/WEB-INF/views/member/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>여행이지 - ${post.tpTitle }</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="/assets/img/favicon.png">
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="/assets/css/style.css">
	<link rel="stylesheet" href="../asset/css/reset.css">
	<link rel="stylesheet" href="../asset/css/common.css">
	<link rel="stylesheet" href="/assets/css/responsive.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
	<div class="slider-area ">
      <!-- Mobile Menu -->
      <div class="single-slider slider-height2 d-flex align-items-center" style="background-image: url('/assets/img/hero/about.jpg')">
          <div class="container">
              <div class="row">
                  <div class="col-xl-12">
                      <div class="hero-cap text-center">
                          <h2>${post.tpTitle}</h2>
                      </div>
                      <div class="hero-cap text-center">
                          <h5><i class="fa fa-location-arrow"></i>&nbsp;${post.tpLocation }</h5>
                      </div>
                      <div class="hero-cap text-center">
                          <h5><i class="fa fa-calendar-alt"></i>&nbsp;<fmt:formatDate value="${post.tpWriteDate }" pattern="yyyy.MM.dd.  HH:mm" /></h5>
                      </div>
                      <div class="hero-cap text-center">
                          <h5><i class="fa fa-user-circle"></i>&nbsp;${post.tpId }</h5>
                      </div>
                  </div>
              </div>
          </div>
      </div>
   </div>
   <section class="blog_area single-post-area section-padding">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 posts-list">
               <div class="single-post">
                  <!-- <div class="feature-img">
                     <img class="img-fluid" src="assets/img/blog/single_blog_1.png" alt="">
                  </div> -->
                  <div class="blog_details">
                     <%-- <h2>${post.title}</h2>
                     <ul class="blog-info-link mt-3 mb-4">
                        <li><i class="fa fa-user"></i> ${post.id }</li>
                        <li><i class="fa fa-comments"></i> ${repCount } Comments</li>
                     </ul> --%>
                     <c:if test="${sessionScope.login.teId == post.tpId }">
                     <button type="button" class="genric-btn info circle" onclick="location.href='planUpdateForm.do?tpSeq=${post.tpSeq }'">수정</button>
                     <button type="button" class="genric-btn danger circle" onclick="postdel()">삭제</button>
                     <hr>
                     </c:if>
                     <p class="excert">
                      ${post.tpContent }
                     </p>
                  </div>
              <a href="list.do" class="genric-btn info circle">목록으로</a>
                    <hr>
               </div>
               </div>
               <div class="navigation-top">
                  <div class="d-sm-flex justify-content-between text-center">
                     <c:choose>
                     	<c:when test="${sessionScope.login.teId != null && likeCheck !=0 }">
                     <p class="like-info"><span class="align-middle">
                     <span onclick="unlike()"><i class="fa fa-heart love"></i></span></span>${sessionScope.login.teId }님 외 ${countLike-1 }명이 좋아합니다</p>
                     	</c:when>
                     	<c:otherwise>
                     	<p class="like-info"><span class="align-middle">
                     <span onclick="like()"><i class="far fa-heart"></i></span></span>${countLike }명이 좋아합니다.</p>
                     </c:otherwise>
                     </c:choose>
                  </div>
               <div class="comments-area">
                  <h4>Comments (${commentCount })</h4>
                  <c:forEach items="${commentList }" var="comment">
                  <div class="comment-list">
                  <input type="hidden" class="replySeq" value="${comment.tcCommentSeq }" />
                     <div class="single-comment justify-content-between d-flex">
                     <c:choose>
                     <c:when test="${comment.tcDepth == 1 }">
                        <div class="user justify-content-between d-flex" style="margin-left:30px;">
                        <img src="/img/arrow.png" style="height:30px;">
                        </c:when>
                        <c:otherwise>
                        <div class="user justify-content-between d-flex">
                        </c:otherwise>
                       </c:choose>                        
                           <div class="thumb">
                              <img src="${sessionScope.login.teProfile }" alt="">
                           </div>
                           <div class="desc">
                              <p class="comment">
                              ${comment.tcContent }
                              </p>
                              <div class="d-flex justify-content-between">
                                 <div class="d-flex align-items-center">
                                    <h5>${comment.tcId }</h5>
                                    <p class="date"><fmt:formatDate value="${comment.tcWriteDate }" pattern="yyyy.MM.dd HH:mm" /></p>
                                 </div>
                                 <c:if test="${comment.tcDepth == 0}">
                                 <div class="reply-btn">
                                    <button class="genric-btn default circle reply">답글</button>
                                 </div>
                                 </c:if>
                                 <c:if test="${sessionScope.login.teId == comment.tcId }">
                                 <div class="reply-btn">
                                    <button type="button" class="genric-btn default circle modify">수정</button>
                                 </div>
                                 <div class="reply-btn">
                                    <button type="button" class="genric-btn default circle modifyComplete">수정완료</button>
                                 </div>
                                 <div class="reply-btn">
                                    <button type="button" class="genric-btn default circle delete">삭제</button>
                                 </div>
                                 </c:if>
                                 </div>
                                 <div class="comment-form" style="display:none;">
                              	</div>
                           </div>
                        </div>
                     </div>
                  </div>
                  </c:forEach>
               </div>
               <div class="comment-form">
                  <h4>Leave a Reply</h4>
                  <form class="form-contact comment_form" action="#" id="commentForm">
                     <div class="row">
                        <div class="col-12">
                           <div class="form-group">
                              <textarea class="form-control" name="comment" id="comment" cols="150" rows="3"
                                 placeholder="${sessionScope.login.teId }님, 댓글을 남겨보세요" onblur="this.placeholder = '${sessionScope.login.teId }님, 댓글을 남겨보세요'" onfocus="this.placeholder = ''"></textarea>
                           </div>
                        </div>
                     </div>
                     <br />
                     <div class="form-group">
                        <button type="button" id="commentBtn" class="button button-contactForm btn_1 boxed-btn">Send Message</button>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </section>
   <script type="text/javascript">
   const postdel = () => {
	   if(confirm("글을 삭제하시겠습니까?")) {
		   alert("게시글이 삭제 되었습니다.");
		   location.href = 'planDelete.do?tpSeq='+${post.tpSeq};
	   } else {
		   return;
	   }
   }
   
   $(".modifyComplete").hide();
   
   // 좋아요 처리
   const like = () => {
   	$.ajax({
		url:"/plan/planLike.do",
		data:{tpId:"${sessionScope.login.teId}", tpSeq:"${post.tpSeq}"},
		type:"get",
		success:function(msg){
			alert(msg);
			location.reload();
		},
		error:function(){
			alert("error");
		}
	}); // end of ajax
   } // end of like
   
   // 좋아요 취소처리
   const unlike = () => {
   	$.ajax({
		url:"/plan/unLike.do",
		data:{tpId:"${sessionScope.login.teId}", tpSeq:"${post.tpSeq}"},
		type:"get",
		success:function(msg){
			alert(msg);
			location.reload();
		},
		error:function(){
			alert("error");
		}
	}); // end of ajax
   } // end of unlike
   
   
   // 댓글 등록
   $("#commentBtn").click(function() {
	   if($("#comment").val() == '') {
		   alert('댓글 내용을 입력해주세요.');
		   $("#comment").focus();
		   return;
	   } else {
		   if(confirm("댓글을 등록하시겠습니까?")) {
			   $.ajax({
					url:"/plan/comWrite.do",
					type:"post",
					data:{
							"tpSeq":${post.tpSeq},
							"tcId":"${sessionScope.login.teId}",
							"tcContent":($("#comment").val())
					},
					success:function(msg) {
						location.reload();
						alert(msg);
					},
					error:function(){
						alert("에러요");
					}
				}) // end of ajax
		   } else {
			   return;
		   }
	   }
   })
   
   // 댓글 수정처리
   $(".modify").click(function() {
	   // 수정 버튼 hide
	   $(this).hide();
	   $(this).parents().prev(".reply-btn").find(".reply").hide();
	   $(this).parents().next(".reply-btn").find(".modifyComplete").show();
	   
	   // 원댓 가져오기
	   const originNode = $(this).parents(".desc").find(".comment");
	   const originReply = originNode.text().trim();
	   originNode.text("");
	   originNode.html('<div class="form-group"><textarea class="form-control modRep" cols="80" rows="3">'+originReply+'</textarea></div>');
	   
	   $(document).on('click', ".modifyComplete", function() {
		const replySeq = $(this).parents(".comment-list").find(".replySeq").val();
		   
		var modRep = $(this).parents(".desc").find(".modRep").val();
		   
		if(modRep != '') {
			if(confirm("댓글을 수정하시겠습니까?")) {
			   $.ajax({
					url:"/plan/comModify.do",
					data:{"tcContent":modRep, "tcCommentSeq":replySeq},
					type:"post",
					success:function(msg){
						location.reload();
						alert(msg);
					},
					error:function(){
						alert("에러요");
					}
				}) // end of ajax
			} else {
				return;
			}			
		} else {
			alert("댓글을 입력해주세요");
			$(this).parents(".desc").find(".modRep").focus();
			return;
		}
		   
	   })
   })
   
   // 댓글 삭제처리
   $(".delete").click(function() {
	  // 댓글 번호 가져오기
	  const replySeq = $(this).parents(".comment-list").find(".replySeq").val();
	  if(confirm("댓글을 삭제하시겠습니까?")) {
		  $.ajax({
				url:"/plan/comDelete.do",
				data:{"tcCommentSeq":replySeq},
				type:"get",
				success:function(msg){
					location.reload();
					alert(msg);
				},
				error:function(){
					alert("에러요");
				}
			}); // end of ajax'
	  } else {
		  return;
	  }
   })
   
   // 리댓 처리
   $(".reply").click(function() {
	   const replySeq = $(this).parents(".comment-list").find(".replySeq").val();
	   $(this).parent().parent().next(".comment-form").show();
	   
	   $(this).parent().parent().next(".comment-form").html('<form class="form-contact comment_form" action="#" id="commentForm">'
               + '<div class="row">'
               +'<div class="col-12">'
                +'<div class="form-group">'
                 +'<textarea class="form-control" name="comment" id="reComment" cols="60" rows="3"'
                   +'placeholder="${sessionScope.login.teId }님, 답글을 남겨보세요"></textarea>'
                  +'</div>'
               +'</div>'
            +'</div>'
            +'<br />'
            +'<div class="form-group">'
               +'<button type="button" class="button button-contactForm btn_1 boxed-btn re_comment_regi">Send Message</button>'
               +'   '
               +'<button type="button" class="button button-contactForm btn_1 boxed-btn cancle">cancel</button>'
            +'</div>'
         +'</form>');
	   $(".cancle").click(function(){
		   $(this).closest(".comment-form").hide();
		}) // end of cancle   
		
		$(".re_comment_regi").click(function(){
			if($("#reComment").val() == '') {
				alert('답글 내용을 입력해주세요');
				return;
			} else {
			$.ajax({
				url:"/plan/replyWrite.do",
				type:"post",
				data:{
					"tpSeq":"${post.tpSeq}",
					"tcCommentSeq":replySeq,
					"tcId":"${sessionScope.login.teId}",
					"tcContent":($("#reComment").val())},
				success:function(msg) {
					alert(msg);
					location.reload();
				},
				error:function(error) {
					alert("에러요");
				}
			});
		}
			})
		
   });
   </script>
   <jsp:include page="/WEB-INF/views/member/footer.jsp"/>
</body>
</html>