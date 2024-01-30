<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <script src="/lib/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="/js/free/freeDetails.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="/lib/admin/plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
  <link href="/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <title>자유게시판 - 삼육대학교 컴퓨터공학부</title>
</head>
<body>
<%--해더부분--%>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="tw-mt-[127px] tw-w-full tw-flex tw-flex-row tw-w-full tw-max-w-[80%] lg:tw-min-w-[1250px] tw-items-start tw-justify-between tw-mx-auto tw-gap-[30px] !tw-z-[99]" >
  <%@ include file="/WEB-INF/jsp/common/leftMenu.jsp" %>

  <main class="flex-grow-1 p-0 pb-0">
    <div class="tw-mb-[8px]" style="display: flex; justify-content: space-between; align-items: center;">
      <h3 class="tw-text-[#0B3479] !tw-text-[26px] tw-font-[800] tw-leading-[160%] tw-tracking-[-0.8px]">자유게시판</h3>
      <div class="tw-flex">
        <div class="tw-mr-[8px]">
          <button type="button" class="nav-button !tw-bg-[#0B3479] !tw-text-[#fff] tw-py-[8px] tw-px-[15px] tw-rounded-[4px] hover:tw-opacity-[0.85]" onclick="freeDelete()">
            삭제
          </button>
        </div>
        <button type="button" class="nav-button !tw-bg-[#0B3479] !tw-text-[#fff] tw-py-[8px] tw-px-[15px] tw-rounded-[4px] hover:tw-opacity-[0.85]" onclick="reDirectFreeUpdate()">
          수정
        </button>
      </div>
    </div>
    <div id="postDetail" class="border-top border-bottom border-2 border-secondary mt-3" style="min-height: 75%">
      <!-- 여기에 동적으로 채워질 내용 -->
    </div>
    <div class="p-2">
      <div class="fw-bold mt-2 pointer" onclick="getPrevPost()"> 이전글</div>
      <div class="fw-bold mt-2 pointer" onclick="getNextPost()">다음글</div>
    </div>
  </main>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

<script src="/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>