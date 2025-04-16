<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="dto.BoardDto" %>
<%
    BoardDto board = (BoardDto)request.getAttribute("board");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>�Խñ� �󼼺���</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <script>
    // ���� �������� �̵�
    function goModify() {
        location.href = "<%= request.getContextPath() %>/modifyBoard?boardNo=<%= board.getBoardNo() %>";
    }

    // ���� ���
    function goDelete() {
        var pw = prompt("��й�ȣ�� �Է��ϼ���");
        if (pw != null && pw != "") {
            location.href = "<%= request.getContextPath() %>/deleteBoard?boardNo=<%= board.getBoardNo() %>&boardPw=" + encodeURIComponent(pw);
        }
    }
    </script>
</head>
<body class="bg-light">

<div class="container py-5">
    <h1 class="text-center mb-4">�Խñ� �󼼺���</h1>

    <!-- ���� �޽��� ��� -->
    <%
        String error = request.getParameter("error");
        if ("2".equals(error)) {
    %>
        <div class="alert alert-danger text-center" role="alert">
            ��й�ȣ�� ��ġ���� �ʽ��ϴ�.
        </div>
    <%
        }
    %>

    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <h2 class="mb-0"><%= board.getBoardTitle() %></h2>
        </div>
        <div class="card-body">
            <p class="mb-2"><strong>�ۼ��� :</strong> <%= board.getBoardUser() %></p>
            <p class="mb-2"><strong>�ۼ��� :</strong> <%= board.getBoardDate() %></p>
            <hr>
            <p class="card-text" style="white-space: pre-wrap;"><%= board.getBoardContent() %></p>
        </div>
    </div>

    <div class="mt-4 d-flex justify-content-center
