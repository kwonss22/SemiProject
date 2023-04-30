
// 함수
// 프로필이미지 등록 시 썸네일 변경
function setThumbnail(event) {
	var reader = new FileReader();

	reader.onload = function(event) {
		let img = document.querySelector(".roundImg>img");
		img.setAttribute("src", event.target.result);
		document.querySelector(".roundImg").appendChild(img);
	};

	reader.readAsDataURL(event.target.files[0]);
}
// 날짜 custom 함수
function dateCustom(dayInput, dayCustomSpan){
	dayInput.addEventListener('input', function() {
		  const date = new Date(this.value);
		  const year = date.getFullYear();
		  const month = (date.getMonth() + 1).toString().padStart(2, '0');
		  const day = date.getDate().toString().padStart(2, '0');
		  dayCustomSpan.textContent = year+"/"+month+"/"+day;
		  dayCustomSpan.classList.add('colorChange')
		});
}
// 시간 custom 함수
function timeCustom(timeInput, timeCustomSpan) {
	timeInput.addEventListener('input', function() {
		  const timeArray = this.value.split(':');
		  const hour = timeArray[0];
		  const minute = timeArray[1];
		  timeCustomSpan.textContent = hour + ":" + minute;
		  timeCustomSpan.classList.add('colorChange');
	});
}

// 빈칸정보확인
function nullFalseChk(userInfo) {
	userInfo.classList.remove('inputOk');
	userInfo.classList.add('inputNg');
	userInfo.classList.add('shake-element');
	setTimeout(function() {
		userInfo.classList.remove('shake-element');
	}, 300);
}
// 빈칸이었다가 다시 입력될 때 removeClass
function dateInputChk(userInfo, custom) {
	userInfo.addEventListener('input', function() {
		custom.classList.remove('inputNg');
	})
}
function inputChk(userInfo) {
	userInfo.addEventListener('input', function() {
		userInfo.classList.remove('inputNg');
	})
}
