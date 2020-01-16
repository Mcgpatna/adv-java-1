<%-- 
    Document   : newjsp
    Created on : 14 Jan, 2020, 6:15:45 PM
    Author     : rmn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="db" uri="/WEB-INF/tlds/DBListTLD.tld" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSS/sidebarCSS.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <nav class="navbar" id="navID">
                <button type="button" onclick="toggleSidebar(this)" class="toggle-collapse" id="toggle-button">
                    <span class="toggle-icon"></span>
                </button>
                
                <ul class="side-nav">
                    <li class="nav-item">
                        <a href="#" class="site-name">Exotica Travels</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">My Account</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">Travel Blogs</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">About</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">FAQs</a>
                    </li>
                </ul>
            </nav>
       </div>
        <script src="javascript/sidebar.js"></script>
        hello
        <db:DBListTagHandler tablename="Hotels" colname="Hotelname">hello</db:DBListTagHandler>
        
    </body>
</html>
