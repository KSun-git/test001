<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>validationException</title>
</head>
<body>
	<div>올바르지 않은 요청이거나, 유효하지 않은 입력값 때문에 요청이 정상적으로 처리되지 않았습니다.</div>
	<div>${exception.message}</div>
</body>
</html>