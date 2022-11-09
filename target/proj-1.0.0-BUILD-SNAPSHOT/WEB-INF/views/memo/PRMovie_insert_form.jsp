<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/memo_write.css">
	<!-- ajax -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
#rating {
   display: inline-block;
   direction: rtl;
   border: 0;
}
#rating input[type=radio] {
   display: none;
}

#rating label {
   font-size: 3em;
   color: transparent;
   text-shadow: 0 0 0 #f0f0f0;
}

#rating label:hover {
   text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#rating label:hover ~ label {
   text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#rating input[type=radio]:checked ~ label {
   text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
</style>

	<script>
	function send(f){
		
		f.action = "memo_insert.do";
		f.method = "post";
		f.submit();
	}
	</script>



</head>
<body>
<!--  파일을 전송하는 폼태그에는 아래의 두가지 속성이 반드시 추가되어 있어야 한다 -->
	<form method="POST" enctype="multipart/form-data">

		<div class="container" role="main">
			<h2>Memo Write Form</h2>

		
			<div class="mb-3">
				<label for="reg_id">제목</label> <input type="text"
					class="form-control" name="title" id="reg_id"
					placeholder="제목을 입력해 주세요" value="${vo.title}">
			</div>
		<div class="mb-3">
				<fieldset for="star" id="rating"> 
				 <input type="radio" name="star" value="5" id="rate1">
                     <label for="rate1">★</label> 
                     <input type="radio" name="star" value="4" id="rate2"> 
                     <label for="rate2">★</label> 
                     <input type="radio" name="star" value="3" id="rate3"> 
                     <label for="rate3">★</label> 
                     <input type="radio" name="star" value="2" id="rate4"> 
                     <label for="rate4">★</label> 
                     <input type="radio" name="star" value="1" id="rate5"> 
                     <label for="rate5">★</label>
                     </fieldset> 
			</div>
							
			<div class="mb-3">
			<label for="file">사진첨부</label>
				 <input id="file" type="file" class="form-control"
					name="photo" id="tag" >
			</div>
			<div class="mb-3">
			<label for="file2">사진첨부</label>
				 <input id="file" type="file" class="form-control"
					name="photo2" id="tag" >
			</div>
		<input type="button" class="btn btn-sm btn-primary" id="btnSave" value="글쓰기" onclick="send(this.form);"> 
		<%-- <input
			type="button" value="목록으로" class="btn btn-sm btn-primary" id="btnList"
			onclick="location.href='memo_list.do?id=${user.id}'"> --%>
	</div>

	</form>

</body>
</html>