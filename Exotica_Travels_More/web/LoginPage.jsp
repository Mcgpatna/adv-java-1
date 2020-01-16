<%-- 
    Document   : LoginPage
    Created on : 30 Dec, 2019, 5:00:39 PM
    Author     : rmn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSS/cssfile1.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="Template1.jsp"></jsp:include>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active"> Login Form </h2>

                <!-- Login Form -->
                <html:form action="/ValidateAction" method="post">
                    <B>User ID:</B>
                    <html:text property="userid" styleClass="fadeIn second" alt="user id"/>
                    <B>Password:</B>
                    <html:password property="password" styleClass="fadeIn third"/>

                    <html:radio property="r1" value="administrator"/>Administrator
                    <html:radio property="r1" value="customer"/>Customer<br><br>

                    <input type="submit" class="fadeIn fourth" value="Submit">
                    <input type="reset" class="fadeIn fourth" text="Reset">
                </html:form>
            </div>
        </div>     
    </body>
</html>
