<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="/index.jsp">
	<jsp:param value="빈체로/관장 - 일정관리" name="title"/>
</jsp:include>
</head>
<body>
	<!-- 진행예정 경기 -->
	<div style="display: flex; justify-content: center;">
		<form>
			<h1>진행 예정 경기</h1>
			<!-- 내 체육관 경기 리스트 테이블 -->
			<table class="table">
				<tr>
					<th>체육관</th>
					<th>일정</th>
					<th>시간</th>
					<th>신청자1</th>
					<th>신청자2</th>
					<th>프로필</th>
				</tr>

				<c:forEach items="${matchListView}" var="matchList">
					<tr align="center">
						<td>${matchList.gymName}</td>
						<td>${matchList}</td>
						<td>${matchList.matchdate}</td>
						<td>${matchList.matchtime}</td>
						<td>${matchList.proNick}</td>
						<td>${matchList.proNick2}</td>
						<td><button type="button" target="_blank"
								onclick="openProfile('${gymMatch.userId1}', '${gymMatch.userId2}');">프로필</button></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>

	<!-- 페이지 코드 -->
	<nav id="page">
		<ul>
			<!-- 1페이지면 이전버튼이 활성화되지않도록 if문 추가 -->
			<c:if test="${pi.nowPage eq 1}">
				<li class="page-item"><a class="page-link"
					href="${pageContext.request.contextPath}/gym/gymMainPage.gym?nowPage=${pi.nowPage}">이전</a>
				</li>
			</c:if>
			<c:if test="${pi.nowPage ne 1}">
				<li class="page-item"><a class="page-link"
					href="${pageContext.request.contextPath}/gym/gymMainPage.gym?nowPage=${pi.nowPage-1}">이전</a>
				</li>
			</c:if>
			<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
				<c:choose>
					<c:when test="${p eq pi.nowPage}">
						<li class="page-item active"><a class="page-link"
							href="${pageContext.request.contextPath}/gym/gymMainPage.gym?nowPage=${p}">${p}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="${pageContext.request.contextPath}/gym/gymMainPage.gym?nowPage=${p}">${p}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- 마지막 페이지면 다음버튼이 활성화되지않도록 if문 추가 -->
			<c:if test="${ pi.nowPage eq pi.totalPage }">
				<li class="page-item"><a class="page-link"
					href="${pageContext.request.contextPath}/gym/gymMainPage.gym?nowPage=${pi.nowPage}">다음</a>
				</li>
			</c:if>
			<c:if test="${ pi.nowPage ne pi.totalPage }">
				<li class="page-item"><a class="page-link"
					href="${pageContext.request.contextPath}/gym/gymMainPage.gym?nowPage=${pi.nowPage+1}">다음</a>
				</li>
			</c:if>
		</ul>
	</nav>

</body>
</html>