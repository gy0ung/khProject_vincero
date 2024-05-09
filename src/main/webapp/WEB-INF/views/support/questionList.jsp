<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/support/question.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="빈체로 - 질문게시판" name="title"/>
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
	
<div id="question">
	<div id="matinTitle">
	<h2>- 질문게시판 -</h2>
</div>
	<table id="listTable">
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td id="listButton" style="text-align:right !important;">
				<c:if test="${not empty loginMember.userId}">
					<button id="enrollBtn">글쓰기</button>
				</c:if>
			</td>
		</tr>	
		<tr>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>답변여부</th>
		</tr>
		<c:choose>
			<c:when test="${empty searchQuest}">
			<c:forEach items="${questionList}" var="question">
				<tr>
					<c:if test="${question.depth == 0}">
						<td style="text-align: left;" width="500px">
						<c:choose>
							<c:when test="${loginMember.userId == question.questionWriter || loginMember.userType == 'admin'}">
								<a id="qt" href="${pageContext.request.contextPath}/support/questionDetail.su?questionNo=${question.questionNo}">${question.questionTitle}</a>
							</c:when>
							<c:otherwise>
								<a id="titleLineFromOther" href="${pageContext.request.contextPath}/support/questionList.su">${question.questionTitle}</a>
							</c:otherwise>
						</c:choose>
						</td>
						<td>${question.questionWriter}</td>
						<td>${question.createDate}</td>
						<td>${question.count}</td>
						<c:if test="${question.questionStatus == 0}">
							<td style="color:red">답변대기중</td>
						</c:if>
						<c:if test="${question.questionStatus == 1}">
							<td style="color:blue">답변완료</td>
						</c:if>
					</c:if>
						<td colspan="6" class="replyLine">
					<c:if test="${question.depth == 1}">
						<c:choose>
							<c:when test="${loginMember.userId == question.questionWriter || loginMember.userType == 'admin'}">
								<a href="${pageContext.request.contextPath}/support/questionDetail.su?questionNo=${question.questionNo}">&emsp;&emsp;&emsp;&#x21AA ${question.questionTitle}</a>
							</c:when>
							<c:otherwise>
								<a id="replyLineFromOther" href="javascript:void(0)">&emsp;&emsp;&emsp;&#x21AA ${question.questionTitle}</a>
							</c:otherwise>
						</c:choose>
					</c:if>
						</td>
				</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach items="${searchQuest}" var="question">
				<tr>
					<c:if test="${question.depth == 0}">
						<td style="text-align: left;" width="500px">
						<c:choose>
							<c:when test="${loginMember.userId == question.questionWriter || loginMember.userType == 'admin'}">
								<a id="qt" href="${pageContext.request.contextPath}/support/questionDetail.su?questionNo=${question.questionNo}">${question.questionTitle}</a>
							</c:when>
							<c:otherwise>
								<a id="titleLineFromOther" href="${pageContext.request.contextPath}/support/questionList.su">${question.questionTitle}</a>
							</c:otherwise>
						</c:choose>
						</td>
						<td>${question.questionWriter}</td>
						<td>${question.createDate}</td>
						<td>${question.count}</td>
						<c:if test="${question.questionStatus == 0}">
							<td style="color:red">답변대기중</td>
						</c:if>
						<c:if test="${question.questionStatus == 1}">
							<td style="color:blue">답변완료</td>
						</c:if>
					</c:if>
						<td colspan="6" class="replyLine">
					<c:if test="${question.depth == 1}">
						<c:choose>
							<c:when test="${loginMember.userId == question.questionWriter || loginMember.userType == 'admin'}">
								<a href="${pageContext.request.contextPath}/support/questionDetail.su?questionNo=${question.questionNo}">&emsp;&emsp;&emsp;&#x21AA ${question.questionTitle}</a>
							</c:when>
							<c:otherwise>
								<a id="replyLineFromOther" href="javascript:void(0)">&emsp;&emsp;&emsp;&#x21AA ${question.questionTitle}</a>
							</c:otherwise>
						</c:choose>
					</c:if>
						</td>
				</tr>
			</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</table>

		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:if test="${pi.nowPage ne 1}">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/support/questionList.su?nowPage=${pi.nowPage-1}" >Previous&emsp;</a>
					</li>
				</c:if>
				<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
					<c:choose>
						<c:when test="${p eq pi.nowPage}">
							<li class="page-item active">
								<a class="page-link" href="${pageContext.request.contextPath}/support/questionList.su?nowPage=${p}">&emsp;${p}&emsp;</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="${pageContext.request.contextPath}/support/questionList.su?nowPage=${p}">&emsp;${p}&emsp;</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${ pi.nowPage ne pi.totalPage }">
					<li class="page-item">
						<a class="page-link" href="${pageContext.request.contextPath}/support/questionList.su?nowPage=${pi.nowPage+1}">&emsp;Next</a>
					</li>
				</c:if>
			</ul>
		</nav>
	<div id="lower-option">
		<div id="search">
			<select id="searchType">
				<option value="questionWriter">id</option>
				<option value="questionTitle">제목</option>
				<option value="content">내용</option>
				<option value="questionStatus">답변여부</option>
			</select>
			<input type="text" id="searchInput">
			<input type="button" id="searchButton" value="검색">
		</div>
	</div>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
$(document).ready(function() {
    $("#enrollBtn").click(function() {
        location.href = '${pageContext.request.contextPath}/support/questionForm.su';
    });

    $("#replyLineFromOther").click(function() {
        alert("질문 답변은 질문을 등록한 사람만 볼 수 있습니다.");
    });
    
    $("#titleLineFromOther").click(function() {
        alert("질문글은 질문자만 볼 수 있습니다.");
    });
    
    $("#searchButton").click(function() {
    	const searchType = document.getElementById("searchType").value;
    	const searchInput = document.getElementById("searchInput").value;
    	const url = "${pageContext.request.contextPath}/support/searchQuestion.su?searchType=" + searchType + "&searchInput=" + searchInput;
    	location.href = url;
    });
});
</script>
</html>