<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/common_header.jsp"%>
    <title>공지사항</title>
</head>
<body>
<form class="form-horizontal">
    <div class="form-group">
        <label for="inputTitle" class="col-sm-2 control-label">제목</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputTitle" placeholder="제목" readonly>
        </div>
    </div>
    <div class="form-group">
        <label for="inputClient" class="col-sm-2 control-label">등록자</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="inputClient" placeholder="등록자" readonly>
        </div>
    </div>
    <div class="form-group">
        <label for="inputDetail" class="col-sm-2 control-label">내용</label>
        <div class="col-sm-10">
            <textarea class="form-control" rows="8" id="inputDetail" placeholder="내용" readonly></textarea>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-1">
            <button class="btn btn-default" type="submit">목록</button>
        </div>
        <div class="col-sm-1">
            <button class="btn btn-default" type="submit">글쓰기</button>
        </div>
    </div>
</form>
<%@ include file="/common_footer.jsp"%>
</body>
</html>