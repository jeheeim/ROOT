<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 025.jsp</title>

    <link href="bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"> 
</head>

<body>
<h3>복구계획 추가</h3><p>
<!-- form태그로 input의 내용들을 묶음
readonly 태그는 해당 input 내용을 변경할 수 없게 설정. -->
<form>
    <table style="width: 40%; height: 80%;" border="1">
    <tbody>
    <tr>
    <td style="width: 17%;">복구대상</td>
    <td><input name="target" type="textbox" style="width: 100%;" readonly></td>
    </tr>
    <tr>
    <td>복구시간</td>
    <td><input name="time" type="textbox" style="width: 100%;" readonly></td>
    </tr>
    <tr>
    <td>작업자</td>
    <td><input name="worker" type="textbox" style="width: 100%;" readonly></td>
    </tr>
    <tr>
    <td>복구방법</td>
    <td><input name="method" type="textbox" style="width: 100%;" readonly></td>
    </tr>
    <td>비고</td>
    <td><input name="other" type="textbox" style="width: 100%;" readonly></td>
    </tr>
    </tbody>
    </table>

    <br><br>

    <a class="btn btn-default" href="#" role="button">수정</a>&nbsp;&nbsp;
    <a class="btn btn-default" href="#" role="button">삭제</a>&nbsp;&nbsp;
    <a class="btn btn-default" href="#" role="button">취소</a>
    </form>

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>