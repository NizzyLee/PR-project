<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login&Join</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- kakao -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- CSS -->
<link
	href="${pageContext.request.contextPath}/resources/css/PR_Login.css"
	rel="stylesheet" type="text/css" />
<!-- ajax -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- httpRequest -->
<script
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>


<script>
//login 시
	function login_Send(f) {

		let url = "login.do";
		let param = "email=" + f.email.value + "&pwd=" + f.pwd.value;
		sendRequest(url, param, resultFn, "POST");
	}

	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {

			//no_id, no_pwd, clear 중 하나를 받는다
			//data = [{'res':'no_id'}, {'id':'hong'}]
			var data = xhr.responseText;
			var json = eval(data);
			alert(data);
			if (json[0].res == 'no_email') {
				alert("아이디가 없습니다");
			} else if (json[0].res == 'no_pwd') {
				alert("비밀번호 불일치");
			} else {
				//alert('${user.id}');
				location.href = "main.do?mid=" + json[1].id;

			}
		}
	}
	
	//회원가입시 email check
	function email_check(f) {
		
		if(f.email.value != ""){
		let url = "email_check.do";
		
		let param = "email="+f.email.value;

		sendRequest(url, param, resultFn1, "POST");
		}
		else{
			
			alert("email을 입력해주세요");
			
		}
		
	}

	function resultFn1() {
		
		if ( xhr.readyState == 4 && xhr.status == 200 ) {
				
			let data = xhr.responseText;
			
			if( data == "no" ) {
				alert("중복된 email 입니다.");
			} else if( data == "yes")  {
				alert("사용가능한 email 입니다.");
				document.getElementById("emco").style.borderColor="red";
				is_id = true;
			} else{
				alert("email를 입력하세요.");
				return;
			}
		}
	}
	function SignUp_send(f) {

		let pwd = f.pwd.value;
		let name = f.name.value;
		let email = f.email.value;
		let phone = f.phone.value;
		//유효성 체크 

		let pwdcheck = /^[A-Za-z0-9]{4,10}$/; //영문과 숫자로 이루어진 4자리에서 10자리의 비밀번호
		let emailcheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		

		if (!pwdcheck.test(f.pwd.value)) {
			alert("비밀번호 형식을 확인하세요");
			return false;
		}

		if (!emailcheck.test(f.email.value)) {
			alert("정확한 이메일을 입력해주세요");
			return false;
		}
	

		f.action = "PRinsert.do";
		f.method = "post";
		f.submit();
	}
	
	//휴대폰 번호 인증

	function auth(f) {
	   
	   var phone = f.phone.value.trim();

	   var check2 = false;
	   var url = "phoneAuth.do";
	   var param = "phone=" + phone;

	   sendRequest(url, param, resultFunc1, "post");

	}

	function resultFunc1() {

	   if (xhr.readyState == 4 && xhr.status == 200) {
	      //컨트롤러에서 삭제후 return해준 데이터를 받는다. 
	      var data = xhr.responseText;
	  
	      if (data == "error") {
	         alert("유효한 번호를 입력해주세요");

	      }else if ( data == "yes_tel"){
	         
	         alert("중복된 전화번호 입니다.")

	            return;
	            
	         } else {
	             alert("인증번호를 전송했습니다.");
	         }
	     
	         const btn = document.querySelector('#code_btn')
	         btn.disabled = false;
	         
	         document.getElementById('input_tel').readOnly = true;
	         
	         code2 = data;
	      }
	   }

	//휴대폰 인증번호 대조

	function codenumcheck(f) {
	   
	   let codenum = f.code.value.trim();
	   
	   
	   if(codenum == code2){
	      
	      alert("일치하는 인증번호 입니다."); 
	      check2 = true;
	      
	   }else{
	      alert("인증번호가 일치하지 않습니다.")
	      check2 = false;
	   }
	}
	
	//카카오 정보받아오기
	window.onload = function(){
		//alert('${param.email}');
		var email = document.getElementById("email");
		var nickname = document.getElementById("nickname");
		
		if(${param.email ne null}){ 
		email.value = '${param.email}';
		email.readOnly = true;
		}
		
		if(${param.nickname ne null}){
			nickname.value = '${param.nickname}';
			nickname.readOnly = true;
		}
	}
</script>
</head>
<body>
		<a href="/">
          	<p class="tip">CCV</p>
        </a>
	
	<div class="cont s--signup">
		<div class="form sign-in">
			<h2>Welcome back,</h2>
			<form>
				<label> <span>Email</span> <input type="email" name="email"/>
				</label> 
				<label> <span>Password</span> 
				<input type="password" name="pwd"/>
				</label>
				<p class="forgot-pass">Forgot password?</p>
				<button type="button" class="submit" onclick="login_Send(this.form)">Sign
					In</button>
				<button type="button" onclick="kakaoLogin();" class="fb-btn">
					<span>KAKAO Sign up</span></button>
			</form>
		</div>
		<div class="sub-cont">
			<div class="img">
				<div class="img__text m--up">
					<h2>New here?</h2>
					<p>Sign up and discover great amount of new opportunities!</p>
				</div>
				<div class="img__text m--in">
					<h2>One of us?</h2>
					<p>If you already has an account, just sign in. We've missed
						you!</p>
				</div>
				<div class="img__btn">
					<span class="m--up">Sign Up</span> <span class="m--in">Sign
						In</span>
				</div>
			</div>
			<div class="form sign-up">
				<h2>Time to feel like home,</h2>
				<form>
					<label> 
					 <input type="text" name="name" placeholder="Name" />
					</label>					
					 <label> 
					 <input type="email" name="email" placeholder="Email" />
					  <button id="emco" type="button" class="email-check" onclick="email_check(this.form)" >
       				  	check
      	 			 </button>
					</label>					
					 <label>
					  <input type="password" name="pwd"  placeholder="Password" />
					</label> 					
					<label> 
					<input type="text" name="phone" placeholder="Phone" id="input_tel" />
					 <button type="button" id="tel_btn" class="phonch"
                               onclick="auth(this.form)">인증코드
                              전송</button> 
					</label>					
	                            
					<label> 
                           <input type="text" name="code" id="input_code" 
                              placeholder="전송받은 코드"
                              pattern="[0-9]{6}" required>
					</label>
					
                           <input type="button" id="code_btn" class="codech"
                               onclick="codenumcheck(this.form)" value="코드 확인" disabled>
                 
                           <input type="hidden" id="phoneDoubleChk" /> 
					<button type="button" class="submit" onclick="SignUp_send(this.form);">Sign Up</button>
				
				</form>
			</div>
		</div>
	</div>

</body>
<script>

	//로그인&회원가입 페이지 이동 버튼
	document.querySelector('.img__btn').addEventListener('click', function() {
		document.querySelector('.cont').classList.toggle('s--signup');
	});

	//카카오로그인
	function kakaoLogin() {

		$.ajax({
			url : '/getKakaoAuthUrl',
			type : 'get',
			async : false,
			dataType : 'text',
			success : function(res) {
				location.href = res;
			}
		});

	}

	$(document).ready(
			function() {

				var kakaoInfo = '${kakaoInfo}';

				if (kakaoInfo != "") {
					var data = JSON.parse(kakaoInfo);

					alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
					alert("user : \n" + "email : " + data['email']
							+ "\n nickname : " + data['nickname']);
				}
			});
</script>
</html>