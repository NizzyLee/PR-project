<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<script>
	function send_check(f) {

		//유효성체크 했다고 쳐

		//비밀번호 유효성 체크
		var pwdPattern = /^[A-Za-z0-9]{4,10}$/;

		//영문과 숫자로 이루어진 4 ~ 10자리의 비밀번호인지 검증
		if (!pwdPattern.test(f.pwd.value)) {
			alert("비밀번호 형식을 확인하세요");
			return;
		}

		f.submit();

	}
</script>

</head>
<body>

	
	
	   <form method="POST" enctype="multipart/form-data" action="board_insert.do">
	<input type="hidden" name="id" value="${user.id}">
				<input type="hidden" name="name" value="${user.name}">

      <div class="container" role="main">
         <h2>board Write Form</h2>

         <div class="mb-3">
            <label for="title">작성자</label> <input type="text"
               class="form-control" name="title" id="title"
               value="${user.name}" disabled >
         </div>
         
         <div class="mb-3">
            <label for="reg_id">제목</label> <input type="text"
               class="form-control" name="subject" id="reg_id"
               placeholder="제목을 입력해 주세요" value="${vo.title}">
         </div>
         
         

							
							
         <div class="mb-3">
            <label for="content">내용</label>
                        <!-- wrap='on' : textarea에서 작성된 글이 길어서 다음줄로 넘어갔을 때 
                         엔터값으로 인지할 수 있도록 해주는 속성 -->
            <textarea class="form-control" rows="5" name="content" id="content" style="resize: none;"
               placeholder="내용을 입력해 주세요" wrap='on'></textarea>
         </div>
         <div class="mb-3">
            <label for="pwd">비밀번호</label> <input type="password" class="form-control"
               name="pwd" id="tag" placeholder="비밀번호를 입력해 주세요">
         </div>
       

      <input type="button" class="btn btn-sm btn-primary" id="btnSave" value="등록" onclick="send_check(this.form);"> 
      <input
         type="button" value="취소" class="btn btn-sm btn-primary" id="btnList"
         onclick="location.href='board_list.do'">
   </div>

   </form>
   
   
   
	
</body>
</html>

















