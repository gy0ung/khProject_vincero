<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/footer.css?v=<%=System.currentTimeMillis()%>">

<script>
    window.addEventListener('scroll', function() {
        var scrollUp = document.getElementById('scrollUp');
        if (window.pageYOffset > 100) {
            scrollUp.style.display = 'block';
        } else {
            scrollUp.style.display = 'none';
        }
    });

    var scrollUpBtn = document.getElementById('scrollUp');
    scrollUpBtn.addEventListener('click', function() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
</script>

</body>

   <footer>
      <p id="a">
        상호명 : 빈체로<br>
        대표자 : 김정민<br>
        개인정보관리책임자 : 방승환<br>
        상담전화 : 02-1234-1234<br>
        이메일주소 : contact@vincero.com <br>
        사업자번호 : 789-81-77777
       </p>
       <ul id="f">
           <li><a href="${pageContext.request.contextPath}/support/legalNotice.su">법적고지</a></li>
           <li><a href="${pageContext.request.contextPath}/support/privacyStatement.su">이용약관</a></li>
           <li><a href="${pageContext.request.contextPath}/support/privacyPolicy.su">개인정보처리방침</a></li>
       </ul>    
       <ul class="sns">
           <li><a href="https://www.instagram.com/vincero2023/">인스타그램</a></li>
         <li><a href="https://www.youtube.com/channel/UCV61-dCRehTcS8lduckYrxw">유튜브</a></li>
       </ul>
       <a href="javascript:scrollTo(0, 0);" id="scrollUp"><img src="${pageContext.request.contextPath}/resources/img/scrollUp1.png" width="35px"></a>
   </footer>


</html>