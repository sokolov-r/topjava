<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ru">
<head>
    <title>Meals</title>
</head>
<body>
<h3><a href="index.html">Home</a></h3>
<hr>
<h2>Meals</h2>
</body>
<table border="1">
    <caption>Список еды</caption>
    <tr>
        <th>Дата</th>
        <th>Описание</th>
        <th>Калории</th>
    </tr>
    <c:forEach items="${mealsTo}" var="item">
        <tr style="color:${item.excess ? ' red':' green'}">
            <td>${dateTimeFormatter.format(item.dateTime)}</td>
            <td>${item.description}</td>
            <td>${item.calories}</td>
        </tr>
    </c:forEach>
</table>
</html>