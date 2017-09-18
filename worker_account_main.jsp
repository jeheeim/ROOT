<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>업무 담당자 ID</title>

    <!-- 부트스트랩 -->
    <link href="bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="worker_account_main.css" rel="stylesheet">
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
    <script src="js/bootstrap.min.js"></script>

    <div class="col-sm-1"></div>
    <div class="col-sm-9">
    <form class="form-horizontal">
    <table class="table table-striped">
      <thead>
      <tr>
        <th colspan = "3"><p class="text-center">내가 할일</th>
        <th colspan = "4"><p class="text-center">서비스 요청 현황</th>
      </tr>
      </thead>
      <tbody>
        <tr>
          <td colspan = "3"><p class="text-center">No. 내가 할일</td>
          <td colspan = "4"><p class="text-center">No. 서비스 요청 현황</td>
        </tr>
      </tbody>
      <thead>
      <tr>
        <th><p class="text-center">인시던트</th>
        <th><p class="text-center">변경 관리</th>
        <th><p class="text-center">릴리즈 관리</th>

        <th><p class="text-center">신규</th>
        <th><p class="text-center">접수</th>
        <th><p class="text-center">작업중</th>
        <th><p class="text-center">완료</th>
      </tr>
      </thead>
      <tbody>
        <td><p class="text-center">No. 인시던트</td>
        <td><p class="text-center">No. 변경관리</td>
        <td><p class="text-center">No. 릴리즈관리</td>

        <td><p class="text-center">No. 신규</td>
        <td><p class="text-center">No. 접수</td>
        <td><p class="text-center">No. 작업중</td>
        <td><p class="text-center">No. 완료</td>
      </tbody>
    </table>
    </form>
    </div>
<!--
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-3"><table class="blueTable">
            <thead>
              <tr>
                <th>내가 할 일</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>내가 할 일 리스트</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="col-md-4"><table class="blueTable">
            <thead>
              <tr>
                <th>서비스 현황</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>서비스 현황 리스트</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-1"></div>
      </div>  <!--<div class="row">-->
<!--
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-1"></div>
        <div class="col-md-3"><table class="blueTable">
            <thead>
              <tr>
                <th>인시던트 관리</th>
                <th>변경 관리</th>
                <th>릴리즈 관리</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>No. 인시던트 관리</td>
                <td>No. 변경 관리</td>
                <td>No. 릴리즈 관리</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="col-md-4"><table class="blueTable">
            <thead>
              <tr>
                <th>신규</th>
                <th>접수</th>
                <th>작업중</th>
                <th>완료</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>No. 신규</td>
                <td>No. 접수</td>
                <td>No. 작업중</td>
                <td>No. 완료</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-1"></div>
      </div>  <!--<div class="row">-->
<!--
    </div>
-->
  </body>
</html>