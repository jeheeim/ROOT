<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>client ID</title>

    <!-- 부트스트랩 -->
    <link href="/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/worker/worker_mainBody.css" rel="stylesheet">
    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
<body>
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>

	<table class="table table-bordered" style="width: 100%;">
    	<tr>
    		<td style="width: 10%;"> 번호</td>
    		<td style="width: 10%;"> (number)</td>
    		<td style="width: 10%;"> 제목</td>
    		<td style="width: 50%;"> (title)</td>
    		<td style="width: 10%;"> 상태</td>
    		<td style="width: 10%;"> (state)</td>
    	</tr>
    	<tr>
			<td style="width: 10%;"> 요청자 </td>
			<td style="width: 10%;"> </td>
    		<td style="width: 10%;"> 접수경로</td>
    		<td style="width: 10%;"></td>
    	</tr>
		<tr>
			<td style="width: 10%;"> 분류</td>
			<td style="width: 10%;"> 카테고리</td>
		</tr>
    	<tr>
			<td style="width: 10%;"> 문제범위</td>
			<td> (개인, 부서, 회사)</td>
			<td style="width: 10%;"> 긴급도</td>
			<td> (1~3등급)</td>
			<td style="width: 10%;"> 우선순위</td>
			<td> (1~3등급)</td>
		</tr>
		<tr>
			<td style="width: 10%;">담당자</td>
			<td>이름, 소속, 직급, 연락처</td>
		</tr>
		<tr>
			<td style="width: 10%;">내용</td>
			<td>(내용)</td>
		</tr>
		<tr>
			<td style="width: 10%;">접수자 의견</td>
			<td>(접수자 의견)</td>
		</tr>
		<tr>
			<td style="width: 10%;">등록일자</td>
			<td>Date</td>
			<td style="width: 10%;">기한</td>
			<td>Date</td>
		</tr>
		<tr>
			<td style="width: 10%;"접수일자</td>
			<td>Date</td>
			<td style="width: 10%;">완료</td>
			<td>Date</td>
		</tr>
		<tr>
			<td style="width: 10%;">조치내역</td>
			<td>TextBox</td>
		</tr>
	</table>
	<button class="btn btn-default">목록으로</button>
</body>
</html>