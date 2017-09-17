<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!--
	DB와 연동 후 작업해야함!



-->
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/common_header.jsp"%>

	<title>Worker's Job List</title>
</head>
<body>
	<div>
		<table class="table table-striped">
			<thead> <tr> <th>번호</th> <th>제목</th> <th>작성자</th> <th>소속</th> <th>우선순위</th> <th>상태</th> </tr> </thead>
			<tbody>
				<tr> <th scope="row">1</th> <td>Mark</td> <td>Otto</td> <td>@mdo</td> <td>@mdo</td> <td>@mdo</td> </tr>
			</tbody>
		</table>
	</div><!-- /example -->

	<%@include file="/common_footer.jsp"%>

</body>


</html>