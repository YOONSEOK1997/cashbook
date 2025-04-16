<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, dto.BoardDto" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>�Խ��� </title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  
</head>
<body class="bg-light">

    <div class="container py-5">
        <h1 class="text-center mb-4"> �Խ���</h1>

        <div class="text-end mb-3">
            <a href="insertBoard" class="btn btn-success">�۾���</a>
        </div>

        <table class="table table-bordered table-hover bg-white">
            <thead class="table-success text-center">
                <tr>
                    <th>��ȣ</th>
                    <th>����</th>
                    <th>�ۼ���</th>
                    <th>�ۼ���</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<BoardDto> list = (ArrayList<BoardDto>)request.getAttribute("list");
                    for (BoardDto b : list) {
                %>
                <tr class="text-center align-middle">
                    <td><%= b.getBoardNo() %></td>
                    <td class="text-start">
                        <a href="boardOne?boardNo=<%= b.getBoardNo() %>" class="text-decoration-none text-dark">
                            <%= b.getBoardTitle() %>
                        </a>
                    </td>
                    <td><%= b.getBoardUser() %></td>
                    <td><%= b.getBoardDate() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <%
            int currentPage = (Integer)request.getAttribute("currentPage");
            int lastPage = (Integer)request.getAttribute("lastPage");
        %>

        <nav class="d-flex justify-content-center align-items-center mt-4">
            <ul class="pagination">
                <% if (currentPage > 1) { %>
                <li class="page-item">
                    <a class="page-link" href="boardList?currentPage=<%= currentPage - 1 %>">����</a>
                </li>
                <% } else { %>
                <li class="page-item disabled">
                    <span class="page-link">����</span>
                </li>
                <% } %>

                <li class="page-item active">
                    <span class="page-link">
                        <%= currentPage %> / <%= lastPage %>
                    </span>
                </li>

                <% if (currentPage < lastPage) { %>
                <li class="page-item">
                    <a class="page-link" href="boardList?currentPage=<%= currentPage + 1 %>">����</a>
                </li>
                <% } else { %>
                <li class="page-item disabled">
                    <span class="page-link">����</span>
                </li>
                <% } %>
            </ul>
        </nav>
    </div>

    <!-- Bootstrap JS (����: ��� �� �� �� �ʿ�) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
 