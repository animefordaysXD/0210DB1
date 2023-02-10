<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
	text-decoration: none;
}

table {
	width: 500px;
	border-collapse: collapse;
	text-align: center;
}

table, tr, td {
	border: 1px solid black;
	padding: 3px
}

div {
	width: 600px;
	margin: auto;
	text-align: center;
}
</style>
<script type="text/javascript">
function update_go(f){
	f.action="MyController?cmd=update";
	f.submit();
}function delete_go(f){
	f.action="MyController?cmd=delete";
	f.submit();
}
</script>
</head>
<h2>방명록 : 내용화면</h2>
<hr>
<body>
	<p>
		[<a href="/03_guestBook/MyController?cmd=list">목록으로 이동</a>]
	</p>
	<form method="post">
		<table>
			<tr align="center">
				<td bgcolor="#99ccff">작성자</td>
				<td>${vo.name }</td>
			</tr>
			<tr align="center">
				<td bgcolor="#99ccff">제 목</td>
				<td>${vo.subject }</td>
			</tr>
			<tr align="center">
				<td bgcolor="#99ccff">email</td>
				<td>${vo.email }</td>
			</tr>
			<tr style="text-align: left;">
				<td colspan="2">
			<pre style="padding-left: 15px;">
				${vo.content }
			    </pre>
				</td>
				</tr>
			<tfoot>
				<tr align="center">
				<td colspan="2">
				
				<input type="hidden" name="idx" value="${vo.idx }">
				
				<input type="button" value="삭제" onclick="delete_go(this.form)">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="수정" onclick="update_go(this.form)">
				
				</td>

					
				</tr>
			</tfoot>
		</table>
	</form>


</body>
</html>