$(function(){

	//휴대폰 번호 인증var code2 = "";

	$("#phoneChk").click(function(){
	    alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
		var phone = $("#phone").val();
		$.ajax({
	        type:"GET",
	        url:"phoneCheck?phone=" + phone,
	        cache : false,
	        success:function(data){
	        	if(data == "error"){
	        		alert("휴대폰 번호가 올바르지 않습니다.")
					$(".successPhoneChk").text("유효한 번호를 입력해주세요.");
					$("#phone").attr("autofocus",true);
	        	}else{	        		
	        		$("#phone2").attr("disabled",false);
	        		$("#phoneChk2").css("display","inline-block");
	        		$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
	        		$("#phone").attr("readonly",true);
	        		code2 = data;
	        	}
	        }
	 	});
	 });
	 
	$("#phoneChk2").click(function(){
		if($("#phone2").val() == code2){
			$(".successPhoneChk").text("인증번호가 일치합니다.");
			$("#phoneDoubleChk").val("true");
			$("#phone2").attr("disabled",true);
		}else{
			$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$("#phoneDoubleChk").val("false");
			$(this).attr("autofocus",true);
		}
	});


	  

	});
	function deleteMember() {
		if(window.confirm("탈퇴하시겠습니까?")){
		location.href="${pageContext.request.contextPath}/member/deleteMember.me";
		}
		
	}
	function nice() {
		  alert("회원가입을 축하합니다!");
		}
	function nextBlank(N, Obj, nextB) {
	   if(document.getElementById(Obj).value.length == N) {
	      document.getElementById(nextB).focus();
	   }
	}

	function findAddr() {
	    new daum.Postcode({
	        oncomplete: function (data) {
	            let roadAddr = data.roadAddress;
	            let jibunAddr = data.jibunAddress;
	            let extraAddr = '';

	            document.getElementById("postcode").value = data.zonecode;

	            if (data.userSelectedType == 'R') {
	                if (roadAddr != '') {
	                    if (data.bname != '') {
	                        extraAddr += data.bname;
	                    }
	                    if (data.buildingName != '') {
	                        extraAddr += extraAddr != '' ? ', ' + data.buildingName : data.buildingName;
	                    }
	                    roadAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';
	                    document.getElementById("addr").value = roadAddr;
	                }
	            } else if (data.userSelectedType == 'J') {
	                document.getElementById("addr").value = jibunAddr;
	            }

	            document.getElementById("detailAddr").focus();
	        }
	    }).open();
	}

	let idCheck = false;
	let pwCheck = false;
	let pwcCheck = false;
	let nameCheck = false;
	let emailCheck = false;
	let rnnCheck1 = false;
	let rnnCheck2 = false;
	let rnnCheck = false;
	let phoneCheck = false;

	

	function idChecka() {
	  $.ajax({
	       url: "/spring/member/id.ch",
	       type: "get",
	       data : {ida : $("#userId").val()},
	       dataType : "json",
	      
	           success(result) {
	                 console.log(result);
	           
	           const {userId, available} = result;
	           console.log(result);
	           
	           if(available) {
	              
	              $("#messageId").text("멋진 아이디네요 !");
	              document.getElementById("idc").addEventListener("focusout", () => {
	                  const inputId = document.getElementById("userId").value;
	                  let messageId = document.getElementById("messageId");
	                  const regExp1 = /^[a-zA-Z][a-zA-Z0-9]{5,12}$/;

	                  if (regExp1.test(inputId)) {
	                      idCheck = true;
	                  } else if (inputId === " ") {
	                      messageId.innerHTML = "필수 정보입니다.";
	                      idCheck = false;
	                  } else {
	                      messageId.innerHTML = "첫글자는 반드시 영문자이며, 숫자 포함 총 6~13자로 입력하시오.";
	                      idCheck = false;
	                  }
	              })

	              iddCheck = true;
	              
	              $("#idbtncheck").val("idCheck");
	           } else {
	              $("#messageId").text("이미 사용중이거나 탈퇴한 아이디입니다");
	              iddCheck = false;
	              $("#idbtncheck").val("idUncheck");
	           }

	        },
	        error : console.log
	   });
	}

	function updateEmAddress() {
	 var emselect = document.getElementById("emselect");
	 var emadress = document.getElementById("emadress");

	 if (emselect.value === "") {
	   // 선택한 값이 "직접입력"일 경우 emadress 입력란을 비웁니다.
	   emadress.value = "";
	   emadress.disabled = false; // 필요에 따라 입력란을 활성화할 수도 있습니다.
	 } else {
	   // 선택한 값이 이메일 도메인일 경우 emadress 입력란을 해당 값으로 설정합니다.
	   emadress.value = emselect.value;
	   emadress.disabled = true; // 필요에 따라 입력란을 비활성화할 수도 있습니다.
	 }
	}

	function inputIdChk() {
	regFrm.idbtncheck.value = "idUncheck";
	}

	
	function inputCheck() {
	let inputAgain = [];
	if (idCheck && pwCheck && pwcCheck && nameCheck && mailCheck && phoneCheck && iddCheck && birthCheck) {
	    console.log("회원가입을 축하드립니다");
	    regFrm.submit();
	} else {
	    if (idCheck === false) {
	        inputAgain.push("아이디");
	        $("#userId").val("");
	        messageId.innerHTML = "";
	    }
	    if (pwCheck === false) {
	        inputAgain.push("비밀번호");
	    }
	    if (pwcCheck === false) {
	        inputAgain.push("비밀번호검토");
	        
	    }
	    if (nameCheck === false) {
	        inputAgain.push("이름");
	        $("#userName").val("");
	        messageName.innerHTML = "";
	    }
	    if (mailCheck === false) {
	        inputAgain.push("이메일");
	        $("#userEmail").val("");
	        messageMail.innerHTML = "";
	    }
	    if (birthCheck === false) {
	       inputAgain.push("생년월일");
	       $("#userRnn").val("");
	       messageBirth.innerHTML = "";
	    }
	    if (phoneCheck === false) {
	        inputAgain.push("전화번호");
	        $("#phone").val("");
	        messagePhone.innerHTML = "";
	    }
	    if (regFrm.idbtncheck.value != "idCheck") {
	       inputAgain.push("아이디중복체크");
	       messageId.innerHTML = "";
	       $("#userId").val("");
	    }
	    alert(inputAgain + "를 확인하세요.");
	    
	    $("#userPw").val("");
	    $("#pwc").val("");
	    messagePw.innerHTML = "";
	    messagePwc.innerHTML = "";
	}


	}
