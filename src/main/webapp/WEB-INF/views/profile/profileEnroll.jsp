<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/profileEnroll.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="빈체로 - 프로필등록" name="title" />
</jsp:include>
<style>
/* 개별 스타일 */
#imgThumb {
   width: 180px;
   height: 230px;
}

}
#nickc {
   font-size: small;
   text-decoration: none;
}

.btn_file input[type="file"] {
   display: none;
}

/* 추가 스타일링 */
.table1 {
   border-collapse: collapse;
   width: 800px;
}

input[type="text"], input[type="file"] {
   padding: 10px;
   border: 1px solid #ccc;
   border-radius: 4px;
   outline: none;
   transition: border-color 0.3s;
   width: 120px;
}

.table1 th, .table1 td, .table2 th, .table2 td {
   border: 1px solid #ccc;
   padding: 10px;
}

.table1 th, .table2 th {
   background-color: #f2f2f2;
}

.textarea {
   width: 100%;
   height: 200px;
   resize: none;
}

input#proLevel {
   width: 250px;
}

input#height {
   width: 120px;
}

input#weight {
   width: 120px;
}

input#proNick {
   width: 250px;
}

#gymType {
   width: 250px;
   padding: 10px;
   border: 1px solid #ccc;
   border-radius: 4px;
   outline: none;
   transition: border-color 0.3s;
}

button[type="submit"], button[type="reset"], button[type="button"],
   input[type="button"] {
   padding: 10px 20px;
   background-color: #c8220f;
   color: #fff;
   border: none;
   border-radius: 4px;
   cursor: pointer;
   margin-top: 10px;
   transition: background-color 0.3s;
}

input#proMajor {
   width: 163px;
}

.btn{
   margin-bottom : 100px;
}
</style>

</head>

<body>
   <session id="profileEnroll" width="1200px;">
   <div class="profileEnT" align="center">
      <form
         action="${pageContext.request.contextPath}/profile/profileEnroll.pr"
         method="post" enctype="multipart/form-data" name="ok">
         <h1>프로필등록</h1>
         <br>
         <br>
         <br>
         <table border="1" class="table1">
            <tr>
               <th rowspan="4">
                  <div class="profile_photo">
                     <img id="imgThumb"
                        src="https://static.nid.naver.com/images/web/user/default.png?type=s160">
                  </div>
               </th>
               <th colspan="2">닉네임</th>
               <td colspan="3"><input type="text" id="proNick" name="proNick"
                  required>&emsp; <input type="button" id="nickc"
                  value="중복확인" onclick="checkNick();"></td>
            </tr>
            <tr>
               <th colspan="2">주종목</th>
               <td colspan="3"><select id="gymType" name="proMajor">
                     <option value="no">없음</option>
                     <option value="taek">태권도</option>
                     <option value="grap">잡기류 ex)유도, 주짓수</option>
                     <option value="striker">킥복싱류 ex)무에타이, 킥복싱</option>
                     <option value="box">복싱</option>
               </select></td>
            </tr>
            <tr>
               <th colspan="2"><label for="level">급수</label></th>
               <td colspan="3"><input type="text" id="proLevel"
                  name="proLevel" placeholder="ex) 3단, 블루벨트"></td>
            </tr>
            <tr>

               <th colspan="2">전적</th>
               <td colspan="3"><input type="text" id="win" name="win"
                  placeholder="0" disabled>&emsp;승&emsp;<input type="text"
                  id="lose" name="lose" placeholder="0" disabled>&emsp;패</td>
            </tr>

            <tr>
               <th>
                  <div>
                     <span class="btn_file">
                        <div id="filepointer">
                           <input type="file" id="file" name="upFile" type="hidden">
                           <label for="file">클릭하여 사진첨부</label>
                        </div>
                     </span>
                  </div>
               </th>
               <th colspan="2">키 / 몸무게</th>
               <td colspan="3"><input type="text" id="height"
                  name="proHeight" required> &ensp;cm&ensp; <input
                  type="text" id="weight" name="proWeight" required>&ensp;
                  kg</td>

            </tr>
            <tr>
               <th colspan="5">개인대회</th>
            </tr>
            <tr>
               <td colspan="5"><textarea class="textarea" name="personal"
                     cols="35" rows="10" placeholder="ex) 용인대 35회 우승"></textarea></td>
            </tr>
            <tr>
               <th colspan="5">건강상태</th>
            </tr>
            <tr>
               <td colspan="5"><textarea class="textarea" name="note"
                     cols="35" rows="10" placeholder="응급상황을 위해서 작성해주세요! ex) 어깨탈골, 기흉"></textarea></td>
            </tr>
            <tr>
               <th colspan="5">누적경고</th>
            </tr>
            <tr id="warn">
               <th width="25%">욕설</th>
               <td colspan="2" width="25%">0회</td>
               <th width="25%">지각</th>
               <td width="25%">0회</td>
            </tr>
            <tr>
               <th colspan="2" width="25%">룰 위반</th>
               <td width="25%">0회</td>
               <th width="25%">기타 비매너</th>
               <td width="25%">0회</td>
            </tr>

         </table>

         <input type="hidden" name="userId" value="${loginMember.userId}">
         <div class="btn" align="center">
            <input type="button" onclick="pass()" value="등록"> &emsp;
            <button type="reset">초기화</button>
         </div>
      </form>
   </div>

   </session>
</body>
<script type="text/javascript">

var isNickChecked = false; // 닉네임 중복 확인 여부를 체크하는 변수를 추가

function checkNick() {
    var nickValue = $("#proNick").val();

    if (!nickValue) {
        alert("닉네임을 입력해주세요.");
        return;
    }

    $("#nickc").prop("disabled", true); // 중복 확인 버튼 비활성화

    $.ajax({
        url: "${pageContext.request.contextPath}/profile/nick.ch",
        data: { proNick: nickValue },
        beforeSend: function() {
            // AJAX 요청을 보내기 전에 로딩 표시 등의 작업을 처리할 수 있습니다.
        },
        success: function(result) {
            const { proNick, available } = result;
            console.log("proNick" + proNick);
            console.log("available" + available);
            if (available) {
                alert("사용 가능한 닉네임입니다.");

                const inputNick = document.getElementById("proNick").value;
                const regExp1 = /^[a-zA-Z0-9가-힣]{2,12}$/;

                if (regExp1.test(inputNick)) {
                    isNickChecked = true;
                } else if (inputNick === " ") {
                    alert("필수 정보입니다.");
                    isNickChecked = false;
                }
            } else {
                alert("이미 사용 중인 닉네임입니다.");
                isNickChecked = false;
            }
        },
        error: function() {
            console.log("AJAX 요청 실패");
            // 오류 처리 로직 작성 또는 알맞은 조치를 취해야 함
        },
        complete: function() {
            $("#nickc").prop("disabled", false); // 중복 확인 버튼 다시 활성화
        }
    });
}

function pass() {
    if (isNickChecked) {
        document.ok.submit();
    } else {
        alert("닉네임 중복을 확인해주세요.");
    }
}

$("#file").change(function () {
    readURL(this);
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $("#imgThumb").attr("src", e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}
</script>

</html>