<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support/publicEmergency.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="빈체로 - 전국 외상센터" name="title"/>
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
	
<div id="publicEmergency" class="form-floating">
	<div id="title">
		<h2>전국외상센터</h2>
		<div id="select">
			<select id="location">
				<option value="서울특별시">서울특별시</option>
				<option value="경기">경기도</option>
				<option value="충청남도">충청남도</option>
				<option value="충청북도">충청북도</option>
				<option value="강원특별자치도">강원특별자치도</option>
				<option value="경상남도">경상남도</option>
				<option value="경상북도">경상북도</option>
				<option value="전라남도">전라남도</option>
				<option value="전라북도">전라북도</option>
				<option value="제주특별자치도">제주특별자치도</option>
			</select>
		<button type="button" class="btn btn-outline-secondary" id="btn1">외상센터조회</button>
		</div>
	</div>
	<table class="table" id="result1">
	<thead>
	<tr>
	<th scope="col" width="30%">기관명</th>
	<th scope="col" width="40%">주소</th>
	<th scope="col" width="15%">대표전화</th>
	<th scope="col" width="15%">응급실전화</th>
	</tr>
	</thead>
	<tbody>
	</tbody>
	</table>
</div>
</body>
<script>
document.addEventListener('DOMContentLoaded', function() {
    document.querySelector("#btn1").click();
});

document.querySelector("#btn1").addEventListener('click', (e) => {
$.ajax({
	url:"emergency.su",
	data: {location: $("#location").val()},
	success(data) {
		const itemArr = $(data).find("item");
		console.log(itemArr);
		let value = "";
		itemArr.each(function(i, item) {
			value += "<tr>"
				  + 	"<td>" + $(item).find("dutyName").text() + "</td>"
				  +		"<td>" + $(item).find("dutyAddr").text() + "</td>"
				  + 	"<td>" + $(item).find("dutyTel1").text() + "</td>"
				  + 	"<td>" + $(item).find("dutyTel3").text() + "</td>"
				  + "</tr>"
		})
		$("#result1 tbody").html(value);
	},
	error: console.log
});
});
</script>
</html>