<%-- 
    Document   : WelcomeCustomerPage
    Created on : 30 Dec, 2019, 5:01:35 PM
    Author     : rmn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ct" uri="/WEB-INF/tlds/UserNameTLD.tld" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Page</title>
    </head>
    <body>
        <jsp:include page="Template1.jsp"></jsp:include>
        <td valign='top' rowspan='200' colspan='80'>
        <div align="right"><ct:UserNameTagHandler/></div>
        <font color='darkblue' size='+2'>Welcome to the Exotica Travels Website!!</font>
  
        <table>
            <tr><td><font color='darkblue' size='+1'><a href='<c:url value="ConstructionPage.jsp"/>'>Book Domestic Flights</a></td></tr>
            <tr><td><font color='darkblue' size='+1'><a href='<c:url value="ConstructionPage.jsp"/>'>Book International Flights</a></td></tr>
            <tr><td><font color='darkblue' size='+1'><a href='<c:url value="ConstructionPage.jsp"/>'>Book Hotels</a></td></tr>
            <tr><td><font color='darkblue' size='+1'><a href='<c:url value="ConstructionPage.jsp"/>'>Book Car Rentals</a></td></tr>
            <tr><td><font color='darkblue' size='+1'><a href='<c:url value="TourPackage.jsp"/>'>Book Tour Packages</a></td></tr>
        </table>
    </body>
</html>
