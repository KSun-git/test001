<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
		<meta name="description" content="">
		<meta name="author" content="">
		<%@ include file="/WEB-INF/jsp/common/include/jsInc.jspf" %>
		<title>Layout1Template</title>
	</head>
	<body>
		<div id="layout1Template">
			<!-- 헤더 -->
			<tiles:insertAttribute name="header" />
			<!-- 본문 -->
			<div id="contentWrap">
				<tiles:insertAttribute name="body" />
			</div>
			<!-- 푸터 -->
			<tiles:insertAttribute name="footer" />
		</div>
	</body>
</html>