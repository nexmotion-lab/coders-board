<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="/lib/jquery-3.6.0.min.js"></script>
    <script src="/ckeditor5/build/ckeditor.js"></script>
    <script type="text/javascript" src="/js/free/freeWrite.js"></script>
    <link rel="stylesheet" href="/lib/admin/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .ck-editor__editable { height: 400px; }
        .ck-content { font-size: 12px; }
    </style>
    <title>자유게시판</title>
</head>
<body>
<%--해더부분--%>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="tw-mt-[127px] tw-w-full tw-flex tw-flex-row tw-w-full tw-max-w-[80%] lg:tw-min-w-[1250px] tw-items-start tw-justify-between tw-mx-auto tw-gap-[30px] !tw-z-[99]" >
    <%@ include file="/WEB-INF/jsp/common/leftMenu.jsp" %>

    <%--main-content--%>
    <main class="flex-grow-1 p-0">
        <div class="card">
            <div class="card-header tw-bg-[#0B3479]" style="display: flex; justify-content: space-between; align-items: center;">
                <h3 class="card-title mt-2" style="color: white;">자유게시판</h3>
                <button type="submit" class="btn tw-text-[#0B3479] tw-text-[15px] tw-leading-[150%] tw-tracking-[-0.6px] tw-font-[600]" style="border: none; background-color: white; color: #0B3479;" onclick="submitForm()">
                    <a href="/free" class="nav-link">등록</a>
                </button>
            </div>

            <div class="card-body">

                <form>
                    <input type="text" id="postTitle" name="postTitle" style="width: 1000px; border: none;" class="p-3 mb-3 bg-secondary-subtle" placeholder="제목을 입력하세요" required><br>
                    <textarea id="postContent" name="postContent" style="width: 900px" rows="17" class="p-3" placeholder="내용을 입력하세요" required></textarea><br>
                </form>

            </div>

        </div>
    </main>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

<script src="/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>