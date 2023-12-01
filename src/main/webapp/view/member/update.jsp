<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<%
	request.setCharacterEncoding("UTF-8");
	response.setHeader("cache-control","no-store");
	response.setHeader("expires","0");
	response.setHeader("pragma","no-cache");
%>



<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="Author" content="silverline">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>회원정보 수정</title>

	<link rel="stylesheet" href="../../css/carousel.css">
	<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">
	<link href="../../css/bootstrap.min.css" rel="stylesheet"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
	<link href="../../css/main.css" rel="stylesheet"/>
	<link href="../../css/nav.css" rel="stylesheet"/>
	<link rel="stylesheet" href="../css/toggle.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../../js/bootstrap.js"></script>
	<script src="../../js/sidebar.js"></script>
	<style>
		/* 사용자 정의 스타일 추가 */
		body {
			padding-top: 20px;
		}
		.form-group {
			max-width: 400px; /* 폼 요소의 최대 가로 크기 조정 */
			margin: 0 auto; /* 가운데 정렬을 위한 마진 설정 */
		}
		.btnZone {
			margin-top: 20px;
			text-align: center; /* 버튼을 가운데 정렬 */
		}

		.small-heading {
			font-size: 2rem; /* 원하는 크기로 설정 */
		}
	</style>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function execDaumPostcode() {
            daum.postcode.load(function () {
                new daum.Postcode({
                    oncomplete: function (data) {
                        var fullAddr = data.address; // 최종 주소 변수
                        var extraAddr = ''; // 조합형 주소 변수

                        // 기본 주소와 조합형 주소를 동일하게 설정
                        document.getElementById("addr").value = fullAddr;

                        // 기본 주소가 도로명 타입일 때 조합형 주소 설정
                        if (data.addressType === 'R') {
                            // 법정동명이 있을 경우 추가
                            if (data.bname !== '') {
                                extraAddr += data.bname;
                            }
                            // 건물명이 있을 경우 추가
                            if (data.buildingName !== '') {
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 조합형 주소를 추가
                            fullAddr += ' (' + extraAddr + ')';
                        }

                        // 주소 정보 입력 필드에 값 설정
                        document.getElementById("addr").value = fullAddr;
                    }
                }).open();
            });
        }

	function update() {
		var form = document.updateForm;



		if (!form.name.value) {
			alert("이름을 입력해주세요.");
			form.name.focus();
			return;
		}
		

		form.submit();
	}
</script>
</head>

<body>
<header>
	<jsp:include page="../common/top.jsp"></jsp:include>
</header>
	<div id="viewport">
		<!-- Content -->
		<div id="content">

			<div class="main_back">
				<div class="container">
					<form name="updateForm" method="post" action="${contextPath}/member/update.do">
						<div class="jumbotron">
							<h1 class="display-4 small-heading">회원정보 수정</h1>
							<hr class="my-4">
							<div class="form-group">
								<label for="userPW">비밀번호</label>
								<input type="password" class="form-control" id="userPW" name="userPW" maxlength="16">
								<small class="form-text text-muted">※ 8~16글자의 영어, 숫자 혼용</small>
							</div>
							<div class="form-group">
								<label for="userPW2">비밀번호 확인</label>
								<input type="password" class="form-control" id="userPW2" name="userPW2" maxlength="16">
							</div>
							<div class="form-group">
								<label for="name">이름</label>
								<input type="text" class="form-control" id="name" name="name" maxlength="6" value="${user.userName}">
							</div>
							<div class="form-group">
								<label for="tel">전화</label>
								<input type="text" class="form-control" id="tel" name="tel" maxlength="15" value="${user.userCp}">
							</div>
							<div class="form-group">
								<label for="email">이메일</label>
								<input type="text" class="form-control" id="email" name="email" maxlength="40" value="${user.userEmail}">
							</div>
							<div class="form-group">
								<label for="addr">주소</label>
								<div class="input-group">
									<input type="text" class="form-control" id="addr" name="addr" placeholder="주소" value="${user.userAddr}">
									<div class="input-group-append">
										<button type="button" class="btn btn-outline-secondary" onclick="execDaumPostcode()">주소 찾기</button>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="addr2">상세주소</label>
								<input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세주소" value="${user.userDaddr}">
							</div>
							<div class="btnZone">
								<button type="button" onclick="update();" class="btn btn-primary">수정하기</button>
								<button type="button" onclick="history.go(-1);" class="btn btn-secondary">뒤로</button>
							</div>
						</div>
					</form>
				</div>

				<!-- 부트스트랩 및 jQuery 스크립트 -->
				<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
				<script src="../../js/bootstrap.js"></script>
</body>
</html>