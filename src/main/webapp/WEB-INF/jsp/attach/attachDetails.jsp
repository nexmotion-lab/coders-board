<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="/js/attach/attachDetails.js"></script>
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
                <div id="postDetail" class="border-top border-bottom border-2 border-secondary mt-3" style="min-height: 75%">
                    <!-- 여기에 동적으로 채워질 내용 -->
                </div>
                <div class="p-2">
                    <div class="fw-bold mt-2" onclick="getPrevPost()"> 이전글</div>
                    <div class="fw-bold mt-2" onclick="getNextPost()">다음글</div>
                </div>
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
        </div>
    </main>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
