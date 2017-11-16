<!-- 3페이지에 있는 로그인 화면입니다. 아직 데이터베이스와는 연동되지 않습니다.
	그러나 로그인 버튼, 아이디 찾기, 비밀번호 찾기는 누르면 화면이 이동합니다.
	로그인 구현 안되어 있습니다. 아이디, 비밀번호 찾기 구현 안되어있습니다.
	 -->
<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/common_header.jsp"%>
    <title>ITSM System Login</title>
</head>
<body>
	<!-- 로고 사진을 올리기 -->
	<div class="container">
		<div class="row">
			<div class="col-md-5">
			</div>
	  		<div class="col-md-4">
	   			 <img src=".\g4_logo.png" alt="" class="img-responsive img-rounded">
	  		</div>  
		</div>
	</div>
	<!-- 로그인 창 만들기 -->
    <div class="container">
        <div class="row">
			<div class="col-md-3">
			</div>
            <div class="col-md-6">
                <div class="login-box well">
                    <form accept-charset="UTF-8" role="form" method="post" action="loginProcess.jsp">
                        <legend>로그인</legend>
                        <div class="form-group">
							<label for="username-email">아이디</label>
                            <input name="user_id" value='' id="username-email" placeholder="E-mail or Username" type="text" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="password">비밀번호</label>
                            <input name="password" id="password" value='' placeholder="Password" type="password" class="form-control" />
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="Login" />
                        </div>
                        <span class='text-center'><a href="/bbs/index.php?mid=index&act=dispMemberFindAccount" class="text-sm">아이디 찾기</a></span>
                        <hr />
                        <span class='text-center'><a href="/bbs/index.php?mid=index&act=dispMemberFindAccount" class="text-sm">비밀번호 찾기</a></span>
                        <hr />
                    </form>
                </div>
            </div>
        </div>
    </div>
 
	<%@ include file="/common_footer.jsp"%>
</body>
</html>