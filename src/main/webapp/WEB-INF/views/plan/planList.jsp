<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${param.category }" var="category" />
<c:set value="${param.search }" var="search" />
<c:if test="${category == null }">${category = "" }</c:if>
<c:if test="${search == null }">${search = "" }</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>여행플랜 리스트</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/assets/css/flaticon.css">
	<link rel="stylesheet" href="/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="/assets/css/nice-select.css">
	<link rel="stylesheet" href="/assets/css/style.css">
	<link rel="stylesheet" href="../asset/css/reset.css">
	<link rel="stylesheet" href="../asset/css/common.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/member/header.jsp"/>
	<main>
		<div class="slider-area ">
			<div class="slider-active">
				<div class="single-slider hero-overly  slider-height d-flex align-items-center" style="background-image: url('/assets/img/hero/h1_hero.jpg')">
					<div class="container">
						<div class="row">
							<div class="col-xl-9 col-lg-9 col-md-9">
								<div class="hero__caption">
									<h1>Find your <span>Next tour!</span></h1>
									<p>Where would you like to go?</p>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xl-12">
								<form class="search-box">
									<div class="input-form mb-30">
										<input type="text" id="search" name="search" value="${search }" placeholder="검색어를 입력해주세요">
									</div>
									<div class="select-form mb-30">
										<div class="select-itms">
											<select class="nice-select" id="category" name="category" tabindex="0">
												<option value="all">All</option>
												<option value="title">Title</option>
												<option value="location">Location</option>
												<option value="content">Content</option>
											</select>
										</div>
									</div>
									<div class="search-form mb-30">
										<button type="button" onclick="searchBtn()">Search</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 로그인 한 회원에게만 글쓰기 버튼 노출 -->
		<c:if test="${sessionScope.login.teId != null && sessionScope.login.teId != ''  }">
		<div class="our-services servic-padding">
            <div class="container">
                <div class="row d-flex justify-contnet-center">
               		<a href="planWriteForm.do" class="genric-btn info circle">글쓰기</a>
                </div>
            </div>
        </div>
        </c:if>
        <div class="favourite-place place-padding">
        	<div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>누군가의 여행 플래너가 되어보세요</span>
                            <h2>Popular Plans</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${planList }" var="list">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="${list.tpFileName }" style="height: 288px;">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fa fa-heart"></i><span>${list.tpLikeCount } people like this</span> </span>
                                    <h3><a href="/plan/planDetail.do?tpSeq=${list.tpSeq }" onclick="validate(event)">${list.tpTitle }</a></h3>
                                    <p class="dolor">${list.tpId }</p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i><fmt:formatDate value="${list.tpWriteDate }" pattern="yy.MM.dd" /></li>
                                        <li><i class="fas fa-map-marker-alt"></i>${list.tpLocation}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- Pagination-area Start -->
        <div class="pagination-area pb-100 text-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="single-wrap d-flex justify-content-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-start" id="pagination">
                                </ul>
                              </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</main>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
	<script type="text/javascript">
	$('#pagination').twbsPagination({
    	startPage: ${currentPage + 1},
        totalPages: ${totalPages},
        visiblePages: 5,
        first:'<li class="page-item"><span class="flaticon-arrow roted left-arrow"></span></li>',
        prev:"이전",
        next:"다음",
        last:'<li class="page-item"><span class="flaticon-arrow right-arrow"></span></li>',
        initiateStartPageClick:false,
        onPageClick: function (event, page) {
        	let category = document.querySelector('#category').value;
        	let search = document.querySelector('#search').value;
        	location.href = "list.do?category=" + category + "&search=" + search + "&pageNumber=" + (page-1);
        }
    })
	</script>
	<script src="/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="/assets/js/slick.min.js"></script>
	<script src="/assets/js/jquery.sticky.js"></script>
	<script src="/assets/js/plugins.js"></script>
	<script src="/assets/js/main.js"></script>
	<script type="text/javascript">
	console.log("${sessionScope.login.teId}");
	function validate(event) {
		event.preventDefault();
		
		if("${sessionScope.login.teId}" == '') {
			alert("로그인 후 이용해주세요");
			location.href = "/member/login.do";
		} else {
			let link = event.target.href;
			let tpSeq = link.match(/tpSeq=(\d+)/)[1];
			location.href = "/plan/planDetail.do?tpSeq=" + tpSeq;
		}
	}
	
	let search = "${param.search}";
	if(search != "") {
		let obj = document.querySelector("#category");
		obj.value = "${param.category}";
		obj.setAttribute("selected", "selected");
	}
	function searchBtn() {
		let category = $('#category').val();
		let search = $('#search').val();
		location.href = "/plan/list.do?category=" + category + "&search=" + search;
	}
    </script>
    <jsp:include page="/WEB-INF/views/member/footer.jsp"/>
</body>
</html>