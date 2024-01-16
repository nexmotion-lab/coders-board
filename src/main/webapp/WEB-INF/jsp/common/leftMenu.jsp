<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<aside class="sidebar col-md-2 d-md-block p-0" style="padding-left: 0;">
    <!-- Sidebar -->
    <div>
        <!-- menu logo -->
        <a href="" class="brand-link d-flex justify-content-center">
            <img src="${pageContext.request.contextPath}/img/menu_logo.png" alt="Logo" style="opacity: .8;">
        </a>

        <!-- Sidebar Menu -->
        <nav>
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item ${menu2 == 'announcement' ? 'active' : ''}" id="announcement">
                    <a href="/notice" class="nav-link">
                        <p>
                            <b>공지사항</b>
                        </p>
                    </a>
                </li>

                <li class="nav-item ${menu2 == 'reference' ? 'active' : ''}" id="reference">
                    <a href="/" class="nav-link ">
                        <p>
                            <b>자료실</b>
                        </p>
                    </a>
                </li>

                <li class="nav-item ${menu2 == 'forum' ? 'active' : ''}" id="forum">
                    <a href="/" class="nav-link">
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