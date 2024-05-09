<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<style>
body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #f1f1f1;
}

.container {
    text-align: center;
}

h2 {
    margin-bottom: 20px;
}

form {
    display: flex;
    justify-content: center;
}

.button {
    padding: 10px 20px;
    background-color: #c8220f;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-right: 10px;
    transition: background-color 0.3s;
}

.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 300px;
    text-align: center;
}

.button-row {
    margin-top: 20px;
}

.button-row button {
    margin-right: 10px;
}
</style>
<body>
    <div class="container">
        <h2>결제 페이지</h2>
        <form>
            <input type="button" onclick="openModal()" value="등록" class="button">
        </form>
         <!-- 모달 창 -->
    <div id="paymentModal" class="modal">
        <div class="modal-content" style="width:200px; importent;">
            <h3>결제 방법 선택</h3>
            <div class="button-row">
                <button onclick="location.href='${pageContext.request.contextPath}/member/p_bank.py'" class="button">계좌이체</button>
                <button onclick="location.href='${pageContext.request.contextPath}/member/p_mobile.py'" class="button">휴대폰결제</button>
            </div>
        </div>
    </div>


<script>
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
    
    /*
    
   	
<a href="#" class="btn" onclick="showPaymentPopup('현금')">현금결제</a>&emsp;
 
        <a href="#" class="btn" onclick="showPaymentPopup('카드')">카드결제</a>&emsp;
        
        
function showPaymentPopup(paymentType) {
var popup = document.getElementById("paymentPopup");
var message = document.getElementById("paymentMessage");

if (paymentType === "카드") {
    message.innerText = "카드를 삽입하세요.";
} else if (paymentType === "분할") {
    message.innerText = "분할 결제를 진행하세요.";
} else {
    message.innerText = "현금으로 " + document.getElementById("totalAmount").innerText + " 받으세요.";
}

popup.style.display = "block";


setTimeout(function() {
    popup.style.display = "none";


var paymentCompletePopup = document.createElement("div");
paymentCompletePopup.style.display = "none";
paymentCompletePopup.style.position = "fixed";
paymentCompletePopup.style.top = "50%";
paymentCompletePopup.style.left = "50%";
paymentCompletePopup.style.transform = "translate(-50%, -50%)";
paymentCompletePopup.style.backgroundColor = "#fff";
 paymentCompletePopup.style.padding = "20px";
 paymentCompletePopup.style.borderRadius = "5px";
 paymentCompletePopup.style.boxShadow = "0 0 10px rgba(0, 0, 0, 0.2)";
 paymentCompletePopup.innerHTML = "<p>결제가 완료되었습니다.</p>";

 document.body.appendChild(paymentCompletePopup);

 paymentCompletePopup.style.display = "block";

 setTimeout(function() {
     paymentCompletePopup.style.display = "none";
 }, 5000);
 }, 5000);
    }

    function closePaymentPopup() {
        document.getElementById("paymentPopup").style.display = "none";
    }
 */
</script>

</body>
</html>
