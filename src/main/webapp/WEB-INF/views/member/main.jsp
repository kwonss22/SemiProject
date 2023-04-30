<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<main>
    <div class="mainWrap">
        <div class="keyVisualBg">
            <div class="swiper mySwiper" id="swiper-myswiper-mainvisual">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide"><img src="../asset/images/keyVisual1.jpg" alt="keyVisual1"></div>
                        <div class="swiper-slide"><img src="../asset/images/keyVisual2.jpg" alt="keyVisual2"></div>
                        <div class="swiper-slide"><img src="../asset/images/keyVisual3.jpg" alt="keyVisual3"></div>
                        <div class="swiper-slide"><img src="../asset/images/keyVisual4.jpg" alt="keyVisual4"></div>
                    </div>
                    <div class="swiper-pagination" id="swiper-pagination-mainvisual"></div>
             </div>
        </div>
        <div class="category">
            <a href="/plan/list.do?category=title&search=호캉스" class="hotel">
                <img src="../asset/images/hotel.png" alt="hotel">
                <span>호캉스</span>
            </a>
            <a href="/plan/list.do?category=title&search=펜션" class="hotel">
                <img src="../asset/images/pension.png" alt="pension">
                <span>펜션</span>
            </a>
            <a href="/plan/list.do?category=title&search=캠핑" class="hotel">
                <img src="../asset/images/camping.png" alt="camping">
                <span>캠핑</span>
            </a>
            <a href="/play/play.do?choice=title&search=전시" class="hotel">
                <img src="../asset/images/museum.png" alt="museum">
                <span>전시</span>
            </a>
            <a href="/play/play.do?choice=title&search=핫플" class="hotel">
                <img src="../asset/images/place.png" alt="place">
                <span>핫플</span>
            </a>
        </div>
        <div class="categoryContent campingBox">
            <p class="cTitle">인기여행코스</p>
            <div class="cContent">
                <a href="/plan/planDetail.do?tpSeq=2" class="cBox" target="_blank">
                    <div><img src="../upload/plan/4_thumbnail.jpg" alt=""></div>
                    <p>여수 여행 코스 추천</p>
                </a>
                <a href="/plan/planDetail.do?tpSeq=3" class="cBox" target="_blank">
                    <div><img src="../upload/plan/5_thumbnail.jpg" alt=""></div>
                    <p>보령 여행, 가족 봄나들이 여행 코스</p>
                </a>
                <a href="/plan/planDetail.do?tpSeq=4" class="cBox" target="_blank">
                    <div><img src="../upload/plan/6_thumbnail.jpg" alt=""></div>
                    <p>통영 1박2일 여행코스</p>
                </a>
                <a href="/plan/planDetail.do?tpSeq=5" class="cBox" target="_blank">
                    <div><img src="../upload/plan/7_thumbnail.jpg" alt=""></div>
                    <p>전북 고창 여행코스</p>
                </a>
            </div>
        </div>
        <div class="categoryContent campingBox">
            <p class="cTitle">전시</p>
            <div class="cContent">
                <a href="/play/playdetail.do?pSeq=4" class="cBox" target="_blank">
                    <div><img src="../upload/play/1679395960519.png" alt=""></div>
                    <p>시공(時空)을 초월한 자연 제주 아르떼 뮤지엄</p>
                </a>
                <a href="/play/playdetail.do?pSeq=5" class="cBox" target="_blank">
                    <div><img src="../upload/play/1679396017601.png" alt=""></div>
                    <p>도심 속 문화 공간 부산시립미술관</p>
                </a>
                <a href="/play/playdetail.do?pSeq=6" class="cBox" target="_blank">
                    <div><img src="../upload/play/1679395985025.png" alt=""></div>
                    <p>제주도 호캉스 추천 그랜드 하얏트 제주 호텔 수영장 38층 라운지 조식</p>
                </a>
                <a href="/play/playdetail.do?pSeq=7" class="cBox" target="_blank">
                    <div><img src="../upload/play/1679396053161.png" alt=""></div>
                    <p>올해도 전시·축제 보러 DDP 가자</p>
                </a>
            </div>
        </div>
        <div class="categoryContent campingBox">
            <p class="cTitle">핫플레이스</p>
            <div class="cContent">
                <a href="/play/playdetail.do?pSeq=8" class="cBox" target="_blank">
                    <div><img src="../upload/play/1679396073794.png" alt=""></div>
                    <p>제주마을산책 애월소개</p>
                </a>
                <a href="/play/playdetail.do?pSeq=9" class="cBox" target="_blank">
                    <div><img src="../upload/play/1679396095181.png" alt=""></div>
                    <p>낭만의 정석, 광안리 바다</p>
                </a>
                <a href="/play/playdetail.do?pSeq=10" class="cBox" target="_blank">
                    <div><img src="../upload/play/1679396142010.png" alt=""></div>
                    <p>부산 바다의 정석, 해운대해수욕장</p>
                </a>
                <a href="/play/playdetail.do?pSeq=11" class="cBox" target="_blank">
                    <div><img src="../upload/play/1679397865241.png" alt=""></div>
                    <p>롯데월드 부산 동화 속 왕국에 찾아온 봄 시즌 운영</p>
                </a>
            </div>
        </div>
        <div class="categoryContent campingBox">
            <p class="cTitle">여행꿀팁</p>
            <div class="cContent">
                <a href="/plan/planDetail.do?tpSeq=1" class="cBox" target="_blank">
                    <div><img src="../upload/plan/3_thumbnail.jpg" alt=""></div>
                    <p>안 가면 후회할 숨은 벚꽃 명소</p>
                </a>
                <a href="/plan/planDetail.do?tpSeq=10" class="cBox" target="_blank">
                    <div><img src="../upload/plan/1_thumbnail1.jpg" alt=""></div>
                    <p>뚜벅이 여행 1번지! 담양 걷기 여행</p>
                </a>
                <a href="/plan/planDetail.do?tpSeq=6" class="cBox" target="_blank">
                    <div><img src="../upload/plan/2_thumbnail.jpg" alt=""></div>
                    <p>2시간이면 갈 수 있는 춘천 여행 코스</p>
                </a>
                <a href="/plan/planDetail.do?tpSeq=7" class="cBox" target="_blank">
                    <div><img src="../upload/plan/8_thumbnail.jpg" alt=""></div>
                    <p>종로 레트로여행 코스추천</p>
                </a>
            </div>
        </div>
</div>
</main>
<script>
    var swiper = new Swiper("#swiper-myswiper-mainvisual", {
        /* slidesPerView: 1, */
        autoHeight : true,
        spaceBetween: 30,
        loop: true,
        pagination: {
            el: "#swiper-pagination-mainvisual",
            clickable: true,
        },
        autoplay:{
            delay:3000, //1초(설정 안할 시 기본3초)
            disableOnInteraction:false //true일 경우 마우스가 올라가면 재생 일시정지
        },
    });
</script>