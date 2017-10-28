<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String name = "";
try
{
	name = (String)session.getAttribute("user_name");
}
catch(Exception e){}

%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="../common_header.jsp"%>
	<title>Request New Service</title>
</head>

<body>
	<form class="form-horizontal" action="/client/client_addService_process.jsp" method="post" accept-charset="UTF-8">
		<div class="form-group">
			<div class="col-sm-1"><label for="client">요청자</label></div>
			<div class="col-sm-2">
				<p class="form-control-static" name = "name"><%=name%></p>
			</div>

			<div class="col-sm-1"><label for="route">접수경로</label></div>
			
			<div class="col-sm-2">
				<select class="form-control" name="route" style="width: 100%;">
					<option value="1">전화</option>
					<option value="2">회의</option>
					<option value="3">이메일</option>
					<option value="4">기타</option>
				</select>
			</div>

			<div class="col-sm-1"><label for="range">문제범위</label></div>
			<div class="col-sm-2">
				<select class="form-control" name="range" style="width: 100%;">
					<option value="1">회사</option>
					<option value="2">부서</option>
					<option value="3">개인</option>
				</select>
			</div>

			<div class="col-sm-1"><label for="emergency">긴급도</label></div>
			<div class="col-sm-2">
				<select class="form-control" name="emergency" style="width: 100%;">
					<option value="1">긴급</option>
					<option value="2">중요</option>
					<option value="3">경미</option>
				</select>
			</div>
		</div>

		<br>&nbsp;</br>
		<div class="form-group">
			<div class="col-sm-2"><label for="title">제목</label></div>
			<div class="col-sm-10">
				<input name = "title" type="text" class="form-control" placeholder="제목을 입력해주세요">
			</div>
		</div>
		<br>&nbsp;</br>
		<div class="form-group">
			<div class="col-sm-2"><label for="detail">내용</label></div>
			<div class="col-sm-10">
			<textarea name = "detail" class="form-control" rows="3" placeholder="내용을 입력해주세요" style="resize:vertical;"></textarea>
			</div>
		</div>
		<br>&nbsp;</br>
		<br>&nbsp;</br>
		<div class="form-group">
			<div class="col-sm-2"><label for="deadline">목표기한</label></div>
			<div class="col-sm-2">
				<input type="date" name="deadline" class="form-control" placeholder="캘린더 입력">
			</div>
		</div>
		
		<br>&nbsp;</br>
		<br>&nbsp;</br>

		<div class="col-sm-4">
			<button type="submit" name="submit" class="btn btn-default">제출</button>
			<button type="cancel" name="cancel" class="btn btn-default">취소</button>
		</div>
	</form>
	<%@include file="../common_footer.jsp"%>
</body>
</html>