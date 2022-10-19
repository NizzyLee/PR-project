<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<style>
@import url("https://fonts.googleapis.com/css?family=Fira+Sans");
html, body {
  position: relative;
  min-height: 100vh;
  background-color: #E1E8EE;
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: "Fira Sans", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.form-structor {
  background-color: #222;
  border-radius: 15px;
  height: 900px;
  width: 700px;
  position: relative;
  overflow: hidden;
}
.form-structor::after {
  content: "";
  opacity: 0.8;
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background-repeat: no-repeat;
  background-position: left bottom;
  background-size: 1000px;
  background-image: url("https://images.unsplash.com/photo-1503602642458-232111445657?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bf884ad570b50659c5fa2dc2cfb20ecf&auto=format&fit=crop&w=1000&q=100");
}
.form-structor .signup {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  width: 65%;
  z-index: 5;
  -webkit-transition: all 0.3s ease;
}
.form-structor .signup.slide-up {
  top: 5%;
  -webkit-transform: translate(-50%, 0%);
  -webkit-transition: all 0.3s ease;
}
.form-structor .signup.slide-up .form-holder, .form-structor .signup.slide-up .submit-btn {
  opacity: 0;
  visibility: hidden;
}
.form-structor .signup.slide-up .form-title {
  font-size: 1em;
  cursor: pointer;
}
.form-structor .signup.slide-up .form-title span {
  margin-right: 5px;
  opacity: 1;
  visibility: visible;
  -webkit-transition: all 0.3s ease;
}
.form-structor .signup .form-title {
  color: #fff;
  font-size: 1.7em;
  text-align: center;
}
.form-structor .signup .form-title span {
  color: rgba(0, 0, 0, 0.4);
  opacity: 0;
  visibility: hidden;
  -webkit-transition: all 0.3s ease;
}
.form-structor .signup .form-holder {
  border-radius: 15px;
  background-color: #fff;
  overflow: hidden;
  margin-top: 50px;
  opacity: 1;
  visibility: visible;
  -webkit-transition: all 0.3s ease;
}
.form-structor .signup .form-holder .input {
  border: 0;
  outline: none;
  box-shadow: none;
  display: block;
  height: 30px;
  line-height: 30px;
  padding: 8px 15px;
  border-bottom: 1px solid #eee;
  width: 100%;
  font-size: 12px;
}
.form-structor .signup .form-holder .input:last-child {
  border-bottom: 0;
}
.form-structor .signup .form-holder .input::-webkit-input-placeholder {
  color: rgba(0, 0, 0, 0.4);
}
.form-structor .signup .submit-btn {
  background-color: rgba(0, 0, 0, 0.4);
  color: rgba(255, 255, 255, 0.7);
  border: 0;
  border-radius: 15px;
  display: block;
  margin: 15px auto;
  padding: 15px 45px;
  width: 100%;
  font-size: 13px;
  font-weight: bold;
  cursor: pointer;
  opacity: 1;
  visibility: visible;
  -webkit-transition: all 0.3s ease;
}
.form-structor .signup .submit-btn:hover {
  transition: all 0.3s ease;
  background-color: rgba(0, 0, 0, 0.8);
}
.form-structor .login {
  position: absolute;
  top: 20%;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #fff;
  z-index: 5;
  -webkit-transition: all 0.3s ease;
}
.form-structor .login::before {
  content: "";
  position: absolute;
  left: 50%;
  top: -20px;
  -webkit-transform: translate(-50%, 0);
  background-color: #fff;
  width: 200%;
  height: 250px;
  border-radius: 50%;
  z-index: 4;
  -webkit-transition: all 0.3s ease;
}
.form-structor .login .center {
  position: absolute;
  top: calc(50% - 10%);
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  width: 65%;
  z-index: 5;
  -webkit-transition: all 0.3s ease;
}
.form-structor .login .center .form-title {
  color: #000;
  font-size: 1.7em;
  text-align: center;
}
.form-structor .login .center .form-title span {
  color: rgba(0, 0, 0, 0.4);
  opacity: 0;
  visibility: hidden;
  -webkit-transition: all 0.3s ease;
}
.form-structor .login .center .form-holder {
  border-radius: 15px;
  background-color: #fff;
  border: 1px solid #eee;
  overflow: hidden;
  margin-top: 50px;
  opacity: 1;
  visibility: visible;
  -webkit-transition: all 0.3s ease;
}
.form-structor .login .center .form-holder .input {
  border: 0;
  outline: none;
  box-shadow: none;
  display: block;
  height: 30px;
  line-height: 30px;
  padding: 8px 15px;
  border-bottom: 1px solid #eee;
  width: 100%;
  font-size: 12px;
}
.form-structor .login .center .form-holder .input:last-child {
  border-bottom: 0;
}
.form-structor .login .center .form-holder .input::-webkit-input-placeholder {
  color: rgba(0, 0, 0, 0.4);
}
.form-structor .login .center .submit-btn {
  background-color: #6B92A4;
  color: rgba(255, 255, 255, 0.7);
  border: 0;
  border-radius: 15px;
  display: block;
  margin: 15px auto;
  padding: 15px 45px;
  width: 100%;
  font-size: 13px;
  font-weight: bold;
  cursor: pointer;
  opacity: 1;
  visibility: visible;
  -webkit-transition: all 0.3s ease;
}
.form-structor .login .center .submit-btn:hover {
  transition: all 0.3s ease;
  background-color: rgba(0, 0, 0, 0.8);
}
.form-structor .login.slide-up {
  top: 90%;
  -webkit-transition: all 0.3s ease;
}
.form-structor .login.slide-up .center {
  top: 10%;
  -webkit-transform: translate(-50%, 0%);
  -webkit-transition: all 0.3s ease;
}
.form-structor .login.slide-up .form-holder, .form-structor .login.slide-up .submit-btn {
  opacity: 0;
  visibility: hidden;
  -webkit-transition: all 0.3s ease;
}
.form-structor .login.slide-up .form-title {
  font-size: 1em;
  margin: 0;
  padding: 0;
  cursor: pointer;
  -webkit-transition: all 0.3s ease;
}
.form-structor .login.slide-up .form-title span {
  margin-right: 5px;
  opacity: 1;
  visibility: visible;
  -webkit-transition: all 0.3s ease;
}
.inp { border: none;
    padding: 5px 15px;
        width:350px;}

.bbtn {  position: absolute; 
    top: -1;
    padding-top:1px;
    right: 5px; 
    border:1px;
    border-radius:10px;}
</style>
<script type="text/javascript">
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
let is_id = false;
let is_pwd = false;
function pwd_check(f) {

	if(f.pwd.value !=null && f.pwdcheck.value){

	let pwd = "pwd="+f.pwd.value;
	let cpwd = "pwd="+f.pwdcheck.value;
	if(pwd == cpwd){
		alert("비밀번호 확인이 완료되었습니다.")
		is_pwd = true;
	}
	else
	{
		alert("비밀번호가 틀립니다. 다시 확인해주세요.")
	}	
	}
	else{
		alert("비밀번호와 확인 비밀번호를 입력해주세요.");
	}
	
}


function id_check(f) {
	alert(f.id.value);
	if(f.id.value != ""){
	let url = "id_check.do";
	
	let param = "id="+f.id.value;

	sendRequest(url, param, resultFn, "POST");
	}
	else{
		alert("아이디를 입력해주세요.");
	}
	
}

function resultFn() {
	
	if ( xhr.readyState == 4 && xhr.status == 200 ) {
			
		let data = xhr.responseText;
		
		if( data == "no" ) {
			alert("중복된 아이디 입니다.");
		} else if( data == "yes")  {
			alert("사용가능한 아이디 입니다.");
			is_id = true;
		} else{
			alert("아이디를 입력하세요.");
		}
	}
}

function send(f){
	
	let id = f.id.value;
	let pwd = f.pwd.value;
	let name = f.name.value;
	let age = f.age.value;
	let gene = f.gene.value;
	let email = f.email.value;

	//유효성 체크 
	let idcheck = /^[a-zA-Z0-9]{4,12}$/; //4~12자 영문소문자, 숫자, 언더라인(_) 사용가능
	let pwdcheck =  /^[A-Za-z0-9]{4,10}$/; //영문과 숫자로 이루어진 4자리에서 10자리의 비밀번호
	let emailcheck =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(is_id == false){
		alert("아이디 중복체크를 해주세요.");
		return;
	}
	if(is_pwd == false){
		alert("비밀번호 확인을 해주세요.");
		return;
	}
	
	if(!idcheck.test(f.id.value)){
		alert("4~12자 영문소문자, 숫자, 언더라인(_)사용가능에 맞게 입력해주세요");
		return;
	}
	if( !pwdcheck.test(f.pwd.value) ) {
		alert("비밀번호 형식을 확인하세요");
		return;
	}

	if(!emailcheck.test(f.email.value)){
		alert("정확한 이메일을 입력해주세요");
		return;
	}

	f.action="insert.do";
	f.method="post";
	f.submit();
}


	
</script>
</head>
<body>
	<div class="form-structor">
  <div class="signup">
    <h2 class="form-title" id="signup"><span>or</span>회원가입</h2>
    <form>
    <div class="form-holder">  
      <input type="text" class="inp input" id="nickname" name="name" required="required" placeholder="name" />
      <input class=bbtn align="center" type="button"  value="중복체크" onclick="id_check(this.form);" >
      <input type="text" class="input" name="id" required="required" placeholder="id" value="" />
      <input type="password" class="input" name="pwd" required="required" placeholder="Password" />
      <input class=bbtn align="center" type="button"  value="비밀번호 확인" onclick="pwd_check(this.form);" >
      <input type="password" class="input "  name="pwdcheck" required="required" placeholder="pwd check" />
      <input type="number" class="input" name="age" required="required" min="0"  placeholder="age" />
      <div align="center">
      <input type="radio" class="btn-check" name="gene" id="option1" autocomplete="off" value="남" checked>
	  <label class="btn btn-primary btn_gene" for="option1">남자</label>				
	  <input type="radio" class="btn-check" name="gene" id="option2" autocomplete="off" value="여">
	  <label class="btn btn-danger btn_gene" for="option2">여자</label>
      </div>
       <input type="text" class="input" name="email" id="email" maxlength="30" placeholder="Email      이메일의 형식은 ****@****.*** 입니다."/>
       <input type="text" class="input" id="input_tel" name="phone" required="required"  placeholder="phone number" />
       <button type="button" id="tel_btn" class="default_btn rounded"
                              style="height: 48px;" onclick="auth(this.form)">인증코드
                              전송</button>
                              

                           <input type="text" name="code" id="input_code"
                              class="form-control form-control-lg" placeholder="전송받은 코드"
                              pattern="[0-9]{6}" required>

                           <input type="button" id="code_btn" class="default_btn rounded"
                              style="height: 48px;" onclick="codenumcheck(this.form)" value="코드 확인" disabled>
                              
                           <input type="hidden" id="phoneDoubleChk" /> 
    </div>
    <button class="submit-btn" onclick="send(this.form);">Sign up</button>
     <button class="submit-btn" onclick="location.href='login_form.do'">log in</button>
    </form>
  </div>
</div>			

</body>
</html>