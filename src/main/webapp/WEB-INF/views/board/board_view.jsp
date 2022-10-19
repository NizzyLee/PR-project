<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">

<title>Insert title here</title>
<style>
table {margin-top : 50px;}
tr{border:solid 1px #EEEEEE;}
th{width : 100px; border :solid 1px #EEEEEE;}
.btn{float:right; }
table tr .th {
background-color : #6FD6EB;
}

body {background:}
</style>
	<script
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>

	<script>
		function reply(f){
			
			location.href="reply_form.do?idx="+f.idx.value + "&ref="+f.ref.value + "&page=${param.page}";
			
		}
		
		function del(f){
			if(confirm("삭제하시겠습니까?")){
				if( f.c_pwd.value != f.pwd.value ){
					alert("비밀번호 불일치");
					return;
				}
				
				var url = "board_del.do?idx="+f.idx.value; 
				//var param = "idx="+f.idx.value;
				
				sendRequest( url, null, resultFun, "post" );
				
			}//if
		}
		
		function resultFun(){
			
			if( xhr.readyState == 4 && xhr.status == 200 ){
				
				var data = xhr.responseText;
				
				if( data == 'yes' ){
					alert("삭제성공");
					location.href = "board_list.do?page=${param.page}";
				}else{
					alert("삭제실패");
				}
				
			}
			
		}
		
	</script>

</head>
<body>
<h1>게시판 자세히 보기</h1>
	<form>
	<input type="hidden" name="idx" value="${vo.idx}">
	<input type="hidden" name="ref" value="${vo.ref}">
	<input type="hidden" name="pwd" value="${vo.pwd}">
	<input type="hidden" name="id" value="${user.id}">
	
	<table border="1" width="600" align="center" class="table">
		<tr>
			<th class="th">제목</th>
			<td>${ vo.subject }</td>
		</tr>
		
		<tr>
			<th class="th">작성자</th>
			<td>${ vo.name }</td>
		</tr>
		
		<tr>
			<th class="th">작성일</th>
			<td>${ vo.regdate }</td>
		</tr>
		
		<tr>
		<th class="th">내용</th>
			<td colspan="2" height = "400px;" ><pre>${ vo.content }</pre></td>
		</tr>
		
		<tr>
			<th class="th">비밀번호</th>
			<td>
				<input type="password" name="c_pwd">
			</td>
		</tr>
		
		<div class = "btn">
		<tr>
		
			<td colspan="2">
			<div class = "btn">
				<input type="button" class="btn btn-success" value="목록으로" onclick="location.href='board_list.do?page=${param.page}'">
				
				<c:if test="${ vo.depth lt 1 }">
					<input type="button" class="btn btn-primary" value="댓글달기" onclick="reply(this.form);">
				</c:if>
				
				<input type="button"  class="btn btn-secondary" value="삭제" onclick="del(this.form);">			
		
			</td>
		</tr>
		</div>
	</table>
	
	</form>
</body>
</html>


















































