<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
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
	<table border width="100%">
		<tr width>
			<td width="10%">번호</td>
			<td width="10%">number</td>
			<td width="10%"></td>
			<td width="10%">제목</td>
			<td width="60% "colspan="6">title</td>
		</tr>
		<tr>
			<td width="10%">고객</td>
			<td width="20%" colspan="2">client</td>
			<td width="10%">접수경로</td>
			<td width="10%">route</td>
			<td width="10%">접수자</td>
			<td width="10%">worker</td>
			<td width="10%"></td>
			<td width="10%"></td>
			<td width="10%"></td>
		</tr>
		<tr>
			<td width="10%">요청일시</td>
			<td width="30%" colspan="3">request date</td>
			<td></td>
			<td width="10%">목표기한</td>
			<td width="30%" colspan="3">goal date</td>
			<td></td>
		</tr>
		<tr>
			<td width="10%">문제범위</td>
			<td width="20%" colspan="2">problem range</td>
			<td width="10%">긴급도</td>
			<td width="20%" colspan="2">urgency</td>
			<td width="10%">우선순위</td>
			<td width="20%" colspan="2">priority</td>
			<td width="10%"></td>
		</tr>
		<tr>
			<td width="10%">내용</td>
			<td width="90%" colspan="9">
				<textarea id="text" style="width:100%; resize:none; overflow:hidden;" readonly onfocus="this.blur()"></textarea>
			</td>
		</tr>
		<tr>
			<td width="10%">접수자 의견</td>
			<td width="90%" colspan="9">
				<textarea id="text" style="width:100%; resize:none; overflow:hidden;" readonly onfocus="this.blur()"></textarea>
			</td>
		</tr>
	</table>

	<%@include file="/common_footer.jsp"%>
</body>
</html>