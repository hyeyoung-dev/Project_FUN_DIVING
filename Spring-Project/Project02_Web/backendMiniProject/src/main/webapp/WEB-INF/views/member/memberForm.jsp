<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.container{
		width:700px;
		margin:0;
		padding:0;
	}
	#mFrm li{
		float:left;
		height:60px;
		line-height:50px;
		width:20%;
		border-bottom:1px solid #ddd;		
	}
	
	#mFrm li:nth-child(2n){
		width:80%;
	}
	
	#mFrm li:last-of-type{
		width:100%;
	}
	#idchk{
		width: 50px;
		border-radius:50%;	
		text-align:center;
	}
	input[type=button]{
		
	}
</style>
<script src="/myapp/js/member.js"></script>
<script>
	$(function(){
		// 아이디 중복검사
		$("#userid").keyup(function(){
			var userid = $("#userid").val();
			if(userid !='' && userid.length>=6){
				var url = "/myapp/member/memberIdCheck"
				$.ajax({
					url : url,
					data : "userid="+userid,
					type:"POST",
					success:function(result){
						if(result>0){ //사용불가하다 
							$("#chk").html("존재하는 아이디입니다.");
							$("#idchk").val("N");
							$("#chk").css("color","red");
						}else{ // 사용가능하다
							$("#chk").html("사용가능합니다.");
							$("#idchk").val("Y");
							$("#chk").css("color","blue");
						}
					}
				});
			}else{ // 사용불가하다.
				$("#chk").html("사용불가능합니다.");
				$("#idchk").val("N");
				$("#chk").css("color","red");
			}
		});
	});
</script>
<div class="container">
	<form method="post" action="/myapp/member/memberOk" id="mFrm" onsubmit="return memberCheck()">
		<ul>
			<li>아이디</li>
			<li><input type="text" name="userid" id="userid" placeholder="아이디 입력"/>
				<input type="button" id="check"value="아이디중복확인"/>
				<span id='chk'></span>
				<input type="text" id="idchk" value='N'/>
			</li>
			<li>비밀번호</li>
			<li><input type="password" name="userpwd" id="userpwd" placeholder="비밀번호 입력"/></li>
			<li>비밀번호 확인</li>
			<li><input type="password" name="userpwd2" id="userpwd2" placeholder="비밀번호확인 입력"/></li>
			<li>이름</li>	
			<li><input type="text" name="username" id="username"/></li>	
			<li>연락처</li>
			<li>
				<select name="tel1">
					<option value="010">010</option>
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="041">041</option>
				</select> -
				<input type="text" name="tel2" id="tel2" maxlength="4"/> -
				<input type="text" name="tel3" id="tel3" maxlength="4"/>
			</li>
			<li>이메일</li>
			<li><input type="text" name="email" id="email"/>
			<li><input type="submit" value="가입하기"/></li>
		</ul>
	</form>
</div>