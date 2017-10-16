<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html lang="ko">
    <head>
    <%@include file="/common_header.jsp"%>
    </head>
    <body>
    <table class="table table-striped">
    <thead>
    <tr> <th>번호</th> <th>제목</th> <th>일시</th> <th>작성자</th> <th>부서명</th> </tr>
</thead>
<tbody>
<tr> <th scope="row">3</th> <td>Sample Title3</td> <td>Sample Date</td> <td>Sample Writer</td> <td>Sample Department</td> </tr>
<tr> <th scope="row">2</th> <td>Sample Title2</td> <td>Sample Date</td> <td>Sample Writer</td> <td>Sample Department</td> </tr>
<tr> <th scope="row">1</th> <td>Sample Title1</td> <td>Sample Date</td> <td>Sample Writer</td> <td>Sample Department</td> </tr>
</tbody>
</table>

<div class="col-sm-1" id="control">
    <div class="btn-group" role="group" aria-label="...">
    <a href="/mainPage.jsp?mod=202" class="btn btn-default" type="button" role="button">글쓰기</a>
    </div>
    </div>
    <%@include file="/common_footer.jsp"%>
    </body>
    </html>