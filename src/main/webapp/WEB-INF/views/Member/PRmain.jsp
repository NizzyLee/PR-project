<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Main</title>
<script	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">
<link href="${pageContext.request.contextPath}/resources/css/PR_Main.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<script>
function modify(f) {
	
	var ff = document.getElementById("ff");
	ff.action = "PR_modify_form.do?idx="+f;
	ff.method="post";
	ff.submit();
}
</script>
</head>
<body>
  <header class="p-3 text back" style="background-image: url( '${pageContext.request.contextPath}/resources/img/back4.jpg')" >
  <!--  <header class="navbar" style="background-color: #e3f2fd;"> -->
    <div class="container">
       <a href="/" class="home">
          <span class="tip">CCV</span>
        </a> 
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
     
          <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">       
          <li><a href="#" class="nav-link px-2 text-white">MOVIE</a></li>
          <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>
        
        </ul>
  	
        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
          <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search">
        </form>
           <div class="text-end">
            <c:if test="${user.email == 'rkdn36@naver.com'}"> 
				          <button type="button" onclick="location.href='memo_insert_form.do'" class="btn btn-outline-light me-2">Movie upload</button>
              </c:if> 
                <c:if test="${user.email != null}">
          <button type="button" onclick="location.href='/'" class="btn btn-outline-light me-2">MyPage</button>
          <button type="button" onclick="location.href='logout.do'" class="btn btn-warning">Login-Out</button>
         </c:if>
        </div>
    
	

        <c:if test="${user.email == null}">
        <div class="text-end">
          <button type="button" onclick="location.href='PRLogin_form.do'" class="btn btn-outline-light me-2">Login</button>
          <button type="button" onclick="location.href='PRinsert_form.do'" class="btn btn-warning">Sign-up</button>     
        </div>
        </c:if>
      </div>
    </div>
  </header>
  
  		<!-- Features -->
  		<form id="ff">
				<section id="features" class="sec">
					<div class="container">
						<div class="row">
						<c:forEach var="vo" items="${ list }">
							<div class="col-3 col-6-medium col-12-small">
				<input type="hidden" name="title" value="${vo.title}">
						
								<!-- Feature #1 -->
									<section>
										<a href="#" onclick="modify('${vo.idx}')" class="bordered-feature-image"><img src="${pageContext.request.contextPath}/resources/upload/${vo.filename}" alt="" /></a>
												<div class="sta">별점</div>
												<c:if test="${vo.star == '0'}">
												
                  <div class="starr col-2">☆☆☆☆☆</div>
               </c:if>
               <c:if test="${vo.star == '1'}">
                  <div class="starr col-2">★☆☆☆☆</div>
               </c:if>
               <c:if test="${vo.star == '2'}">
                  <div class="starr col-2">★★☆☆☆</div>
               </c:if>
               <c:if test="${vo.star == '3'}">
                  <div class="starr col-2">★★★☆☆</div>
               </c:if>
               <c:if test="${vo.star == '4'}">
                  <div class="starr col-2">★★★★☆</div>
               </c:if>
               <c:if test="${vo.star == '5'}">
                  <div class="starr col-2">★★★★★</div>
               </c:if>
										<h2 class="titlefont" align="center" name="title"> ${vo.title}</h2>
	
									</section>
					
							</div>
							</c:forEach>
							
						</div>
					</div>
				</section>
				</form>
				<div class=pagebotton align=center>
						${ pageMenu } 				
	      </div>
</body>

<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</html>