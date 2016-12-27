<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>


	$(document).ready(function(){
		/* haknum password passwordcheck name Address email call_num */
/* 	    $('#haknum').blur( function(){
			hakCheck();   	
	    }); */
	    $('#haknum').keyup( function(){
			hakCheck();   	
	    });
	    $('#haknumCheck').click(function(){
	    	hakCheck();
	    })
		
	    $('#password').keyup( function(){
			pass1Check();   	
	    });
	    $('#passwordcheck').keyup( function(){
			pass2Check();   	
	    });	    
	    
	    $('#name').keyup( function(){
	    	nameCheck();   	
	    });	 
	    
	    $('#email').keyup( function(){
	    	emailCheck();   	
	    });	 	    

	    $('#call_num').keyup( function(){
	    	call_numCheck();   	
	    });	 	    
/* 	   	$('#haknumText').attr('class','text-danger')
        $('#haknumText').html( '실패 ' );
    	
    	$('#haknumText').attr('class','text-success')
        $('#haknumText').html( '성공 ' );	 */ 
        
/* 		$("#btn_join").click(function() {
			
			
		} */
	})

 	function hakCheck(){
    	var regHaknum = /^[0-9]*$/;
    	
    	if($('#haknum').val() ==""){
	    	$('#haknumText').attr('class','text-danger')
	        $('#haknumText').html( '학번을 입력해주세요. ' );	    		
    	}else if( !regHaknum.test( $('#haknum').val() ) ){
    		$('#haknumText').attr('class','text-danger')
	        $('#haknumText').html( '학번은 숫자로만 입력해주세요. ' );
    	}else if( $('#haknum').val().length != 8 ){
    		$('#haknumText').attr('class','text-danger')
	        $('#haknumText').html( '학번은 8자리 입니다. ' );
    	}else {
	    	$('#haknumText').attr('class','text-success')
	        $('#haknumText').html( '올바른 학번입니다.' );	
    	}
	}
 	function pass1Check(){
 		var regPass = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
    	
    	if($('#password').val() ==""){
	    	$('#pass1Text').attr('class','text-danger')
	        $('#pass1Text').html( '비밀번호를 입력해주세요. ' );	    		
    	}else if( !regPass.test( $('#password').val() ) ){
    		$('#pass1Text').attr('class','text-danger')
	        $('#pass1Text').html( '영문,숫자 포함 8자 이상 20자 이하로 입력해주세요. ' );
    	}else {
	    	$('#pass1Text').attr('class','text-success')
	        $('#pass1Text').html( '사용가능한 비밀번호입니다.' );	
    	}
	}
 	function pass2Check(){
 		
    	
    	if($('#password').val() != $('#passwordcheck').val()){
	    	$('#pass2Text').attr('class','text-danger')
	        $('#pass2Text').html( '비밀번호를 확인해주세요.' );	    		
    	}else {
	    	$('#pass2Text').attr('class','text-success')
	        $('#pass2Text').html( '비밀번호 일치입니다.' );	
    	}
	}
 
  	function nameCheck(){
 		var regName = /^[가-힝]{2,24}$/;
    	
    	if($('#name').val() ==""){
	    	$('#nameText').attr('class','text-danger')
	        $('#nameText').html( '이름을 입력해주세요. ' );	    		
    	}else if( !regName.test( $('#name').val() ) ){
    		$('#nameText').attr('class','text-danger')
	        $('#nameText').html( '한글만 2자 이상 입력해주세요.' );
    	}else {
	    	$('#nameText').attr('class','text-success')
	        $('#nameText').html( '사용가능한 이름입니다.' );	
    	}
	}
  	
  	function emailCheck(){
 		var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    	
    	if($('#email').val() ==""){
	    	$('#emailText').attr('class','text-danger')
	        $('#emailText').html( '이메일을 입력해주세요. ' );	    		
    	}else if( !regEmail.test( $('#email').val() ) ){
    		$('#emailText').attr('class','text-danger')
	        $('#emailText').html( '이메일 형식에 맞게 입력해주세요.' );
    	}else {
	    	$('#emailText').attr('class','text-success')
	        $('#emailText').html( '사용가능한 이메일입니다.' );	
    	}
	}  	
 
  	function call_numCheck(){
 		var regCall_num = /^[0-9]{11,11}$/;
    	
    	if($('#call_num').val() ==""){
	    	$('#call_numText').attr('class','text-danger')
	        $('#call_numText').html( '핸드폰번호를 입력해주세요. ' );	    		
    	}else if( !regCall_num.test( $('#call_num').val() ) ){
    		$('#call_numText').attr('class','text-danger')
	        $('#call_numText').html( '숫자로만 11자리로 입력해주세요.' );
    	}else {
	    	$('#call_numText').attr('class','text-success')
	        $('#call_numText').html( '사용가능한 핸드폰번호입니다.' );	
    	}
	} 
	
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
	<!-- 메뉴  -->
	<%@include file="/nav.jsp" %>



	<div class="container" style="margin-top: 100px">


		<div class="col-md-12">
			<div class="page-header">
				<h1>
					회원가입 <small></small>
				</h1>
			</div>
			<form class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputNumberCheck">학번</label>
					<div class="col-sm-6">
						<div class="input-group">
							<input class="form-control" id="haknum" name="haknum" type="text"
								placeholder="중복체크"> <span class="input-group-btn">
								<button class="btn btn-success" id="haknumCheck" type="button">
									중복확인<i class="fa fa-edit spaceLeft"></i>
								</button>
							</span>
						</div>
						<p class="text-muted" id="haknumText">숫자로 8글자</p>
					</div>
				</div>
			
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="password" name="password" 
							type="password"
							placeholder="비밀번호">
						<p class="text-muted" id="pass1Text">영문,숫자 포함 8자 이상 20자 이하</p>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호
						확인</label>
					<div class="col-sm-6">
						<input class="form-control" id="passwordcheck" name="passwordcheck"
							type="password" placeholder="비밀번호 확인">
						<p class="text-muted" id="pass2Text">비밀번호를 한번 더 입력해주세요.</p>
					</div>
				</div>
			
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputName">이름</label>
					<div class="col-sm-6">
						<input class="form-control" id="name" name="name" type="text"
							placeholder="이름">
						<p class="text-muted" id="nameText">한글만 2자이상</p>
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
						<input class="form-control" id="Address" name="Address" type="text"
							placeholder="주소">
					</div>
				</div>	
				
				
					
				<div class="form-group">
					<label class="col-sm-3 control-label" for="email">이메일</label>
					<div class="col-sm-6">
						<input class="form-control" id="email" name="email" type="text"
							placeholder="이메일">		
						<p class="text-muted" id="emailText">이메일 형식에 맞게 입력해주세요.</p>						
					</div>		
					
<!-- 					<div class="col-sm-3">
						<select class="form-control" id="email2" name="email2" type="text"
							placeholder="학과">
							<option value="naver.com">@naver.com</option>
							<option value="daum.net">@daum.net</option>
							<option value="gmail.com">@gmail.com</option>
							<option value="nate.com">@nate.com</option>								
						</select>									
					</div> -->
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputName">핸드폰번호</label>
					<div class="col-sm-6">
						<input class="form-control" id="call_num" name="call_num" type="text"
							placeholder="핸드폰번호">
						<p class="text-muted" id="call_numText">이메일 형식에 맞게 입력해주세요.</p>	
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
						<button class="btn btn-primary" id="btn_join" type="submit">
							회원가입<i class="fa fa-check spaceLeft"></i>
						</button>
						<button class="btn btn-danger" type="submit">
							가입취소<i class="fa fa-times spaceLeft"></i>
						</button>
					</div>
				</div>
			</form>
			<hr>
		</div>
	</div>
</body>
</html>