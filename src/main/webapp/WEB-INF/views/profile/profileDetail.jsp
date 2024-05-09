<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문서</title>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/profileEnroll.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

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

<session id="profileDetail" width="1200px;">
   <div class="profileEnT" align="center">
      <form
         action="${pageContext.request.contextPath}/profile/profileUpdate.pr"
         method="post" name="proInfofrm" enctype="multipart/form-data">
         <h1>프로필 수정</h1><br><br>
         <table border="1" class="table1">
            <tr>
               <th rowspan="4" scope="col" width="200px;">
                  <div class="profile_photo">
                     <img id="imgThumb"
                        src="${pageContext.request.contextPath}/resources/upload/profile/${profileMember.changeFilename}?type=s160"
                        >
                  </div>
               </th>
               <th colspan="2">닉네임</th>
               <td colspan="3"><input type="hidden" id="userId" name="userId"
                  value="${profileMember.userId}" readonly> <input
                  type="text" id="proNick" name="proNick"
                  value="${profileMember.proNick}" readonly
                  style="background-color: #eeeeee; color: gray;"> <!--    <input type="button" id="nickc" value="중복확인" onclick="nickCheck();"> -->
               </td>
            </tr>
            <tr>
               <th colspan="2">주종목</th>
               <td scope="col"  colspan="3"><input type="text" id="proMajor"
                  name="proMajor" value="${profileMember.proMajor}" readonly
                  style="background-color: #eeeeee; color: gray; width:250px;" ></td>
            </tr>
            <tr>
               <th colspan="2"><label for="level">급수</label></th>
               <td scope="col"  colspan="3"><input type="text" id="proLevel"
                  name="proLevel" value="${profileMember.proLevel}"></td>
            </tr>
            <tr>

               <th colspan="2">전적</th>
               <td colspan="3"><input type="text" id="win" name="win" value="${ranking.winCount}" 
                  disabled>&emsp;승&emsp;<input type="text"
                  id="lose" name="lose" value="${ranking.loseCount}" disabled>&emsp;패</td>
            </tr>
            <tr>
            <th scope="col">
                  <div>
                     <span class="btn_file"> 
                        <div id="filepointer">
                        <input type="file" id="file" name="upFile" type="hidden">
                           <label for="file">클릭하여 사진수정</label>
                        </div>
                     </span>
                  </div>
               </th>
         
               <th colspan="2">키 / 몸무게</th>
               <td colspan="3"><input type="text" id="height"
                  name="proHeight"  value="${profileMember.proHeight}" required> &ensp;cm&ensp; <input
                  type="text" id="weight" name="proWeight"  value="${profileMember.proWeight}" required>&ensp;
                  kg</td>

            </tr>
            <tr>
               <th colspan="5">개인대회</th>
            </tr>
            <tr>
               <td colspan="5"><textarea class="textarea" name="personal"
                     cols="35" rows="10">${profileMember.personal}</textarea></td>
            </tr>
            <tr>
               <th colspan="5">건강상태</th>
            </tr>
            <tr>
               <td colspan="5"><textarea class="textarea" name="note"
                     cols="35" rows="10">${profileMember.note}</textarea></td>
            </tr>
      
   </table>
         <div class="btn" align="center">
                  <button type="submit">수정</button>
                  <button type="reset">원래대로</button>
            </div>
      </form>
   </div>
   </session>
</body>
<script type="text/javascript">

function upFile2() {
     const fileInput = document.getElementById("file");
     if (fileInput.files.length === null) {
       fileInput.val() = ${profileMember.originalFilename};
      console.log(${profileMember.originalFilename});
     }
     proInfofrm.submit();
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