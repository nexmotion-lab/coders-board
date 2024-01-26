<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <title>삼육대학교 컴퓨터공학부</title>
</head>
<body>
<%--해더부분--%>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="tw-mt-[127px] tw-w-full tw-flex tw-flex-row tw-w-full tw-max-w-[80%] lg:tw-min-w-[1250px] tw-items-start tw-justify-between tw-mx-auto tw-gap-[30px] !tw-z-[99]" >
    <%@ include file="/WEB-INF/jsp/common/leftMenu.jsp" %>

    <%--main-content--%>
    <main class="tw-flex tw-flex-col tw-items-center tw-justify-center tw-min-h-[calc(100vh-150px)]">
        <div class="tw-flex tw-items-center tw-justify-center tw-gap-[30px] tw-mb-[40px]">
            <img src="${pageContext.request.contextPath}/img/suya.png" alt="삼육대학교 마스코트 이미지" class="tw-w-[15%]">
            <img src="${pageContext.request.contextPath}/img/suya.png" alt="삼육대학교 마스코트 이미지" class="tw-w-[15%]">
        </div>
        <p class="tw-text-[#0B3479] !tw-text-[26px] tw-font-[800] tw-leading-[160%] tw-tracking-[-0.8px] tw-mb-[5px]">환영합니다! </p>
        <p class="tw-text-[#0B3479] !tw-text-[21px] tw-font-[800] tw-leading-[160%] tw-tracking-[-0.8px]">
            삼육대학교 컴퓨터공학부입니다.
        </p>
    </main>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
