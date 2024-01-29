<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="/js/attach/attach.js"></script>
    <script type="text/javascript" src="/js/attach/attachWrite.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <title>자료실 - 삼육대학교 컴퓨터학과</title>
</head>
<body>
<%--해더부분--%>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="tw-mt-[127px] tw-w-full tw-flex tw-flex-row tw-w-full tw-max-w-[80%] lg:tw-min-w-[1250px] tw-items-start tw-justify-between tw-mx-auto tw-gap-[30px] !tw-z-[99]" >
    <%@ include file="/WEB-INF/jsp/common/leftMenu.jsp" %>

    <%--main-content--%>
    <main class="tw-w-full">
        <div class="tw-w-full">
            <div class="tw-mb-[8px]">
                <h3 class="tw-text-[#0B3479] !tw-text-[26px] tw-font-[800] tw-leading-[160%] tw-tracking-[-0.8px]">자료실</h3>
            </div>
            <div class="card-body tw-rounded-[8px] tw-overflow-hidden tw-shadow-md !tw-border-[1px] !tw-border-[#dfdfdf] tw-mb-[22px]">
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
                <style>
                    thead tr th{
                        padding: 18px 15px !important;
                    }
                    #posts tr td{
                        cursor: pointer;
                        text-align: center;
                        padding: 16px 15px !important;
                        font-size: 16px;
                        letter-spacing: -0.6px;
                        line-height: 150% !important;
                        font-weight: 400 !important;
                    }
                    #posts tr td:nth-child(2){
                        cursor: pointer;
                        text-align: left;
                    }
                    #posts tr:hover{
                        opacity: 0.75 !important;
                    }
                    #posts tr:hover > td{
                       text-decoration: underline !important;
                    }
                </style>
            </div>
            <div class="card-footer tw-w-full  tw-flex justify-content-between tw-items-center">
                <div class="tw-opacity-0 tw-z-[-1]">blind</div>
                <div class="pagination-wrapper">
                    <ul class="pagination pagination-sm tw-flex tw-flex-row tw-items-center tw-gap-[8px]">
                        <li class="page-item">
                            <button class="page-link-button hover:!tw-opacity-[0.7] tw-h-[40px] tw-flex tw-items-center !tw-bg-[# fff] !tw-border-[1px] !tw-border-[#0B3479] !tw-rounded-[6px] !tw-text-[15px] !tw-text-[#0B3479] !tw-px-[15px] !tw-leading-[160%] !tw-tracking-[-0.8px] !tw-font-[500]" id="prevButton" type="button">
                            &lt; 이전
                            </button>
                        <li class="page-item">
                            <button class="page-link-button hover:!tw-opacity-[0.7] tw-h-[40px] tw-flex tw-items-center !tw-bg-[# fff] !tw-border-[1px] !tw-border-[#0B3479] !tw-rounded-[6px] !tw-text-[15px] !tw-text-[#0B3479] !tw-px-[15px] !tw-leading-[160%] !tw-tracking-[-0.8px] !tw-font-[500]" id="nextButton" type="button">
                             다음 &gt;
                            </button>
                        </li>
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
