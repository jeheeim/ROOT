<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@include file="/common_header.jsp"%>
	<title>New Task</title>
</head>
<body>
	<form class="form-horizontal" action="/notice/addNoticeProcess.jsp" method="post" accept-charset="UTF-8">
  		<div class="form-group">
    		<label for="inputTitle" class="col-sm-2 control-label">제목</label>
    		<div class="col-sm-10">
      			<input type="text" class="form-control" name="inputTitle" placeholder="제목">
    		</div>
  		</div>
		<div class="form-group">
    		<label for="inputDetail" class="col-sm-2 control-label">내용</label>
    		<div class="col-sm-10">
				<textarea class="form-control" rows="8" name="inputDetail" placeholder="내용"></textarea>
    		</div>
  		</div>
  		<div class="form-group">
    		<div class="col-sm-offset-2 col-sm-1">
    			<button href="/notice/addNoticeProcess.jsp" type="submit" class="btn btn-default">등록</button>
    		</div>
			<div class="col-sm-1">
    			<a href="/mainPage.jsp?mod=201" type="reset" class="btn btn-default">취소</a>
    		</div>
  		</div>
	</form>
	<%@include file="/common_footer.jsp"%>
</body>
</html>