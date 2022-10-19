<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/lib/main.min.css">
<script src="${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/lib/main.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/lib/locales-all.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">

	<style>
	
	.pagebotton{
margin:50px;
}
.tt{
padding-top:15px;
font-size:30px;
}
.ttt{
padding:45px;
font-weight:bold;
}
.meta{
border-bottom:1px solid #eeeeee;

}

.all_list{

padding-left:30px;

}
.new_write {
justify-content:center;
display:flex;
margin-top:50px;
}


		 a{text-decoration:none;
		 } 
	
		.py-5 bg-light border-bottom mb-4 {
	height: 250px;
	background-size: contain;
	background-repeat: no-repeat !important;
	background-position: center !important;
    background-position: 25% 75%;
}
  

	</style>

</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="main.do?mid=${user.id}">DIARY'S</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						href="main.do?mid=${user.id}">홈</a></li>
					<li class="nav-item"><a class="nav-link "  style="cursor:pointer;" onclick="location.href='memo_list.do?id=${user.id}'">메모</a></li>
					<li class="nav-item"><a class="nav-link "
						href="list.do?id=${user.id}">가계부</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="board_list.do">공지사항</a></li>
						<li class="nav-item"><a class="nav-link"
						aria-current="page" href="logout.do">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page Header-->
	<header class="py-5 bg-light border-bottom mb-4" style="background-image:url('${pageContext.request.contextPath}/resources/img/back5.jpg')">
		<div class="text-center my-5">
			<!--                     <h1 class="fw-bolder">Welcome to Blog Home!</h1>
                    <p class="lead mb-0">A Bootstrap 5 starter layout for your next blog homepage</p> -->
		</div>	
	</header>
	<h1 class="ttt">Q&A</h1>
	<c:forEach var="vo" items="${ board_list }">
	<div class="all_list" >
	<div class="tt" >
			<!-- 댓글일경우 제목을 들여쓰기 한다 -->
			<c:forEach begin="1" end="${ vo.depth }">&nbsp;</c:forEach>
			
			<!-- 댓글기호 -->
			<c:if test="${ vo.depth ne 0 }">ㄴ</c:if>
			
			<!-- 삭제된 글일경우 클릭이 불가 -->
			<c:if test="${ vo.del_info eq 0 }">
				<a href="view.do?idx=${ vo.idx }&page=${empty param.page ? 1 : param.page }"><font color="black">${ vo.subject }</font></a>
			</c:if>
			<c:if test="${ vo.del_info eq -1 }">
				<font color="gray">${ vo.subject }</font>
			</c:if>
			
		
	</div>
	<div class="meta">
					<span class="category_box">작성자 :</span>
				${ vo.name } <span class="bar">|</span>
		${fn:split(vo.regdate, ' ')[0]} <span class="bar">|</span>
		${ vo.readhit }												<div class="download_link">
					<a href="/files/attach/releases/rhymix-2.0.13.zip"><i data-feather="download"></i></a>
				</div>
						</div>
			</div>
						</c:forEach>
						<div class="new_write">
												<input type="button"  id="new_write" class="btn btn-primary" value="새글작성" onclick="location.href='board_form.do'"
				       style="cursor:pointer"> 
						</div>

		<div class=pagebotton align=center>
						${ pageMenu } 
				
	      </div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



























