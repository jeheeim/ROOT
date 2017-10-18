<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="/common_header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>게시판</title>
</head>
<body>

<%
    final int ROWSIZE = 4; // 한페이지에 보일 게시물 수
    final int BLOCK = 5; // 아래에 보일 페이지 최대개수 1~5 / 6~10 / 11~15 식으로 5개로 고정

    int pg = 1; //기본 페이지값

    if(request.getParameter("pg")!=null){ //받아온 pg값이 있을때, 다른페이지일때
        pg = Integer.parseInt(request.getParameter("pg")); // pg값을 저장
    }
    int start = (pg*ROWSIZE) - (ROWSIZE-1); // 해당페이지에서 시작번호(step2)
    int end = (pg*ROWSIZE); // 해당페이지에서 끝번호(step2)

    int allPage = 0; // 전체 페이지수

    int startPage = ((pg-1)/BLOCK*BLOCK)+1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6)
    int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10)
%>

<%
    String dburl = "jdbc:mysql://localhost:3306/itsmdb";
    // 사용하려는 데이터베이스명을 포함한 URL 기술
    String dbuser = "root";
    // 사용자 계정
    String dbpw = "1234";
    // 사용자 계정의 패스워드
    int total = 0;
    try
    {
        Class.forName("com.mysql.jdbc.Driver").newInstance();

        Connection conn = DriverManager.getConnection(dburl,dbuser,dbpw);;
        Statement stmt = conn.createStatement();
        Statement stmt2 = conn.createStatement();

        String sqlCount = "SELECT COUNT(*) FROM notice";
        ResultSet rs = stmt.executeQuery(sqlCount);
        String sql = null;

        if(rs.next()){
            total = rs.getInt(1);
        }

        int sort = 1;
        String sqlSort = "SELECT NUM from notice order by ref desc, step asc";
        rs = stmt.executeQuery(sqlSort);

        while(rs.next()){
            int stepNum = rs.getInt(1);
            sql = "UPDATE notice SET STEP2=" + sort + "where NUM =" +stepNum;
            stmt2.executeUpdate(sql);
        }
        rs.close();
        out.print("총 게시물 : " + total + "개");

        String sqlList = "SELECT num, created, title, account_id, isdeleted from notice order by NUM DESC";
        rs = stmt.executeQuery(sqlList);

%>

<table class="table table-striped">
    <thead>
    <tr> <th>번호</th> <th>제목</th> <th>일시</th> <th>작성자</th> <th>부서명</th> </tr>
    </thead>
    <tbody>
    <%
        if(total==0) {
    %>
    <tr>
        <td colspan="5">등록된 글이 없습니다.</td>
    </tr>
    <%
    } else {

        while(rs.next()) {
            int idx = rs.getInt(1);
            String created = rs.getString(2);
            created = created.substring(0,10);
            String title = rs.getString(3);
            String account_id = rs.getString(4);
            int isDeleted = rs.getInt(5);
            if(isDeleted == 1){continue;}

    %>
    <tr>
        <th><%=idx %></th>
        <td><a href="/mainPage.jsp?mod=203&idx=<%=idx%>"><%=title%></a></td>
        <td><%=created%></td>
        <td><%=account_id%></td>
        <td>Sample Department</td>
    </tr>
    <%
                }
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch(SQLException e) {
            out.println( e.toString() );
        }
    %>
    </tbody>
</table>

<div class="col-sm-1" id="control">
    <div class="btn-group" role="group" aria-label="...">
        <a href="/mainPage.jsp?mod=202" class="btn btn-default" type="button" role="button">글쓰기</a>
    </div>
</div>
</body>
</html>



<!--출처: http://seinarin.tistory.com/3 [행복을 찾아서]-->