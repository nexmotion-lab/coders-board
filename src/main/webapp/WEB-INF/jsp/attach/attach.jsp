<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="/js/attach/attach.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <title>자료실</title>
</head>
<body>
<%--해더부분--%>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="d-flex">
    <%@ include file="/WEB-INF/jsp/common/leftMenu.jsp" %>

    <%--main-content--%>
    <main class="flex-grow-1 p-4">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">자료실</h3>
            </div>

            <div class="card-body">
                <div>test</div>
                <div id="result"></div>
                <c:if test="${not empty attachList}">
                    <table border="1">
                        <thead>
                        <tr>
                            <th>Post ID</th>
                            <th>Author</th>
                            <th>Title</th>
                            <th>Date</th>
                            <!-- 필요한 열들을 추가 -->
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="attach" items="${attachList}">
                            <tr>
                                <td>${attach.postId}</td>
                                <td>${attach.postAuthor}</td>
                                <td>${attach.postTitle}</td>
                                <td>${attach.postDate}</td>
                                <!-- 필요한 열들을 추가 -->
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
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
                    <p>ajax Test</p>
                    <c:forEach var="attach" items="${attachList}">
                        <tr>
                            <td>${attach.postId}</td>
                            <td>${attach.postTitle}</td>
                            <td>${attach.postAuthor}</td>
                            <td>${attach.postDate}</td>
                            <td>첨부파일</td>
                            <td>${attach.postHit}</td>
                            <!-- 다른 필요한 컬럼들 추가 -->
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 float-right">
                    <li class="page-item"><a class="page-link" href="#">«</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">»</a></li>
                </ul>
                <button>작성</button>
            </div>
        </div>
    </main>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
