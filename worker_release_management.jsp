<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 027.jsp is release management</title>

    <link href="bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"> 
</head>

<body>
<!-- Main Table -->
    <table style="width: 100%;" border="1">
    <tbody>
    <tr>
    <td style="width: 16%;"> 번호</td>
    <td style="width: 17%;"><input name="number" type="textbox" style="width: 100%;"></td>
    <td style="width: 17%;"> 제목</td>
    <td style="width: 50%" colspan="3"><input name="title" type="textbox" style="width: 100%;"></td>
    </tr>
    <tr>
    <td>접 수경로</td>
    <td><input name="path" type="textbox" style="width: 100%;"></td>
    <td style="width: 34%;" colspan="2">&nbsp;</td>
    <td style="width: 17%;"> 상태</td>
    <td style="width: 16%;">
        <select name="status" style="width: 100%;">
        <option value="accept">접수</option>
        <option value="incident">인시던트</option>
        <option value="change">변경</option>
        <option value="release">릴리즈</option>
        </select></td>
    </tr>
    <tr>
    <td style="width: 16%;"> 접수자</td>
    <td style="width: 17%;"><input name="worker" type="textbox" style="width: 100%;"></td>
    <td style="width: 17%;"> 소속</td>
    <td style="width: 16%;"><input name="belong" type="textbox" style="width: 100%;"></td>
    <td style="width: 17%;"> 직급</td>
    <td style="width: 17%;"><input name="class" type="textbox" style="width: 100%;"></td>
    </tr>
    <tr>
    <td> 연락처</td>
    <td><input name="tel" type="textbox" style="width: 100%;"></td>
    <td> 요청일시</td>
    <td><input name="request_date" type="textbox" style="width: 100%;"></td>
    <td> 목표기한</td>
    <td><input name="deadline_date" type="textbox" style="width: 100%;"></td>
    </tr>
    <tr>
    <td> 문제범위</td>
    <td><input name="problem_size" type="textbox" style="width: 100%;"></td>
    <td> 긴급도</td>
    <td><input name="emergency_rank" type="textbox" style="width: 100%;"></td>
    <td> 우선순위</td>
    <td><input name="first_rank" type="textbox" style="width: 100%;"></td>
    </tr>
    <tr>
    <td> 접수일시</td>
    <td><input name="add_date" type="textbox" style="width: 100%;"></td>
    <td> 완료일시</td>
    <td><input name="end_date" type="textbox" style="width: 100%;"></td>
    <td> 업무시간</td>
    <td><input name="work_hour" type="textbox" style="width: 100%;"></td>
    </tr>
    <tr>
    <td> 내용</td>
    <td colspan="5"><input name="detail" type="textbox" style="width: 100%;"></td>
    </tr>
    <tr>
    <td> 담당자 의견</td>
    <td colspan="5"><input name="mentor_notice" type="textbox" style="width: 100%;"></td>
    </tr>
    <tr>
    <td> 결과</td>
    <td colspan="5"><input name="result" type="textbox" style="width: 100%;"></td>
    </tr>
    </tbody>
    </table>
    <br><br>

    백업계획
    <a class="btn btn-default" href="#" role="button" style="float:right">관리</a><br>

    <table style="width: 100%;" border=1>
    <tr>
    <td> 대상</td>
    <td> 일자</td>
    <td> 장비</td>
    <td> 용량</td>
    <td> 시간</td>
    <td> 작업자</td>
    <td> 비고</td>
    </tr>
    <tr>
    <td colspan="7" align="center"> 방식 </td>
    </tr>
    <!-- MySQL 사용시 반복문 구역 -->
    <tr>
    <td> 대상</td>
    <td> 일자</td>
    <td> 장비</td>
    <td> 용량</td>
    <td> 시간</td>
    <td> 작업자</td>
    <td> 비고</td>
    </tr>
    <tr>
    <td colspan="7" align="center"> 방식 </td>
    </tr>
    <!-- 반복문 구역 종료 -->
    </table>
    <br><br>

    작업일정
    <a class="btn btn-default" href="#" role="button" style="float:right">관리</a><br>

    <table style="width: 100%;" border=1>
    <tr>
    <td> 구분</td>
    <td> 일시</td>
    <td> 작업자</td>
    <td> 비고</td>
    </tr>
    <tr>
    <td colspan="4" align="center"> 세부내역 </td>
    </tr>
    <!-- MySQL 사용시 반복문 구역 -->
    <tr>
    <td> 구분</td>
    <td> 일시</td>
    <td> 작업자</td>
    <td> 비고</td>
    </tr>
    <tr>
    <td colspan="4" align="center"> 세부내역 </td>
    </tr>
    <!-- 반복문 구역 종료 -->
    </table>
    <br><br>

    테스트계획
    <a class="btn btn-default" href="#" role="button" style="float:right">관리</a><br>

    <table style="width: 100%;" border=1>
    <tr>
    <td colspan="2"> 계획일자</td>
    <td colspan="2"> 담당자</td>
    <td colspan="2"> 비고</td>
    </tr>
    <tr>
    <td colspan="3" align="center">테스트케이스</td>
    <td colspan="3" align="center">예상결과</td>
    </tr>
    <!-- MySQL 사용시 반복문 구역 -->
    <tr>
    <td colspan="2"> 계획일자</td>
    <td colspan="2"> 담당자</td>
    <td colspan="2"> 비고</td>
    </tr>
    <tr>
    <td colspan="3" align="center">테스트케이스</td>
    <td colspan="3" align="center">예상결과</td>
    </tr>
    <!-- 반복문 구역 종료 -->
    </table>
    <br><br>

    복구계획
    <a class="btn btn-default" href="#" role="button" style="float:right">관리</a><br>

    <table style="width: 100%;" border=1>
    <tr>
    <td> 복구대상</td>
    <td> 복구시간</td>
    <td> 작업자</td>
    <td> 비고</td>
    </tr>
    <tr>
    <td colspan="4" align="center">복구방법</td>
    </tr>
    <!-- MySQL 사용시 반복문 구역 -->
    <tr>
    <td> 복구대상</td>
    <td> 복구시간</td>
    <td> 작업자</td>
    <td> 비고</td>
    </tr>
    <tr>
    <td colspan="4" align="center">복구방법</td>
    </tr>
    <!-- 반복문 구역 종료 -->
    </table>
    <br><br>

    <a class="btn btn-default" href="#" role="button">목록</a>&nbsp;
    <a class="btn btn-default" href="#" role="button">저장</a>&nbsp;
    <a class="btn btn-default" href="#" role="button">완료</a>

    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>