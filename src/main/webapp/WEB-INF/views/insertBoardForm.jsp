<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>�۾���</title>
</head>
<body>
    <h1>�۾���</h1>
    <form method="post" action="${pageContext.request.contextPath}/insertBoard">
        ��й�ȣ: <input type="password" name="boardPw" required><br>
        ����: <input type="text" name="boardTitle" required><br>
        ����: <textarea name="boardContent" rows="5" cols="50" required></textarea><br>
        �ۼ���: <input type="text" name="boardUser" required><br>
        <input type="submit" value="���">
    </form>
</body>
</html>
