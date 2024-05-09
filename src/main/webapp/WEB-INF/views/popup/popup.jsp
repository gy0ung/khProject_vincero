<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/popup.css">

	<div class="layerPopup" id="layer_popup" style="visibility: visible;">
		<div class="layerBox">
			<div class="popupTop">
				<h4 class="title">VINCERO EVENT</h4>
				<button type="button" id="close" onclick="closePop();">x</button>
			</div>
			<div class="cont">
				<img
					src="${pageContext.request.contextPath}/resources/img/popup/trophy.png"
					width=350 height=500 usemap="#popup" alt="event page">
			</div>
		</div>
	</div>

	<script>
		function closePop() {
			document.getElementById("layer_popup").style.visibility = "hidden";
		}
	</script>