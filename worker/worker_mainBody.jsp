<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../dbLogin.jspf"%>

<%
/*
이 페이지에 대한 설명
이 페이지는 작업자의 기본 페이지로 작업자 id로 로그인할 경우 가장 먼저 보게되는 화면이다.
이 화면은 작업자에게 배정된 전체 업무의 수와 인시던트 상태의 업무의 수, 변경관리 상태의 업무의 수, 릴리즈 관리 상태의 업무의 수를 보여준다.

또 지금 전체 작업 수를 보여주는데 이는 월, 주별로 보여주도록 설정할지 결정해야한다.
지금 회사 전체의 업무의 수와 아직 담당자가 배정되지않은 업무의 수, 막 담당자가 배정된 업무의 수, 작업중인 업무의 수, 완료된 업무의 수를 보여준다.

이 현황판은 표로 구성되어있으며 이 표에서 해당하는 요소는 해당하는 업무들을 검색할 수 있도록 되어있다.
내 업무 전체 수가 적힌 셀을 클릭하면 내 업무 전체 리스트를 볼 수 있고
인시던트 수의 셀은 인시던트 업무들을, 변경관리는 변경관리 리스트를 볼수 있다.

각 링크는 메인 페이지에 패러미터로 mod값과 param을 넘겨준다.
mod 값은 102와 104로
102는 내 업무 리스트를 의미하고
104는 전체 업무를 의미한다.

param값은 mod값 102와 104에서 의미가 다른데
mod값이 102인 경우에서는
0은 내 전체 업무
1은 인시던트 업무
2는 변경관리 업무
3은 릴리즈 관리 업무를 의미한다.

mod값이 104인 경우에서는
0은 전체 업무 리스트
1은 신규 업무 리스트
2는 막 배정된 업무 리스트
3은 작업중인 업무 리스트
4는 완료된 업무 리스트를 가리킨다.
*/


// db작업 해야한다.
int myTask = 0;
int task_on_queue = 1;

int myIncident = 2;
int myChange = 3;
int myRelease = 4;

int task_new = 5;
int task_assigned = 6;
int task_on_progress = 7;
int task_finished = 8;
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Worker's Main Body</title>
	<%@include file="../common_header.jsp"%>
</head>

<body>
	<div class="col-sm-1"></div>
    <div class="col-sm-9">
    	<table class="table table-striped" style="text-align:center;">
			<thead><tr>
        		<th colspan = "3"><p align="center">내가 할일</p></th>
        		<th colspan = "4"><p align="center">서비스 요청 현황</p></th>
			</tr></thead>
		
			<tbody><tr>
				<td colspan = "3" style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=102&param=0'">
					<%=myTask%>
				</td>
				
				<td colspan = "4" style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=104&param=0'">
					<%=task_on_queue%>
				</td>
			</tr></tbody>

			<thead><tr>
				<th><p align="center">인시던트</p></th>
				<th><p align="center">변경 관리</p></th>
				<th><p align="center">릴리즈 관리</p></th>
				<th><p align="center">신규</p></th>
				<th><p align="center">접수</p></th>
				<th><p align="center">작업중</p></th>
				<th><p align="center">완료</p></th>
			</tr></thead>

      		<tbody>
		        <td style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=102&param=1'">
					<%=myIncident%>
				</td>

		        <td style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=102&param=2'">
					<%=myChange%>
				</td>

		        <td style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=102&param=3'">
					<%=myRelease%>
				</td>


        		<td style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=104&param=1'">
					<%=task_new%>
				</td>
				
				<td style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=104&param=2'">
					<%=task_assigned%>
				</td>
				
				<td style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=104&param=3'">
					<%=task_on_progress%>
				</td>
        		
				<td style="cursor:pointer" onClick="location.href='/mainPage.jsp?mod=104&param=4'">
					<%=task_finished%>
				</td>
      		</tbody>
    	</table>
    </div>

	<%@include file="../common_footer.jsp"%>
</body>
</html>