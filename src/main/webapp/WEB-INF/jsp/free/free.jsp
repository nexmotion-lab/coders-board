<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="/lib/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/js/auth/free.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="/lib/admin/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link href="/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <title>free</title>
</head>
<body>
<%--해더부분--%>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="d-flex">
    <%@ include file="/WEB-INF/jsp/common/leftMenu.jsp" %>
    <%--main-content--%>
    <main class="flex-grow-1 p-4">
        <div class="card mb-5">
            <div class="card-header" style="display: flex; justify-content: space-between; align-items: center;">
                <h3 class="card-title mt-2">자유게시판</h3>
                <button type="button" class="btn btn-primary">
                    <a href="/freeWrite" class="nav-link">작성</a>
                </button>
            </div>

            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="width: auto">NO</th>
                        <th style="width: auto">제목</th>
                        <th style="width: auto">작성자</th>
                        <th style="width: auto">등록일</th>
                        <th style="width: auto">첨부파일</th>
                        <th style="width: auto">조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1.</td>
                        <td>Update software</td>
                        <td>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>1.</td>
                        <td>Update software</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

<script src="/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/lib/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/auth/free.js"></script>
<script>
    $(document).ready(function () {
        // AJAX를 사용하여 서버에서 데이터를 가져옵니다.
        $.ajax({
            url: 'http://localhost:8080/free/select',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                // 서버에서 받아온 데이터를 동적으로 추가합니다.
                populateTable(data);
            },
            error: function (error) {
                console.log('Error:', error);
            }
        });
    });

    function populateTable(data) {
        var tableBody = $('#freeTableBody');
        tableBody.empty(); // 테이블 내용 초기화

        // 받아온 데이터를 테이블에 동적으로 추가합니다.
        for (var i = 0; i < data.length; i++) {
            var row = '<tr>';
            row += '<td>' + (i + 1) + '</td>';
            row += '<td>' + data[i].postTitle + '</td>';
            row += '<td>' + data[i].postAuthor + '</td>';
            row += '<td>' + data[i].postDate + '</td>';
            row += '<td>' + data[i].attachment + '</td>';
            row += '<td>' + data[i].postHit + '</td>';
            row += '</tr>';

            tableBody.append(row);
        }
    }
</script>
</body>
</html>
