<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--230125 feat: talwind css & gooogle font--%>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<style>
    html,body,p{
        font-family: 'Noto Sans KR', sans-serif !important;
    }
</style>
<%--230125 feat: talwind css & gooogle font__end --%>
<nav class="tw-fixed tw-top-0 tw-left-0 tw-w-full tw-py-[18px] tw-h-[87px] tw-bg-[#0B3479] tw-px-[20px] tw-flex tw-items-center tw-shadow-xl z-1">
    <ul class="navbar-nav tw-flex !tw-flex-row tw-justify-between align-items-center tw-w-full lg:tw-max-w-[80%] lg:tw-min-w-[1250px] tw-mx-auto">
        <li><a href = "/" class="tw-flex tw-items-center tw-gap-[12px] text-decoration-none text-black ">
            <img  src="${pageContext.request.contextPath}/img/main_logo.png" alt="삼육대학교 로고" class="brand-image tw-bg-[#fff] tw-rounded-full ">
            <h2 class="brand-title tw-text-[22px] tw-text-[#FFF] tw-font-[700] tw-leading-[160%] tw-tracking-[-0.6px] !tw-m-[0px] !tw-p-[0px] ">삼육대학교 컴퓨터공학부</h2>
        </a></li>
        <li>
            <a href="#" class="tw-border-[1px] tw-border-[#0B3479] hover:tw-opacity-[0.85] tw-bg-[#fff] tw-rounded-full tw-py-[5px] tw-px-[16px] tw-whitespace-nowrap  tw-flex tw-items-center tw-justify-center">
                <span class="tw-text-[#0B3479] tw-text-[15px] tw-leading-[150%] tw-tracking-[-0.6px] tw-font-[600]">Logout</span>
            </a>
        </li>

        </ul>
</nav>