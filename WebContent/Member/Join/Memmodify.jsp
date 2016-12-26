<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/assets/bootstrap-3.3.2/css/bootstrap.min.css"
	rel="stylesheet">


<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="/assets/bootstrap-3.3.2/js/bootstrap.min.js"></script>



<title>회원가입 화면</title>
<script type="text/javascript">
	// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	/* 		function checkValue()
	 {
	 if(!document.userInfo.id.value){
	 alert("아이디를 입력하세요.");
	 return false;
	 }
	
	 if(!document.userInfo.password.value){
	 alert("비밀번호를 입력하세요.");
	 return false;
	 }
	
	 // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
	 if(document.userInfo.password.value != document.userInfo.passwordcheck.value ){
	 alert("비밀번호를 동일하게 입력하세요.");
	 return false;
	 }
	 } */

	// 취소 버튼 클릭시 첫화면으로 이동
	function goFirstForm() {
		location.href = "MainForm.do";
	}
</script>

</head>
<body>


	<div class="container" style="margin-top: 100px">


		<div class="col-md-12">
			<div class="page-header">
				<h1>
					회원정보수정 <small>horizontal form</small>
				</h1>
			</div>
			<form class="form-horizontal" method="post" action="/memModify_action.mem" >
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputNumberCheck">학번</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input class="form-control" id="haknum" name="haknum" type="text"
								placeholder="중복체크" value="${boarddata.haknum}" readonly> <span class="input-group-btn">
								<button class="btn btn-success" type="button">
									인증번호 확인<i class="fa fa-edit spaceLeft"></i>
								</button>
							</span>
						</div>
						<p class="help-block">중복 체크를 해주세요.</p>
					</div>
				</div>
			
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="password" name="password" 
							type="password"
							placeholder="비밀번호">
						<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호
						확인</label>
					<div class="col-sm-6">
						<input class="form-control" id="passwordcheck" name="passwordcheck"
							type="password" placeholder="비밀번호 확인">
						<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputName">이름</label>
					<div class="col-sm-6">
						<input class="form-control" id="name" name="name" type="text"
							placeholder="이름" value="${boarddata.name}">
					</div>
				</div>				
				
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputName">학과</label>
					<div class="col-sm-6">
						<select class="form-control" id="major" name="major" type="text"
							placeholder="학과">
						  <option value="병원경영학과" >병원경영학과</option>
						  <option value="컴퓨터공학과" >컴퓨터공학과</option>
						  <option value="항공서비스과" >항공서비스과</option>
						  <option value="정치언론학과" >정치언론학과</option>
						  <option value="무용학과" >무용학과</option>
						</select>							
							
					</div>
				</div>					

				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputName">주소</label>
					<div class="col-sm-6">
						<input class="form-control" id="Address" name="address" type="text"
							placeholder="주소" value="${boarddata.address}">
					</div>
				</div>	
				
				
				
				<div class="form-group">
					<label class="col-sm-3 control-label" for="mail">이메일</label>
					<div class="col-sm-6">
						<input class="form-control" id="mail" name="mail" type="email"
							placeholder="이메일" value="${boarddata.mail}">							
					</div>		
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputName">핸드폰번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="call_num" name="call_num" type="text"
							placeholder="핸드폰번호" value="${boarddata.call_num}">
					</div>
				</div>	
								
								
<!-- 				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input type="tel" class="form-control" id="inputNumber"
								placeholder="- 없이 입력해 주세요" /> <span class="input-group-btn">
								<button class="btn btn-success">
									인증번호 전송<i class="fa fa-mail-forward spaceLeft"></i>
								</button>
							</span>
						</div>
					</div>
				</div> -->
				
				<!-- <div class="form-group">
					<label class="col-sm-3 control-label" for="inputNumberCheck">인증번호
						확인</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input class="form-control" id="inputNumberCheck" type="text"
								placeholder="인증번호"> <span class="input-group-btn">
								<button class="btn btn-success" type="button">
									인증번호 확인<i class="fa fa-edit spaceLeft"></i>
								</button>
							</span>
						</div>
						<p class="help-block">전송된 인증번호를 입력해주세요.</p>
					</div>
				</div> -->

				<!-- 이용약관 -->
				<!--           <div class="form-group">
              <label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
            <div class="col-sm-6" data-toggle="buttons">
              <label class="btn btn-warning active">
                <input id="agree" type="checkbox" autocomplete="off" chacked>
                  <span class="fa fa-check"></span>
              </label>
              <a href="#">이용약관</a> 에 동의 합니다.
            </div>
          </div> -->


				<div class="form-group">
					<div class="col-sm-12 text-center">
						<button class="btn btn-primary" type="submit">
							수정하기<i class="fa fa-check spaceLeft"></i>
						</button>
						<button class="btn btn-danger" onClick="history.go(-1)">
							취소<i class="fa fa-times spaceLeft"></i>
						</button>
					</div>
				</div>
			</form>
			<hr>
		</div>
	</div>
</body>
</html>