<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="/lib/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/js/free/free.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link href="/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <title>자유게시판</title>
</head>
<body>
<%--해더부분--%>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="tw-mt-[127px] tw-w-full tw-flex tw-flex-row tw-w-full tw-max-w-[80%] lg:tw-min-w-[1250px] tw-items-start tw-justify-between tw-mx-auto tw-gap-[30px] !tw-z-[99]" >
    <%@ include file="/WEB-INF/jsp/common/leftMenu.jsp" %>

    <%--main-content--%>
    <main class="tw-w-full">
        <div class="tw-w-full">
            <div class="tw-mb-[8px]" style="display: flex; justify-content: space-between; align-items: center;">
                <h3 class="tw-text-[#0B3479] !tw-text-[26px] tw-font-[800] tw-leading-[160%] tw-tracking-[-0.8px]">자유게시판</h3>
                <button type="button">
                    <a href="/freeWrite" class="nav-link !tw-bg-[#0B3479] !tw-text-[#fff] tw-py-[8px] tw-px-[15px] tw-rounded-[4px] hover:tw-opacity-[0.85]">작성</a>
                </button>
            </div>
            <div class="card-body  tw-rounded-[8px] tw-overflow-hidden tw-shadow-md !tw-border-[1px] !tw-border-[#dfdfdf] tw-mb-[22px]">
                <table class="table table-bordered table-striped !tw-m-[0px]">
                    <colgroup>
                        <col class="tw-w-[10%]">
                        <col class="tw-w-[35%]">
                        <col class="tw-w-[15%]">
                        <col class="tw-w-[20%]">
                        <col class="tw-w-[10%]">
                        <col class="tw-w-[10%]">
                    </colgroup>
                    <thead>
                    <tr class="tw-bg-[#0B3479]">
                        <th class="!tw-bg-[#0B3479] !tw-border-none !tw-text-[#fff] !tw-text-[18px] !tw-font-[600] !tw-tracking-[-0.8px] !tw-leading-[150%] tw-text-center" style="width: auto">NO</th>
                        <th class="!tw-bg-[#0B3479] !tw-border-none !tw-text-[#fff] !tw-text-[18px] !tw-font-[600] !tw-tracking-[-0.8px] !tw-leading-[150%] tw-text-center" style="width: auto">제목</th>
                        <th class="!tw-bg-[#0B3479] !tw-border-none !tw-text-[#fff] !tw-text-[18px] !tw-font-[600] !tw-tracking-[-0.8px] !tw-leading-[150%] tw-text-center" style="width: auto">작성자</th>
                        <th class="!tw-bg-[#0B3479] !tw-border-none !tw-text-[#fff] !tw-text-[18px] !tw-font-[600] !tw-tracking-[-0.8px] !tw-leading-[150%] tw-text-center" style="width: auto">등록일</th>
                        <th class="!tw-bg-[#0B3479] !tw-border-none !tw-text-[#fff] !tw-text-[18px] !tw-font-[600] !tw-tracking-[-0.8px] !tw-leading-[150%] tw-text-center" style="width: auto">첨부파일</th>
                        <th class="!tw-bg-[#0B3479] !tw-border-none !tw-text-[#fff] !tw-text-[18px] !tw-font-[600] !tw-tracking-[-0.8px] !tw-leading-[150%] tw-text-center" style="width: auto">조회수</th>
                    </tr>
                    </thead>
                    <tbody id="posts">
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

<script src="/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
