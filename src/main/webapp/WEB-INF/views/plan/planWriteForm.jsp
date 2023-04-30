<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:include page="/WEB-INF/views/member/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>여행이지 : 여행플랜 작성</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="/assets/css/style.css">
	<link rel="stylesheet" href="../asset/css/reset.css">
	<link rel="stylesheet" href="../asset/css/common.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<style type="text/css">
	.form-control .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 78%;
    color: #999999;
}

.form-group label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #64bdeb;
    cursor: pointer;
    height: 40px;
    margin-left: 5px;
}

.form-group input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
	</style>
</head>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<body>
	<div class="slider-area ">
		<div class="single-slider slider-height2 d-flex align-items-center"
			style="background-image: url('/assets/img/hero/contact_hero.jpg')">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<h2>Write</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	 <section class="contact-section">
	     <div class="container">
	     	<div class="row">
				<div class="col-12">
					<h2 class="contact-title">새로운 여행 플랜을 작성해보세요</h2>
	             </div>
	             <div class="col-lg-12">
	                 <form class="form-contact contact_form" action="planWrite.do" method="post" id="contactForm" onsubmit="return regi()" enctype="multipart/form-data">
	                		<input type="hidden" name="tpId" value="${sessionScope.login.teId }" />
	                     <div class="row">
	                         <div class="col-5">
	                             <div class="form-group">
	                                 <input class="form-control" name="tpTitle" onfocus="this.placeholder = ''" onblur="this.placeholder = '제목을 입력해주세요.'" placeholder="제목을 입력해주세요." required>
	                             </div>
	                             <div class="form-group">
	                                 <input class="form-control" name="tpLocation" onfocus="this.placeholder = ''" onblur="this.placeholder = '지역을 입력해주세요.(예:강원도 춘천시)'" placeholder="지역을 입력해주세요.(예:강원도 춘천시)" required>
	                             </div>
									<div class="form-group">
										<input class="form-control upload-name" placeholder="썸네일 이미지를 등록해주세요." readonly>
										<label for="file">파일찾기</label> 
										<input type="file" id="file" name="image">
	                             </div>
	                         </div>
	                         <div class="col-12">
	                             <div class="form-group">
	                                 <textarea class="form-control w-100" name="tpContent" id="content" onfocus="this.placeholder = ''" onblur="this.placeholder = '내용을 입력해주세요.'" placeholder="내용을 입력해주세요."></textarea>
	                                 <script type="text/javascript">
				  CKEDITOR.replace('content',
				    {
					width : '1000px', 
					height : '500px',
					enterMode : CKEDITOR.ENTER_BR,
					// shift+엔터를 했을 때 <p> 태그로 처리한다.
					shiftEnterMode : CKEDITOR.ENTER_P,
					// 이미지ㆍ파일을 업로드 하는 위치
					filebrowserUploadUrl : "fileupload.do"
				    }
				  );
				</script>
	                             </div>
	                         </div>
	                     </div>
	                     <div class="form-group mt-3">
	                         <button type="submit" class="button button-contactForm boxed-btn">등록</button>
	                         <button type="button" class="button button-contactForm boxed-btn cancel" onclick="javascript:history.back();">취소</button>
	                     </div>
	                     </form>
	                     </div>
	                     </div>
	                     </div>
	                     </section>
	                     <script>
	                     $("#file").on('change',function(){
	                    	  var fileName = $("#file").val();
	                    	  $(".upload-name").val(fileName);
	                    	});
	                     
	                     function regi(){
	                    	 if($("#file").val() == null || $("#file").val() == '') {
	                    		 alert("썸네일 이미지를 등록해주세요.");
	                    		 return false;
	                    	 }
	                    	 
	                     	if(CKEDITOR.instances.content.getData() == ''){
	                     		alert("내용을 입력해주세요.");
	                     		CKEDITOR.instances.content.focus();
	                     		return false;
	                     	} else{
	                      	if(confirm("글을 등록하시겠습니까?")) {
	                      		alert("글이 등록되었습니다");
	                      		return true;
	                      	}
	                      	return false;
	                     	}
	                     }
	                     </script>
	                     <jsp:include page="/WEB-INF/views/member/footer.jsp"/>
</body>
</html>