
<%@page import="ITzy.OTT.dto.BbsDto"%>
<%@page import="ITzy.OTT.dto.MemberDto"%>
<%@page import="ITzy.OTT.util.Utility"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

List<BbsDto> list = (List<BbsDto>)request.getAttribute("bbslist");
int pageBbs = (Integer)request.getAttribute("pageBbs");
int pageNumber = (Integer)request.getAttribute("pageNumber");
String choice = (String)request.getAttribute("choice");
String search = (String)request.getAttribute("search");
%>    
<%

MemberDto login = (MemberDto)session.getAttribute("login");
if (login == null) {
%>
<script>
	alert('로그인 해 주십시오');
	location.href = "login.do";
</script>
<%
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
	
<link rel="stylesheet" href="./css/common.css"/>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- <script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script> -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="css/common.css"/>
<style type="text/css">
.page-link {
    color:#212529;
}

.table th, .table td {
    text-align: center;
    vertical-align: middle!important;
}
.container {
    width: 100%;
    overflow-y:auto; 
}

body{
display: flex, flex-direction: column;
height: 100%;
}
.content{
flex: 1;
}
.active>.page-link, .page-link.active {
    background-color: #333;
    text-color: black;
}
</style>

</head>
<body bgcolor="#e9e9e9">

<h1>자유게시판</h1>

<hr>

<div class="content">
<div align="center">

<table class="table table-hover" style="width: 1000px">
<col width="70"><col width="600"><col width="100"><col width="150">
	<thead>
		<tr class="table-secondary">
			<th>번호</th><th>제목</th><th>조회수</th><th>작성자</th>
		</tr>
	</thead>
<tbody>

<%
if(list == null || list.size() == 0){
	%>
	<tr>
		<td colspan="4">작성된 글이 없습니다</td>
	</tr>
	<%
}else{
	
	for(int i = 0;i < list.size(); i++)
	{
		BbsDto bbs = list.get(i);
		%>
		<tr>
			<th><%=i + 1 + (pageNumber * 10) %></th>
			
			<td style="text-align: left;">
								

			<%
			if(bbs.getDel() == 0){
				%>
					<%=Utility.arrow(bbs.getDepth()) %>
					
					<a href="bbsdetail.do?seq=<%=bbs.getSeq() %>">
 					
					<strong><a href="bbsdetail.do?seq=<%=bbs.getSeq() %>" style="text-align: center; text-decoration-line: none; color: black; ">
					                    <%=bbs.getTitle() %></a></strong>

					</a>							
				<%
			}else if(bbs.getDel() == 1){
				%>				
					<%=Utility.arrow(bbs.getDepth()) %>
					<font color="#ff0000">*** 이 글은 작성자에 의해서 삭제되었습니다 ***</font>					
				<%
			}	
			%>
			</td>
			
			<td><%=bbs.getReadcount() %></td>
			<td><%=bbs.getId() %></td>
		</tr>
		<%
	}
}
%>

</tbody>
</table>

<br>
<table style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px">
	<tr>
		<td style="padding-left: 5px">
			<select class="btn btn-secondary" id="choice" name="choice">
				<option selected>검색</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select> 
		</td>
		<td style="padding-left: 5px" class="align-middle">
			<input type="text" class="form-control" id="search" name="search" onkeyup="enterKeyEvent()" placeholder="검색어" value="<%=search %>">
		<td style="padding-left: 5px">
			<span>
				<button type="button" class="btn btn-secondary" onclick="searchBtn()">검색</button>
			</span>
		</td>
	</tr>
</table>
<br>
<%-- 
 <%
for(int i = 0;i < pageBbs; i++){
	if(pageNumber == i){	// 현재 페이지
		%>
		<span style="font-size: 15pt;color: #0000ff">
			<%=i+1 %>
		</span>
		<%
	}else{					// 그밖에 다른 페이지
		%>
		<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
			style="font-size: 15pt; color: #000; text-decoration: none;">
			[<%=i+1 %>]
		</a>			
		<%
	}		
}
%> 
 --%>
<div class="container">
    <nav aria-label="Page navigation">
        <ul class="pagination" id="pagination" style="justify-content:center"></ul>
    </nav>
</div>

<br>
<!-- <a href="bbswrite.do">글쓰기</a> -->
<button type="button" class="btn btn-secondary" onclick="bbsWrite()">글쓰기</button>
</div>
</div>
<script type="text/javascript">

let search = "<%=search %>";
console.log("search = " + search);
if(search != ""){
	let obj = document.getElementById("choice");
	obj.value = "<%=choice %>";
	obj.setAttribute("selected", "selected");
}

function enterKeyEvent() {
	if(window.event.keyCode==13){
		searchBtn();
	}
}


function bbsWrite() {
	location.href = "bbswrite.do";
}
function searchBtn() {
	let choice = document.getElementById('choice').value;
	let search = document.getElementById('search').value;
	
	location.href = "bbslist.do?choice=" + choice + "&search=" + search;
}

function goPage( pageNumber ) {
	let choice = document.getElementById('choice').value;
	let search = document.getElementById('search').value;
	
	location.href = "bbslist.do?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNumber;	
}


$('#pagination').twbsPagination({
	startPage: <%=pageNumber+1 %>, 
    totalPages: <%=pageBbs %>,
    visiblePages: 10,
    first:'<span srid-hidden="true">«</span>',
    prev:"이전",
    next:"다음",
    last:'<span srid-hidden="true">»</span>',
    initiateStartPageClick:false,   // onPageClick 자동실행되지 않도록
    onPageClick: function (event, page) {
        // alert(page);
        let choice = document.getElementById('choice').value;
		let search = document.getElementById('search').value;
    	location.href = "bbslist.do?choice=" + choice + "&search=" + search + "&pageNumber=" + (page-1);
    }
});





</script>


</body>
</html>


