<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<!--
well{
	min-height:20px;
	padding:19px;
	margin-bottom:20px;
	background-color:#f5f5f5;
	border:1px solid #e3e3e3;
	border-radius:4px;
	-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.05);
	box-shadow:inset 0 1px 1px rgba(0,0,0,.05)
}
.well blockquote{
	border-color:#ddd;
	border-color:rgba(0,0,0,.15)
}
.well-lg{
	padding:24px;
	border-radius:6px
}.well-sm{
	padding:9px;
	border-radius:3px
}
-->
<head>
	<title>인시던트</title>
	<%@include file="/common_header.jsp"%>
	<script>
var observe;
if (window.attachEvent)
{
observe = function (element, event, handler)
{
element.attachEvent('on'+event, handler);
};
}
else
{
observe = function (element, event, handler)
{
element.addEventListener(event, handler, false);
    		};
		}
		function init ()
		{
    		var text = document.getElementById('text');
    		function resize ()
			{
        		text.style.height = 'auto';
        		text.style.height = text.scrollHeight+'px';
    		}
/* 0-timeout to get the already changed text */
    
	function delayedResize ()
	{
		window.setTimeout(resize, 0);
	}
    	
		observe(text, 'change',  resize);
		observe(text, 'cut',     delayedResize);
	observe(text, 'paste',   delayedResize);
	observe(text, 'drop',    delayedResize);
	observe(text, 'keydown', delayedResize);

	text.focus();
	text.select();
    resize();
}
	</script>
</head>
<body onload="init();">
	<form class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-1 control-label">번호</label>
			<div class="col-sm-2">
				<div class="well well-sm">Number</div>
			</div>
			<label class="col-sm-1 control-label">제목</label>
			<div class="col-sm-5">
				<div class="well well-sm">제목은 이거다</div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">고객</label>
			<div class="col-sm-2">
				<div class="well well-sm">client</div>
			</div>
			<label class="col-sm-1 control-label">접수경로</label>
			<div class="col-sm-2">
				<div class="well well-sm">route</div>
			</div>

			<label class="col-sm-1 control-label">접수자</label>
			<div class="col-sm-2">
				<div class="well well-sm">worker</div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">요청일시</label>
			<div class="col-sm-2">
				<div class="well well-sm">Request Date</div>
			</div>
			<div class="col-sm-3"></div>
			<label class="col-sm-1 control-label">목표기한</label>
			<div class="col-sm-2">
				<div class="well well-sm">Deadline Date</div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">문제범위</label>
			<div class="col-sm-2">
				<div class="well well-sm">range</div>
			</div>
			<label class="col-sm-1 control-label">긴급도</label>
			<div class="col-sm-2">
				<div class="well well-sm">emergency</div>
			</div>
			<label class="col-sm-1 control-label">우선순위</label>
			<div class="col-sm-2">
				<div class="well well-sm">priority</div>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">내용</label>
			<div class="col-sm-8">
				<textarea class="well well-sm" readonly>이런
				어떻게 쓰라는
				거야</textarea>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-1 control-label">담당자 의견</label>
			<div class="col-sm-8">
				<div class="well well-sm">
					담당자의 의견이 들어가는 곳인데
					얼마나 넣어야
					textarea 처럼 나오는 것일까
				</div>
			</div>
		</div>
	</form>
	<%@include file="/common_footer.jsp"%>
</body>
</html>