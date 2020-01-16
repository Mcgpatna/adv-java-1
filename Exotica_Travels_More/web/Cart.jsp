<%-- 
    Document   : Cart
    Created on : 30 Dec, 2019, 5:03:08 PM
    Author     : rmn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="ct" uri="/WEB-INF/tlds/UserNameTLD.tld" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
    </head>
    <body>
        <jsp:include page="Template1.jsp"></jsp:include>
        <td valign='top' rowspan="200" colspan="80">
        <table>
            <tr>
                <c:set var="Destination" value="${sessionScope.selDestination}"/>
                <c:set var="Hotel" value="${sessionScope.selHotel}"/>
                <c:set var="NumberOfDays" value="${sessionScope.numDays}"/>
                <c:set var="Airline" value="${sessionScope.selAirline}"/>
                <%--<c:choose>
                    <c:when test="${Hotel == 'Sea View'}">
                        <c:set var="HotelPrice" value="150"/>
                    </c:when>
                    <c:when test="${Hotel == 'Sea Breeze'}">
                        <c:set var="HotelPrice" value="100"/>
                    </c:when>
                </c:choose> --%>
                <c:set var="destprice" value="${sessionScope.destPrice}"/>
                <%--<c:choose>
                    <c:when test="${Airline == 'British Airways'}">
                        <c:set var="TicketPrice" value="100"/>
                    </c:when>
                    <c:when test="${Airline == 'Cathay Pacific'}">
                        <c:set var="TicketPrice" value="120"/>
                    </c:when>
                    <c:when test="${Airline == 'US Airways'}">
                        <c:set var="TicketPrice" value="130"/>
                    </c:when>
                    <c:when test="${Airline == 'Quantas'}">
                        <c:set var="TicketPrice" value="150"/>
                    </c:when>
                </c:choose> --%>
                <c:set var="HotelPrice" value="${sessionScope.hotelPrice}" />
                <c:set var="TicketPrice" value="${sessionScope.airlinePrice}" />
                <c:set var="TotalHotelPrice" value="${HotelPrice*NumberOfDays + destprice}"/>
                <c:set var="TotalPackagePrice" value="${TotalHotelPrice+TicketPrice}"/>
                
                <td><font color='darkblue' size='+1'><a href='<c:url value="ConstructionPage.jsp"/>'>Domestic Flights</a></td>
                <td><font color='darkblue' size='+1'><a href='<c:url value="ConstructionPage.jsp"/>'>International Flights</a></td>
                <td><font color='darkblue' size='+1'><a href='<c:url value="ConstructionPage.jsp"/>'>Hotels</a></td>
                <td><font color='darkblue' size='+1'><a href='<c:url value="ConstructionPage.jsp"/>'>Car Rentals</a></td>
                <td><font color='darkblue' size='+1'><a href='<c:url value="TourPackage.jsp"/>'>Tour Packages</a></td>
                <td width="350">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <ct:UserNameTagHandler/>
            </tr>
        </table>
            
         <br>
        <font align='center' color='darkblue' size='+1'>You have added following contents to your cart:
        <br>
        <br>
        
        <table cellspacing="10" align="center" border="2" bordercolor="white">
            <tr>
                <td bordercolor="white">Destination:</td>
                <td colspan="2" bordercolor="white"><c:out value="${Destination}"/></td>
            </tr>
            <tr>
                <td bordercolor="white">Hotel:</td>
                <td colspan="2" bordercolor="white"><c:out value="${Hotel}"/></td>
            </tr>
            <tr>
                <td bordercolor="white">Total number of days for stay:</td>
                <td colspan="2" bordercolor="white"><c:out value="${NumberOfDays}"/></td>
            </tr>
            <tr>
                <td bordercolor="white">Airline:</td>
                <td colspan="2" bordercolor="white"><c:out value="${Airline}"/></td>
            </tr>
            <tr>
                <td bordercolor="white"><b>Total package cost:</b></td>
                <td colspan="2" bordercolor="white"><b><fmt:formatNumber type="Currency" value="${TotalPackagePrice}" /></td>
            </tr>
            <tr>
                <td>
                    <form action="CartServlet" method="post">
                        <input type="submit" class="fadeIn fourth" value="Confirm">
                        <input type="hidden" name="price" value="${TotalPackagePrice}" />
                    </form>
                </td>
            </tr>
        </table      
    </body>
</html>
