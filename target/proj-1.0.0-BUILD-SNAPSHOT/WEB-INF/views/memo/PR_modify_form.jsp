<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css">
<link href="${pageContext.request.contextPath}/resources/css/PR_Modify.css" rel="stylesheet" />
<title>Insert title here</title>
<script>
	function reviewsend(f) {
	
		f.action = "PR_modify_form.do?idx="+${vo.idx};		
		f.method="post";
		f.submit();		
	}	
	function reviewlogin(){
		
		alert("로그인 후 이용해주세요.");
	}
</script>
</head>
<body>
	     <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/">CCV</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                    <c:if test="${user.email != null}">

                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="/">MyPage</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="logout.do">Logout</a></li>

                    </c:if>
                     <c:if test="${user.email == null}">

                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="PRLogin_form.do">Login</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="PRinsert_form.do">Sign-up</a></li>

                    </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url(${pageContext.request.contextPath}/resources/upload/${vo.titleimg})">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                        	
                            <div class="titlefont">${vo.title}</div>    
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div>
        <img class="starimg" src="${pageContext.request.contextPath}/resources/upload/${vo.filename}" alt="" /> 
        <div class="flo">
        <div class="reviewtitle">줄거리 소개</div>
        <div>줄거리 어쩌구 저쩌구</div>
            
        </div>
        
      </div>
     

      <div class="reviewtable">
       
         <table class="table">
<c:forEach var="vo" items="${ review_list }">
	<tr><!-- 첫번째 줄 시작 -->
	   <th>${ vo.name }</th>
	   <td>${ vo.content }</td>	
	   	<td class="ss" ><c:if test="${vo.star == '0'}">
												
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
               </c:if></td>                     
	</tr><!-- 첫번째 줄 끝 -->
	</c:forEach>
    </table>
    </div>
    <div style="padding:0 70px">
 <p>
  <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
   리뷰쓰기
  </button>
</p>
<div style="padding:10px 0"  class="collapse in" id="collapseExample">
  <div class="card card-body">
  <form>
   <p>${ user.name }</p> <textarea name="content" placeholder="리뷰를 작성해주세요"></textarea> <div class="mb-3">
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
			
			<input type="hidden" name="name" value="${ user.name }">
			<input type="hidden" name="title" value="${vo.title}">
			</div>
			  <c:if test="${user.email != null}">
			<button class="btn btn-primary" type="button" onclick="reviewsend(this.form)"> 작성하기</button>
		</c:if>
		  <c:if test="${user.email == null}">
			<button class="btn btn-primary" type="button" onclick="reviewlogin()"> 작성하기</button>
		</c:if>
	</form>
  </div>
</div>
</div>

<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>