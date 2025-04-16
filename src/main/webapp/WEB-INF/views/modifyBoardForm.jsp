<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="dto.BoardDto" %>
<%
    BoardDto board = (BoardDto)request.getAttribute("board");

%>
<%
    String error = request.getParameter("error");
    if (error != null) {
        if (error.equals("1")) {
%>
    <p style="color:red;">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</p>
<%
        } else if (error.equals("2")) {
%>
    <p style="color:red;">������ �����߽��ϴ�. �ٽ� �õ��ϼ���.</p>
<%
        }
    }
%>

<h1>�� ����</h1>
<form method="post" action="<%= request.getContextPath() %>/modifyBoard">
    <input type="hidden" name="boardNo" value="<%= board.getBoardNo() %>">
    ����: <input type="text" name="boardTitle" value="<%= board.getBoardTitle() %>"><br>
    ����: <textarea name="boardContent"><%= board.getBoardContent() %></textarea><br>
    ��й�ȣ: <input type="password" name="boardPw"><br>
    <button type="submit">�����ϱ�</button>
</form>
