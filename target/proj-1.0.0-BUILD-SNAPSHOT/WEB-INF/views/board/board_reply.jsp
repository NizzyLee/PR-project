<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script>
		function send_check(f){
			
			//유효성체크 했다고 쳐
			
			//비밀번호 유효성 체크
			var pwdPattern = /^[A-Za-z0-9]{4,10}$/;
			
			//영문과 숫자로 이루어진 4 ~ 10자리의 비밀번호인지 검증
			if( !pwdPattern.test( f.pwd.value ) ){
				alert("비밀번호 형식을 확인하세요");
				return;
			}
			
			f.submit();
			
		}
	</script>

</head>
<body>
	<form method="post" action="reply.do">
	
		<input type="hidden" name="page" value="${ param.page }">
		<input type="hidden" name="ref" value="${ ref }">
		<input type="hidden" name="idx" value="${ idx }">
	
		<table border="1" align="center" width="610">
			<caption>:::댓글 쓰기:::</caption>
		
			<tr>
				<th>제목</th>
				<td><input name="subject" style="width:300px;"></td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td><input name="name" style="width:300px;"></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="10" cols="70"></textarea></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input name="pwd" type="password" style="width:300px;"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="등록" onclick="send_check(this.form);">
					<input type="button" value="취소" onclick="location.href='board_list.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

















