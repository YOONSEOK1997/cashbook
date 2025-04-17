<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>�۾���</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <h1 class="text-center mb-4"> �� �۾���</h1>

    <div class="card shadow-sm">
        <div class="card-body">
            <form method="post" action="${pageContext.request.contextPath}/insertBoard">
                <div class="mb-3">
                    <label for="boardPw" class="form-label">��й�ȣ</label>
                    <input type="password" class="form-control" id="boardPw" name="boardPw" required>
                </div>

                <div class="mb-3">
                    <label for="boardTitle" class="form-label">����</label>
                    <input type="text" class="form-control" id="boardTitle" name="boardTitle" required>
                </div>

                <div class="mb-3">
                    <label for="boardContent" class="form-label">����</label>
                    <textarea class="form-control" id="boardContent" name="boardContent" rows="5" required></textarea>
                </div>

                <div class="mb-3">
                    <label for="boardUser" class="form-label">�ۼ���</label>
                    <input type="text" class="form-control" id="boardUser" name="boardUser" required>
                </div>

                <div class="d-flex justify-content-end gap-2">
                    <button type="submit" class="btn btn-primary">���</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/boardList.jsp'">�������</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS (����) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
