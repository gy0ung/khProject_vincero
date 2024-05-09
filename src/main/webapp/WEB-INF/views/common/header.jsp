<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.title}</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common/header.css">
<c:if test="${not empty msg}">
	<script type="text/javascript">
		alert('${msg}');
	</script>
</c:if>
</head>
<body>
	<div id="header">
		<!-- 헤더 로고 -->
		<div id="logo">
			<a href="${pageContext.request.contextPath}"><img
				src="${pageContext.request.contextPath}/resources/img/logo.png"
				alt="logo" width="200px" height="90px"></a>
		</div>

		<div id="menubar">
			<nav>
				<ul id="menu_list">
					<li class="titlemenu"><a class="title"
						href="${pageContext.request.contextPath}/match/matchList.ma"><h3>매칭</h3></a>
						<ul class="submenu_list">
							<li><a
								href="${pageContext.request.contextPath}/match/matchReg.ma">매치
									등록</a></li>
							<li><a
								href="${pageContext.request.contextPath}/match/matchList.ma">매치
									찾기</a></li>
						</ul></li>
					<li class="titlemenu"><a class="title"
						href="${pageContext.request.contextPath}/ranking/rankingList.ra"><h3>랭킹</h3></a></li>
					<li class="titlemenu"><a class="title"
						href="${pageContext.request.contextPath}/support/support.su"><h3>빈체로</h3></a>
						<ul class="submenu_list">
							<li><a
								href="${pageContext.request.contextPath}/support/support.su">빈체로
									소개</a></li>
							<li><a
								href="${pageContext.request.contextPath}/support/rule.su">룰
									소개</a></li>
							<li><a
								href="${pageContext.request.contextPath}/gym/joinEnroll.gym">가맹
									신청</a></li>
						</ul></li>
					<li class="titlemenu2"><a class="title"
						href="${pageContext.request.contextPath}/support/noticeList.su"><h3>고객센터</h3></a>
						<ul class="submenu_list">
							<li><a
								href="${pageContext.request.contextPath}/support/noticeList.su">공지사항</a></li>
							<li><a
								href="${pageContext.request.contextPath}/support/FAQ.su">자주묻는
									질문</a></li>
							<li><a
								href="${pageContext.request.contextPath}/support/questionList.su">질문
									게시판</a></li>
							<li><a
								href="${pageContext.request.contextPath}/support/publicEmergency.su">전국
									외상센터</a></li>
						</ul></li>
					<li class="titlemenu3" id="bell"><img id="alarm"
						src="${pageContext.request.contextPath}/resources/img/alarm.png"
						alt="bell" width="30px" height="30px" onClick="popOpen();"></li>
					<li class="titlemenu" id="member"><img
						src="${pageContext.request.contextPath}/resources/img/index/menuIcon120.png"
						alt="member" width="30px" height="30px">
						<ul>
							<c:if test="${empty loginMember}">
								<li><a
									href="${pageContext.request.contextPath}/member/GoLoginPage.me">로그인</a></li>
							</c:if>
							<c:if test="${not empty loginMember}">
								<li id="loginName">${loginMember.userName}님<hr></li>
								<li><a
									href="${pageContext.request.contextPath}/member/memberLogout.me">로그아웃</a></li>
								<li><a
									href="${pageContext.request.contextPath}/member/memberDetail.me?userId=${loginMember.userId}">마이페이지</a></li>
								<c:choose>
									<c:when test="${loginMember.userStatus == 2}">
										<li><a
											href="${pageContext.request.contextPath}/profile/profileDetail.pr?userId=${loginMember.userId}">프로필
												수정</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="${pageContext.request.contextPath}/profile/profileEnroll.pr">프로필
												등록</a></li>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${loginMember.userType eq 'admin'}">
										<li><a
											href="${pageContext.request.contextPath}/support/noticeList.su">관리자</a></li>
									</c:when>
									<c:when test="${loginMember.userType eq 'coach'}">
										<li><a
											href="${pageContext.request.contextPath}/gym/gymMainPage.gym">관장</a></li>
									</c:when>
								</c:choose>
							</c:if>
						</ul></li>
				</ul>
			</nav>
		</div>
		<!-- 헤더 회원정보 -->
	</div>

	<div id="wrap"></div>

	<div class="modal-bg" onclick="popClose();"></div>
	<div class="modal-wrap-title">
		<table width="100%">
			<thead>
				<tr>
					<th>시간</th>
					<th>메시지</th>
					<th><button type="button" style="align: right;"
							class="modal-close" onClick="popClose()">X</button></th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="modal-wrap">
		<table>
			<tbody id="header_pop_up">

			</tbody>
		</table>
	</div>


	<!-- 사이드바 -->
	<div class="sidebar">
		<nav class="navbar">
			<ul id="side_list">
				<c:if test="${empty loginMember}">
					<li><a
						href="${pageContext.request.contextPath}/member/GoLoginPage.me">로그인</a>
				</c:if>
				<c:if test="${not empty loginMember}">
					<li id="loginName">${loginMember.userName}님
						<ul id="subside_list">
							<li><a
								href="${pageContext.request.contextPath}/member/memberLogout.me">로그아웃</a></li>
							<li><a
								href="${pageContext.request.contextPath}/match/myMatch.ma?userId=${loginMember.userId}">내
									경기</a></li>
							<li><a
								href="${pageContext.request.contextPath}/member/memberDetail.me?userId=${loginMember.userId}">마이페이지</a></li>
							<c:choose>
								<c:when test="${loginMember.userStatus == 2}">
									<li><a
										href="${pageContext.request.contextPath}/profile/profileDetail.pr?userId=${loginMember.userId}">프로필
											수정</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath}/profile/profileEnroll.pr">프로필
											등록</a></li>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${loginMember.userType eq 'admin'}">
									<li><a
										href="${pageContext.request.contextPath}/support/noticeList.su">관리자</a>
										<ul class="third">
											<li><a
												href="${pageContext.request.contextPath}/support/noticeList.su">공지사항</a></li>
												<li><a
												href="${pageContext.request.contextPath}/support/questionList.su">질문게시판</a></li>
											<li><a
												href="${pageContext.request.contextPath}/manager/mnGymList.mn">체육관
													조회</a></li>
											<li><a
												href="${pageContext.request.contextPath}/manager/mnMemberList.mn">회원
													조회</a></li>
										</ul></li>
								</c:when>
								<c:when test="${loginMember.userType eq 'coach'}">
									<li><a
										href="${pageContext.request.contextPath}/gym/gymMainPage.gym?userId=${loginMember.userId}">관장</a>
										<ul class="third">
											<li><a
												href="${pageContext.request.contextPath}/gym/gymForm.gym?userId=${loginMember.userId}">나의<br>
													체육관 정보
											</a></li>
											<li><a
												href="${pageContext.request.contextPath}/gym/gymCalendar.gym">일정
													관리</a></li>
										</ul></li>
								</c:when>
							</c:choose>
						</ul>
					</li>
				</c:if>
				<li id="side__side"><a class="subside"
					href="${pageContext.request.contextPath}/match/matchList.ma">매칭</a>
					<ul id="subside_list">
						<li id="subside__side"><a
							href="${pageContext.request.contextPath}/match/matchReg.ma">매치
								등록</a></li>
						<li id="subside__side"><a href="${pageContext.request.contextPath}/match/matchList.ma">매치 찾기</a></li>
					</ul></li>
				<li id="side__side"><a class="subside"
					href="${pageContext.request.contextPath}/ranking/rankingList.ra">랭킹</a></li>
				<li id="side__side"><a class="subside"
					href="${pageContext.request.contextPath}/support/support.su">빈체로</a>
					<ul id="subside_list">
						<li><a
							href="${pageContext.request.contextPath}/support/support.su">빈체로
								소개</a></li>
						<li><a
							href="${pageContext.request.contextPath}/support/rule.su">룰
								소개</a></li>
						<li><a
							href="${pageContext.request.contextPath}/gym/joinEnroll.gym">가맹
								신청</a></li>
					</ul></li>
				<li id="side__side"><a class="subside"
					href="${pageContext.request.contextPath}/support/noticeList.su">고객센터</a>
					<ul id="subside_list2">
						<li><a
							href="${pageContext.request.contextPath}/support/noticeList.su">공지사항</a></li>
						<li><a
							href="${pageContext.request.contextPath}/support/FAQ.su">자주묻는
								질문</a></li>
						<li><a
							href="${pageContext.request.contextPath}/support/questionList.su">질문
								게시판</a></li>
						<li><a
							href="${pageContext.request.contextPath}/support/publicEmergency.su">전국
								외상센터</a></li>
					</ul></li>
			</ul>
		</nav>
	</div>


	<script>
	let checkAlarmId;
	
	$(document).ready(function(){
	    checkAlarmId = setInterval(checkAlarmAjax, 5000); // 1초 간격으로 마지막 데이터 이후 입력 시	        
	}); 
	
	//새로운 알람 있는지 체크 있으면 이미지 변경
	function checkAlarmAjax(){
	    $.ajax({
	        url: "${pageContext.request.contextPath}/alarm/checkAlarm.al",
	        type: "POST",
	        cache: false,
	        async: false,
	        success: function(data){
	            if(0 < data) {
	            	console.log(data);
	                $("#alarm").attr("src", "${pageContext.request.contextPath}/resources/img/alarm_up.png");
	            } else {
	            	console.log("새로 들어온 값이 없어");
	            }
	        },
	        error : function(xhr, status, error) {
				clearInterval(checkAlarmId);
				alert(status);
				console.log(status);
			}
	    });
	}
	
	var alarmList = [];
	
	//데이터 읽어와서 팝업창에 뿌려주기
	function readAlarmAjax() {
		$("#header_pop_up").html("");
	    $.ajax({
	        url: "${pageContext.request.contextPath}/alarm/read.al",
	        method: "POST",
	        dataType: "json",
	        contentType: "application/json",
	        cache: false,
	        async: false,
	        success: function(data) {
	        	console.log(data);
	        	console.log(data[0].alarmMsg);
	        	console.log(data.length);
	        	
		        for(let i=0; i<data.length; i++) {     
		        	if(data[i].readYn == 'N') {
			        	var alarm = {};
			        	
			        	alarm.alarmNo = data[i].alarmNo;
			        	alarmList.push(alarm);		        		
		        	}
		        	
					let content = $("#header_pop_up").html();
		        	//console.log(content);									
						content += "<tr>"
								+ 	"<td>" + data[i].alarmTime + "</td>"
								+   "<td>" + data[i].alarmMsg + "</td>";
							if(data[i].alarmStatus == 0) {
						content	+= 	"<td>"
								+	"</td>";
							} else if(data[i].alarmStatus == 1) {
						content	+= 	"<td>"
								+		"<button type='button' style='align:right;' onclick='pay(`"+ data[i].no +"`);'>결제</button>"
								+	"</td>"	;
							} else if(data[i].alarmStatus == 2) {						
						content	+= 	"<td>"
								+		"<button type='button' style='align:right;' onclick='accept(`"+ data[i].no +"`);'>수락</button>"
								+		"<button type='button' style='align:right;' onclick='reject(`"+ data[i].no +"`);'>거절</button>"
								+	"</td>"		;					
							}
						content	+=  "</tr>";
					//console.log("content에 있는 내용 : " + content);
					$("#header_pop_up").html(content);
					//document.getElementById("pop-up").value = content;
	        	}
	        	console.log("아아");
	        	console.log(alarmList);
	        },
	        error : function(xhr, status, error) {
				clearInterval();
				//alert();
				console.log(status);
			}
	    });
	}
	
	//팝업창 열기
	function popOpen() {
		var modalPopTitle = $('.modal-wrap-title');
		var modalPop = $('.modal-wrap');
		var modalBg = $('.modal-bg');
		
		$(modalPopTitle).show();
		$(modalPop).show();
		$(modalBg).show();
		readAlarmAjax();
		//window.open('${pageContext.request.contextPath}/alarm/readAlarm.al','win0','width=500,height=300,status=no,toolbar=0,scrollbars=yes,location=0,titlebar=0');
	}
	
	//팝업창 닫기 누르면 이미지 다시 바뀜
	function popClose() {	
		var modalPopTitle = $('.modal-wrap-title');	
		var modalPop = $('.modal-wrap');
		var modalBg = $('.modal-bg');

		$(modalPopTitle).hide();
	    $(modalPop).hide();
	    $(modalBg).hide();
		$("#alarm").attr("src", "${pageContext.request.contextPath}/resources/img/alarm.png");
		$("#header_pop_up").html("");	  
		
		console.log("popClose() : " + JSON.stringify(alarmList));
		readYnUpdate();
	}	
	
	//닫기 누르면 readYn=Y로 바꿔주고, 팝업창 비워주기
	function readYnUpdate() {
		$.ajax({
			url: "${pageContext.request.contextPath}/alarm/readYnUpdate.al",
			type: "post",
			data:  JSON.stringify(alarmList),
			dataType: "JSON",
	        contentType : "application/json",
			success : function(data, status, xhr) {
				console.log(data.result);
				alarmList = [];
			},
			error : function(xhr, status, error) {
				alert(status);
			}
		});
	}
	
	//수락 버튼
	function accept(no) {		
		console.log(no);
		var accept = {};
		accept.no = no;

		$.ajax({
			url: "${pageContext.request.contextPath}/alarm/acceptMatch.al",
			type: "post",
			data: JSON.stringify(accept),
			dataType: "JSON",
	        contentType : "application/json",
			success : function(data, status, xhr) {
				console.log(data.result);
				alert(data.msg);
				readAlarmAjax();
			},
			error : function(xhr, status, error) {
				alert(status);
			}
		});			
	}
	
	//거절 버튼
	function reject(no) {
		var reject = {};
		reject.no = no;

		$.ajax({
			url: "${pageContext.request.contextPath}/alarm/rejectMatch.al",
			type: "post",
			data: JSON.stringify(reject),
			dataType: "JSON",
	        contentType : "application/json",
			success : function(data, status, xhr) {
				console.log(data.result);
				alert(data.msg);
				readAlarmAjax();
			},
			error : function(xhr, status, error) {
				alert(status);
			}
		});			
	}
	
	//결제 버튼
	function pay(no) {
		var pay = {};
		pay.no = no;
		
		$.ajax({
			url: "${pageContext.request.contextPath}/match/payment.ma",
			type: "POST",
			data: JSON.stringify(pay),
			dataType: "JSON",
	        contentType : "application/json",
			success : function(data, status, xhr) {
				console.log(data.result);
				console.log(data.no);
				
				if(data.result === 'PAY_OK') {
					alert(data.msg);
				} else {
		    		window.open("${pageContext.request.contextPath}/match/payment.ma?no="+data.no, "_blank", "width=800px, height=600px top=50px left=200px");					
				}
			},
			error : function(xhr, status, error) {
				alert(status);
			}
		});
    }     

    var modal = document.getElementById("paymentModal");

    function openModal() {
        modal.style.display = "block";
        document.addEventListener("click", closeModalOutside);
    }

    function closeModalOutside(event) {
        if (event.target === modal) {
            modal.style.display = "none";
            document.removeEventListener("click", closeModalOutside);
        }
    }

</script>