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
function delete_ok(f){
var k = "${vo.pwd}";
if(f.pwd.value==k){
	var chk = confirm("정말 삭제할까요?");
	if(chk){
		f.action="MyController?cmd=delete_ok";
		f.submit();
	}else{
		history.go(-1);
	}
}else{
	alert("비밀번호 틀림");
	f.pwd.value = "";
	f.pwd.focus();
	return;
}
}

</script>
</head>
<body>
	<h2>방명록 : 삭제화면</h2>
	<p>
		[<a href="/03_guestBook/MyController?cmd=list">목록으로 이동</a>]
	</p>
	<form method="post">
		<table>
			<tbody>
				<tr>
					<th style="background-color: #99ccff">비밀번호</th>
					<td><input type="password" name="pwd"></td>
				</tr>
				<td colspan="2">
				<input type="button" value="삭제" onclick="delete_ok(this.form)">
				<input type="hidden" name="idx" value="${vo.idx }">
				<input type="hidden" name="cmd" value="delete_ok">
				</td>

			</tbody>
			<tfoot>


			</tfoot>

		</table>
	</form>
</body>
</html>