<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 업무추가 </title>

    <link href="bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"> 
</head>

<body>

<form>
<!-- Main Table -->
    <table style="width: 100%;" border="1">
        <tr>
        <td> 제목</td>
        <td colspan="5"><input name="title" type="textbox" style="width: 100%;"></td>
        </tr>

        <tr>
        <td> 접수경로</td>
        <td>
            <select name="path" style="width: 100%;">
            <option value="email">이메일</option>
            <option value="telephone">전화</option>
            <option value="meeting">회의</option>
        </select>
        </td>
        <td> 소속</td>
        <td><input name="belong" type="textbox" style="width: 100%;"></td>
        <td> 요청자</td>
        <td><input name="req_person" type="textbox" style="width: 100%;"></td>
        </tr>

        <tr>
        <td> 연락처</td>
        <td><input name="tel" type="textbox" style="width: 100%;">
        </td>
        <td> 목표기한</td>
        <td><input name="deadline_date" type="date" style="width: 100%;"></td>
        <td colspan="2">&nbsp;</td>
        </tr>

        <tr>
        <td> 문제범위</td>
        <td>
            <select name="problem_size" style="width: 100%;">
            <option value="person">개인</option>
            <option value="group">부서</option>
            <option value="whole">회사</option>
        </select>
        </td>
        <td> 긴급도</td>
        <td>
            <select name="emergency_rank" style="width: 100%;">
            <option value="rank1">1등급</option>
            <option value="rank2">2등급</option>
            <option value="rank3">3등급</option>
        </select>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        </tr>

        <tr>
        <td> 내용</td>
        <td colspan="5"><textarea name="detail" rows="5" style="width: 100%;"></textarea></td>
        </tr>

        <tr>
        <td> 담당자 의견</td>
        <td colspan="5"><textarea name="mentor_notice" rows="3" style="width: 100%;"></textarea></td>
        </tr>

    </table>

    <p style="float:left; left:50%; position:relative;">
    <a class="btn btn-default" href="#" role="button">등록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a class="btn btn-default" href="#" role="button">취소</a>
    </p>

    </form>

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>