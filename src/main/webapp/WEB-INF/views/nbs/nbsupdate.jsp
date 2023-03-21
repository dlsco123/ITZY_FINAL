<%@page import="ITzy.OTT.dto.NbsDto"%>
<%@page import="ITzy.OTT.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	NbsDto dto = (NbsDto)request.getAttribute("dto");
	MemberDto login = (MemberDto)session.getAttribute("login");
		if(login == null){
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
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

 
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

	<style type="text/css">
  	th{
  		background-color: #007bff;
  		text-align: center;
		vertical-align: middle!important;
  	}
  	.table-info {
  		    --bs-table-bg: #dee2e6;
  		    --bs-table-border-color: #000;
  	}
  	pre{
  		white-space: pre-wrap;
  		word-break: break-all;
  		overflow: auto;
  		text-align: left;
  	} 	
	</style>
</head>
<body>

<hr>
<div id="app" class="container">

<form action="nbsupdateAf.do" id="frm" method="post" enctype="multipart/form-data">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>" >


<table class="table table-hover">
<col width="100px"><col width="500px">	
	<tr>
		<th>아이디</th>
		<td><%=dto.getId() %></td>
	</tr>
	<tr>
		<th class="align-middle">제목</th>
		<td>
			<input type="text" id="title" name="title" size="50px" class="form-control form-control-lg" value='<%=dto.getTitle() %>'>
		</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td><button type="button" class="btn btn-secondary"
			 onclick="filedown(<%=dto.getSeq() %>, '<%=dto.getNewfilename() %>', '<%=dto.getFilename() %>')">
			 <%=dto.getFilename() %></button>
			<input type="hidden" name="filename" value="<%=dto.getFilename() %>">
			<input type="hidden" name="newfilename" value="<%=dto.getNewfilename() %>">
		</td>
	</tr>
	<tr>
		<th>첨부파일 변경</th>
		<td><input type="file" name="fileload"></td>
	</tr>
	<tr>	
		<td colspan="2">
			<textarea rows="18" id="content" name="content" class="form-control"><%=dto.getContent()  %></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right" style="padding-top: 20px">
			<button type="button" class="btn btn-secondary">수정 완료</button>
		</td>
	</tr>
</table>
</form>
</div>

<form name="file_down" action="filedownload.do" method="post">
	<input type="hidden" name="newfilename">
	<input type="hidden" name="filename">
	<input type="hidden" name="seq">
</form>


<script type="text/javascript">
$(document).ready(function() {	
	$("button").click(function() {		
		if($("#title").val().trim() == "" ){
			alert("제목을 기입해 주십시오");
			return;
		}else if($("#content").val().trim() == "" ){
			alert("내용을 기입해 주십시오");
			return;
		}else{
			$("#frm").submit();
		}		
	});	
});

function filedown(seq, newfilename, filename) {
	document.file_down.newfilename.value = newfilename;
	document.file_down.filename.value = filename;
	document.file_down.seq.value = seq;
	document.file_down.submit();
}
</script>

</body>
</html>