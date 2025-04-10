<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.*, model.*, dto.*"%>
<%@ include file="/navbar.jsp"%>
<%
    // 파라미터 수집
    String y = request.getParameter("y");
    String m = request.getParameter("m");
    String d = request.getParameter("d");

    if (y == null || m == null || d == null) {
        response.sendRedirect("monthlist.jsp");
        return;
    }

    // 날짜 문자열 만들기
    String targetDate = String.format("%s-%02d-%02d", y, Integer.parseInt(m), Integer.parseInt(d));

    // DAO 호출
    CashDAO cashDao = new CashDAO();
    CashDTO cashDto = new CashDTO();
    cashDto.setCashDate(targetDate);
    ArrayList<CashDTO> cashList = cashDao.selectDateList(cashDto); 

    ReceiptDAO recepitDao = new ReceiptDAO(); // 영수증 DAO
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= targetDate %> 내역</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container bg-white shadow rounded p-4">
        <h3><%= targetDate %> 수입/지출 내역</h3>
        <table class="table table-hover mt-4 text-center">
            <thead class="table-primary">
                <tr>
                    <th>수입</th>
                    <th>금액</th>
                    <th>메모</th>
                    <th>영수증 유/무</th>
                </tr>
            </thead>
            <tbody>
<%
    if (cashList.isEmpty()) {
%>
                <tr>
                    <td colspan="4">내역이 없습니다.</td>
                </tr>
<%
    } else {
        for (CashDTO c : cashList) {
            // 각 cashNo에 대해 영수증 조회
            ReceiptDTO receipt = recepitDao.selectReceiptByCashNo(c.getCashNo());
            String filename = (receipt != null) ? receipt.getFilename() : null;
%>
                <tr onclick="location.href='cash/cashOne.jsp?cashNo=<%= c.getCashNo() %>&y=<%= y %>&m=<%= m %>&d=<%= d %>'" style="cursor: pointer;">
                    <td><%= c.getCategoryDTO().getKind() %></td>
                    <td><%= c.getAmount() %>원</td>
                    <td><%= c.getMemo() %></td>
                    <td>
                        <%= (filename != null && !filename.isEmpty()) ? "🧾" : "❌" %>
                    </td>
                </tr>
<%
        }
    }
%>
            </tbody>
        </table>

        <a href="monthList.jsp?targetMonth=<%= Integer.parseInt(m) %>" class="btn btn-outline-secondary">← 달력으로</a> 
        <a class="btn btn-outline-primary" href="cash/insertCashForm.jsp?y=<%= y %>&m=<%= m %>&d=<%= d %>">
            <i class="fa-solid fa-plus"></i> 등록
        </a>
    </div>
</body>
</html>
