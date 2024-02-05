<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<aside class="sidebar col-md-2 d-md-block p-0" style="padding-left: 0;">

    <!-- Sidebar -->
    <div class="vh-100">
        <div class="tw-w-full tw-flex tw-flex-col tw-items-center tw-shadow-md tw-rounded-[4px] tw-p-[20px] tw-bg-[#0B3479] tw-mb-[10px]">
            <div class="tw-w-full tw-flex tw-flex-row tw-items-center tw-gap-[10px] tw-mb-[20px]">
                <div class="tw-w-[40px] tw-aspect-square tw-bg-[#fff] tw-rounded-full"></div>
                <div class="tw-flex-row">
                    <c:set var="isAdmin" value="false" />
                    <c:forEach var="authority" items="${pageContext.request.userPrincipal.authorities}">
                        <c:if test="${authority.authority eq 'ROLE_ADMIN'}">
                            <c:set var="isAdmin" value="true" />
                        </c:if>
                    </c:forEach>
                    <p class="tw-text-[#fff] tw-text-[14px]">
                        <span class="!tw-text-[12px]">
                            <c:choose>
                                <c:when test="${isAdmin eq 'true'}">[ 관리자 ] </c:when>
                                <c:otherwise>[ 사용자 ]</c:otherwise>
                            </c:choose>
                        </span>
                    </p>
                    <p class="tw-text-[#fff] tw-text-[14px]"><span class="!tw-text-[19px]"><sec:authentication property="principal.memberName"/></span> 님</p>
                </div>
            </div>
            <div class="tw-w-full tw-flex tw-flex-row tw-justify-center tw-items-center tw-gap-[15px]">
                <a class="tw-text-[#fff] tw-text-[14px] hover:tw-opacity-[0.8] hover:tw-underline">마이페이지</a>
                <a onclick="logout()" role="button" class="tw-text-[#fff] tw-text-[14px] hover:tw-opacity-[0.8] hover:tw-underline">로그아웃</a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav>
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <ul class="nav nav-pills nav-sidebar flex-column " data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item ${menu2 == 'announcement' ? 'active' : ''}" id="announcement">
                    <a href="/notice" class="nav-link">
                        <p>
                            <b>공지사항</b>
                        </p>
                    </a>
                </li>

                <li class="nav-item ${menu2 == 'reference' ? 'active' : ''}" id="reference">
                    <a href="/attach" class="nav-link ">
                        <p>
                            <b>자료실</b>
                        </p>
                    </a>
                </li>

                <li class="nav-item ${menu2 == 'forum' ? 'active' : ''}" id="forum">
                    <a href="/free" class="nav-link">
                        <p>
                            <b>자유게시판</b>
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>