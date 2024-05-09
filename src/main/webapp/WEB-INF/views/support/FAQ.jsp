<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.faq-container {
	max-width: 800px;
	margin: 20px auto;
	
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

.faq-container h1 {
	font-size: 28px;
	margin-bottom: 20px;
	color: #333;
	text-align: center;
}

.faq-item {
	margin-bottom: 20px;
}

.faq-question {
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
	color: #333;
	padding: 10px;
	border-radius: 5px;
}

.faq-answer {
	margin-top: 10px;
	padding-left: 20px;
	font-size: 18px;
	color: #666;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.3s ease-out;
}

.faq-answer.show {
	max-height: 500px;
	transition: max-height 0.3s ease-in;
}

@media screen and (max-width: 600px) {
	.faq-container {
		padding: 10px;
	}
	h1 {
		font-size: 24px;
		margin-bottom: 15px;
	}
	.faq-question {
		font-size: 18px;
		padding: 8px;
	}
	.faq-answer {
		font-size: 16px;
	}
}

#menuNav {
	margin-left: 60%;
}

.menuButton {
	background-color: window;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	padding: 15px;
	font-size: large;
}

.menuButton {
	margin-left: 30px; /* 원하는 간격 크기를 설정합니다 */
}

.menuButton:hover {
	background-color: orange;
	color: white;
	font-weight: bold;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="빈체로 - 자주묻는 질문" name="title" />
	</jsp:include>
	
  		<!-- 상단 메뉴버튼 및 스크립트 -->
	<nav id="menuNav">
		<button class="menuButton" type="button" onclick="noticeList()">공지사항</button>
		<button class="menuButton" type="button" onclick="FAQ()">자주묻는 질문</button>
		<button class="menuButton" type="button" onclick="questionList()">질문 게시판</button>
		<button class="menuButton" type="button" onclick="publicEmergency()">전국 외상센터</button>
	</nav>
	
	<script>
	function noticeList() {
		location.href="${pageContext.request.contextPath}/support/noticeList.su";
	}
	function FAQ() {
		location.href="${pageContext.request.contextPath}/support/FAQ.su";
	}
	function questionList() {
		location.href="${pageContext.request.contextPath}/support/questionList.su";
	}
	function publicEmergency() {
		location.href="${pageContext.request.contextPath}/support/publicEmergency.su";
	}
	</script>
	
	<div class="faq-container">
		<h1>자주 묻는 질문</h1>

		<div class="faq-item">
			<div class="faq-question" onclick="toggleAnswer(1)">Q. 회원 탈퇴는 어떻게 하나요?</div>
			<div class="faq-answer" id="answer1"></div>
		</div>

		<div class="faq-item">
			<div class="faq-question" onclick="toggleAnswer(2)">Q. 도복이 없는데 시합참여가 가능한가요?</div>
			<div class="faq-answer" id="answer2"></div>
		</div>

		<div class="faq-item">
			<div class="faq-question" onclick="toggleAnswer(3)">Q. 경고는 사라지게 할 수 있나요?</div>
			<div class="faq-answer" id="answer3"></div>
		</div>

		<div class="faq-item">
			<div class="faq-question" onclick="toggleAnswer(4)">Q. 환불이 가능한가요?</div>
			<div class="faq-answer" id="answer4"></div>
		</div>

		<div class="faq-item">
			<div class="faq-question" onclick="toggleAnswer(5)">Q. 남여 매칭이 가능한가요?</div>
			<div class="faq-answer" id="answer5"></div>
		</div>

		<div class="faq-item">
			<div class="faq-question" onclick="toggleAnswer(6)">Q. 체육관 등록 절차를 알고싶어요</div>
			<div class="faq-answer" id="answer6"></div>
		</div>
		
		<div class="faq-item">
			<div class="faq-question" onclick="toggleAnswer(7)">Q. 미성년자도 경기 참여 가능한가요?</div>
			<div class="faq-answer" id="answer7"></div>
		</div>

		<div class="faq-item">
			<div class="faq-question" onclick="toggleAnswer(8)">Q. 경기 취소 절차를 알고싶어요</div>
			<div class="faq-answer" id="answer8"></div>
		</div>
		
		<div class="faq-item">
			<div class="faq-question" onclick="toggleAnswer(9)">Q. 체육관 관장도 경기에 참여할 수 있나요?</div>
			<div class="faq-answer" id="answer9"></div>
		</div>
	</div>

	<script>
	function typeResponse(element, text) {
		var typingSpeed = 100; // 타이핑 속도 조절 (밀리초 단위)
		var index = 0;

		var intervalId = setInterval(function() {
			if (index < text.length) {
				var currentChar = text.charAt(index);
				element.innerHTML += currentChar;
				index++;

				// 스크롤 아래로 자동 이동
				element.parentElement.scrollTop = element.parentElement.scrollHeight;
			} else {
				clearInterval(intervalId);
			}
		}, typingSpeed);
	}

	function toggleAnswer(index) {
		var answer = document.getElementById("answer" + index);
		if (answer.classList.contains("show")) {
			// 토글이 열려있는 경우는 아무 동작도 하지 않음
			return;
		}

		// 토글이 닫혀있는 경우
		answer.classList.add("show");
		if (!answer.innerHTML.trim()) {
			var text = answer.dataset.typingText;
			typeResponse(answer, text);
		}
	}

	// 각 답변 요소에 타이핑할 텍스트를 데이터 속성으로 설정
	var answer1 = document.getElementById("answer1");
	answer1.dataset.typingText = "A. 마이페이지 이용을 통해 사용자 및 법정 대리인은 언제든지 자신의 개인정보를 조회하거나 수정할 수 있고, 수집 및 이용에 대한 동의 철회(가입 해지)를 요청할 수 있습니다.";

	var answer2 = document.getElementById("answer2");
	answer2.dataset.typingText = "A. 운동 가능한 편한 복장(츄리닝, 운동복) 모두 가능합니다. (안경 착용불가 합니다)";

	var answer3 = document.getElementById("answer3");
	answer3.dataset.typingText = "A. 1년에 한번, 시즌이 초기화시 경고 초기화됩니다.";

	var answer4 = document.getElementById("answer4");
	answer4.dataset.typingText = "A. 결제후 30분이내 취소시 100%환불(일일 1회제한),  3일전 취소 시 100% 환불,  2일전 취소시 80%환불,  1일전 취소시 60%환불,  대관당일 환불불가";

	var answer5 = document.getElementById("answer5");
	answer5.dataset.typingText = "A. 아쉽지만, 남여 매칭은 신체특성상 사고방지를 하고자 매치불가 합니다.";

	var answer6 = document.getElementById("answer6");
	answer6.dataset.typingText = "A. 회원가입후 빈체로메뉴 > 체육관등록 > 체육관정보입력을 하면 심사를 거치고 체육관을 가서 상태 확인 후 최종 등록완료됩니다.";
	
	var answer7 = document.getElementById("answer7");
	answer7.dataset.typingText = "A. 미성년자는 경기 진행이 불가능합니다.";
	
	var answer8 = document.getElementById("answer8");
	answer8.dataset.typingText = "A. 내경기 보기에서 '취소' 버튼을 누르면 상대방 동의없이 취소가 가능합니다.";
	
	var answer9 = document.getElementById("answer9");
	answer9.dataset.typingText = "A. 체육관 관장도 회원으로 참여가 가능합니다. 다만 자신이 운영하는 체육관에서 이용할 시 심판 자격을 가지고 있는 사람이 심판을 보고 있어야 가능합니다. 별도로 심판이 없이는 진행이 불가능합니다.";
</script>
</body>
</html>
