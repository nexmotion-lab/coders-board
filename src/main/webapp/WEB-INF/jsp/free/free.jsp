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

<div class="tw-mt-[127px] tw-w-full tw-flex tw-flex-row tw-w-full tw-max-w-[80%] lg:tw-min-w-[1250px] tw-items-start tw-justify-between tw-mx-auto tw-gap-[30px] !tw-z-[99]">  <%@ include file="/WEB-INF/jsp/common/leftMenu.jsp" %>
    <%--main-content--%>
    <main class="flex-grow-1 p-4">
        <div class="card mb-5">
            <div class="card-header tw-bg-[#0B3479]" style="display: flex; justify-content: space-between; align-items: center;">
                <h3 class="card-title mt-2" style="color: white;">자유게시판</h3>
                <button type="button" class="btn btn-primary">
                    <a href="/freeWrite" class="nav-link">작성</a>
                </button>
            </div>

            <div class="card-body" id="freeTableBody">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th style="width: 13%">NO</th>
                            <th style="width: 23%">제목</th>
                            <th style="width: 23%">작성자</th>
                            <th style="width: 23%">등록일</th>
                            <th style="width: 8%">조회수</th>
                        </tr>
                    </thead>
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
    var offset = 0;
    var limit = 10;

    $(document).ready(function () {
        // 초기 데이터 로드
        loadMoreData();

        // 스크롤 이벤트 감지
        $(window).scroll(function () {
            // 스크롤이 페이지 하단에 도달하면 추가 데이터 로드
            if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
                loadMoreData();
            }
        });
    });

    function loadMoreData() {
        // AJAX를 사용하여 서버에서 데이터를 가져옵니다.
        $.ajax({
            url: '/free/select',
            type: 'GET',
            data: {
                offset: offset,
                limit: limit
            },
            success: function (data) {
                // Check if data is not empty
                if (data && data.data) {
                    // 서버에서 받아온 데이터를 동적으로 추가합니다.
                    populateTable(data.data);
                    // offset을 업데이트하여 다음 데이터를 가져올 위치 설정
                    offset += limit;
                } else {
                    console.log('Error: No data received from the server.');
                }
            },
            error: function (error) {
                console.log('Error:', error);
            }
        });
    }

    function populateTable(data) {
        var tableBody = $('#freeTableBody');
        var tableContent = '<table class="table table-bordered"><tbody>';

        // 받아온 데이터를 테이블에 동적으로 추가합니다.정
        for (var i = 0; i < data.length; i++) {
            tableContent += '<tr>';
            tableContent += '<td style="width: 13%">' + data[i].postId + '</td>';
            tableContent += '<td style="width: 23%">' + data[i].postTitle + '</td>';
            tableContent += '<td style="width: 23%">' + data[i].postAuthor + '</td>';
            tableContent += '<td style="width: 23%">' + data[i].postDate + '</td>';
            tableContent += '<td style="width: 8%">' + data[i].postHit + '</td>';
            tableContent += '</tr>';
        }

        tableContent += '</tbody></table>';
        tableBody.append(tableContent);
    }
</script>

</body>
</html>
