<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="/js/notice/notice.js"></script>
    <link href="/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <title>공지사항 - 삼육대학교 컴퓨터공학부</title>
</head>
<body>
<%--해더부분--%>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="tw-mt-[127px] tw-w-full tw-flex tw-flex-row tw-w-full tw-max-w-[80%] lg:tw-min-w-[1250px] tw-items-start tw-justify-between tw-mx-auto tw-gap-[30px] !tw-z-[99]" >
    <%@ include file="/WEB-INF/jsp/common/leftMenu.jsp" %>

    <%--main-content--%>
    <main class="tw-w-full">
        <div class="tw-w-full">
            <div class="tw-mb-[8px] tw-flex tw-f tw-justify-between">
                <h3 class="tw-text-[#0B3479] !tw-text-[26px] tw-font-[800] tw-leading-[160%] tw-tracking-[-0.8px]">자료실</h3>
                <div class="tw-border-solid tw-border-b-2 tw-border-b-[#0B3479] tw-flex tw-items-end tw-p-0.5">
                    <form name="search-form" autocomplete="off">
                        <select class="tw-font-[800] tw-leading-[160%] tw-tracking-[-0.8px] tw-pr-3" name="type">
                            <option selected value="all">전체</option>
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                        </select>
                        <label for="keyword">
                            <input type="text" name="keyword" id="keyword" value=""/>
                            <button>
                                <i class="fas fa-search tw-text-[#0B3479] tw-font-[800] tw-px-1 hover:!tw-opacity-[0.7]"></i>
                            </button>
                        </label>
                    </form>
                </div>
            </div>
            <div class="card-body tw-rounded-[8px] tw-overflow-hidden tw-shadow-md !tw-border-[1px] !tw-border-[#dfdfdf] tw-mb-[12px]">
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
            <div class="card-footer tw-w-full  tw-flex justify-content-between tw-items-center tw-mb-[70px]">
                <div class="tw-opacity-0 tw-z-[-1]">blind</div>
                <div class="card-footer clearfix">
                    <ul id="page" class="pagination pagination-sm m-0 float-right">

                    </ul>
                </div>
                <div class="button-wrapper">
                    <a href="/attachWrite" class="nav-link !tw-bg-[#0B3479] !tw-text-[#fff] tw-py-[8px] tw-px-[15px] tw-rounded-[4px] hover:tw-opacity-[0.85]">
                        <span>
                            작성
                        </span>
                    </a>
                </div>
            </div>
        </div>
    </main>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
