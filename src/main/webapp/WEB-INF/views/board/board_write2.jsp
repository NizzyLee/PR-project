<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
h2 {
	text-align: center;
	margin-bottom: 50px;
}

.box {
	width: 1200px;
	height: 800px;
	border: solid 1px #eeeeee;
	text-align: center;
	display: block;
	margin-left: 100px;
}

input {
	display: block;
	width: 400px;
	height: 30px;
	margin: 10px 0;
}

th {
	margin: 10px 10px;
}

tr {
	width: 900px;
	display: inline-block;
}

textarea {
	border: solid 1px #ccc;
	outline-color: #ccc;
	width: 900px;
	height: 400px;
}

#aaa {
	float: right;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	<h2>:::새 글 쓰기:::</h2>

	<div class="box">
		<form method="post" action="board_insert.do">

			<table>

				<input type="hidden" name="id" value="${user.id}">
				<input type="hidden" name="name" value="${user.name}">

				<tr>

					<th>제목</th>
					<td><input name="subject"></td>

				</tr>

				<tr>
					<th>작성자</th>
					<td><input value="${user.name}" disabled></td>
				</tr>

				<tr>
					<th>내용</th>
					<td><textarea name="content" rows="10" cols="70"
							style="resize: none;"></textarea></td>
				</tr>

				<tr>

					<th>비밀번호</th>
					<td><input name="pwd" type="password"></td>
				</tr>


				<tr>

					<td colspan="2" align="right" id="aaa"><input type="button"
						value="등록" onclick="send_check(this.form);"> <input
						type="button" value="취소" onclick="location.href='board_list.do'">
					</td>

				</tr>

			</table>

		</form>
	</div>

	
</body>
</html>

















