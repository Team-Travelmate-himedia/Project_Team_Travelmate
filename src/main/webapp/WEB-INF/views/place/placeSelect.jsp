<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Search</title>
    <link rel="stylesheet" href="/css/sider.css">
    <link rel="stylesheet" href="/css/place.css">
</head>
<body>
<!-- 좌측 STEP 메뉴 -->
<div class="sidebar">
    <button class="step-button" onclick="location.href='placeSelect'">STEP 1<br>장소 선택</button>
    <button class="step-button" onclick="location.href='hotelSelect'">STEP 2<br>숙소 선택</button>
    <button class="step-button" onclick="showContent('step4')">STEP 3<br>찜꽁</button>
    <button class="step-button" onclick="showContent('step5')">STEP 4<br>일정</button>
</div>


<!-- Main Content -->
<div class="main-content">
    <h1>제주 여행 계획</h1>
    <div class="places-list">
        <c:forEach var="place" items="${placeList}">
            <div class="place-card">
                <img src="/place_images/${place.savefilename}" alt="${place.place_name}">
                <div class="place-info">
                    <h3>${place.place_name}</h3>
                    <p>${place.place_description}</p>
                    <button class="add-button">+</button>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</div>
</body>
</html>





















<%--<div id="morePlace">--%>
<%--    <button class="placeList" onclick="location.href='placeList?first=true'">더보기</button>--%>
<%--</div>--%>


<%--<!-- Best Places -->--%>
<%--<div id="main-content">--%>
<%--    <div id="BestPlace">--%>
<%--        <h3>Best Places</h3>--%>
<%--        <div class="places">--%>
<%--            <c:forEach items="${bestList}" var="place">--%>
<%--                <div class="item">--%>
<%--                    <img src="/place_images/${place.savefilename}" alt="${place.place_name}"--%>
<%--                         onclick="location.href='placeDetail?place_seq=${place.place_seq}'">--%>
<%--                    <div class="place-info">--%>
<%--                        <h4>${place.place_name}</h4>--%>
<%--                        <p>${place.place_description}</p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- Hot Places -->--%>
<%--    <div id="HotPlace">--%>
<%--        <h3>Hot Places</h3>--%>
<%--        <div class="places">--%>
<%--            <c:forEach items="${hotList}" var="place">--%>
<%--                <div class="item">--%>
<%--                    <img src="/place_images/${place.savefilename}" alt="${place.place_name}"--%>
<%--                         onclick="location.href='placeDetail?place_seq=${place.place_seq}'">--%>
<%--                    <div class="place-info">--%>
<%--                        <h4>${place.place_name}</h4>--%>
<%--                        <p>${place.place_description}</p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:forEach>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

</body>
</html>
