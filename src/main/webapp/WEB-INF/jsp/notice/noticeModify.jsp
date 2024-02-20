<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <script src="/ckeditor5/build/ckeditor.js"></script>
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="/js/notice/noticeModify.js"></script>
    <script type="text/javascript" src="/js/common/formUtils.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/notice/noticeWrite.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
        .ck-editor__editable { height: 400px; }
        .ck-content { font-size: 12px; }

    </style>
    <title>공지사항 - 삼육대학교 컴퓨터공학부</title>
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
                <h3 class="card-title mt-2" style="color: white;">공지사항</h3>
                <button type="submit" class="btn tw-text-[#0B3479] tw-text-[15px] tw-leading-[150%] tw-tracking-[-0.6px] tw-font-[600]" style="border: none; background-color: white; color: #0B3479;" onclick="submitUpdate()" >
                    수정
                </button>
            </div>
            <div class="card-body">
                <form>
                    <input type="text" id="postTitle" name="postTitle" style="width: 1000px; border: none;" class="p-3 mb-3 bg-secondary-subtle" placeholder="제목을 입력하세요" required><br>
                    <textarea id="postContent" name="postContent" rows="17" style="width: 1140px;" class="p-3" placeholder="내용을 입력하세요" required></textarea><br>
                </form>
            </div>
        </div>
    </main>
</div>
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
