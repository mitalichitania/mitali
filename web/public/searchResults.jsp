<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Search Results</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/css/skeleton.css" rel="stylesheet">
    <link href="/css/organism.css" rel="stylesheet">
    <link href="/css/custom.css" rel="stylesheet">

    <jsp:useBean id="auctionsLst" class="java.util.ArrayList" scope="request" />
</head>
<body>
<div class="container">
    <%@ include file="../header.jsp" %>
</div>

<div class="custom-container">
    <!-- HEADER STUFF -->


    <!-- end of header row -->

    <table>
        <thead>
        <th>Auction name</th>
        <th>Description</th>
        <th>Lowest bid</th>
        <th></th>
        </thead>
        <c:forEach var="auction" items="${auctionsLst}">
            <tr>
                <td>${auction.name}</td>
                <td>${fn:replace(auction.description, fn:substring(auction.description, 40, fn:length(auction.description)), '...')}</td>
                <td>${auction.lowestBid}</td>
                <td><a class="button button-primary" href=auction.do?action=getAnAuction&aid=${auction.auctionId}>View auction</a></td>
            </tr>
        </c:forEach>
        <c:if test="${auctionsLst.size() == 0}">
            <tr>
                <td>No auctions found.</td>
            </tr>
        </c:if>
    </table>
    <c:if test="${auctionsLst.size() != 0}">
        <div class="row">
            <c:if test="${empty previousPage}">
                <span class="u-unvailable">previous page</span> |
            </c:if>
            <c:if test="${not empty previousPage}">
                <a href="${previousPage}">previous page</a> |
            </c:if>
            <c:if test="${empty nextPage}">
                <span class="u-unvailable">next page</span>
            </c:if>
            <c:if test="${not empty nextPage}">
                <a href="${nextPage}">next page</a>
            </c:if>
        </div>
    </c:if>
    <c:if test="${auctionsLst.size() == 0 and not empty previousPage}">
        <div class="row">
            Last page. Please go to <a href="${previousPage}">previous page</a>
        </div>
    </c:if>
</div>
</body>
</html>
