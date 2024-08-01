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
		<title>PopupLayout1Template</title>
	</head>
	<body id="popup-page-top">
		<!-- Page Wrapper -->
		<div id="popup-wrapper">
			
			<!-- Content Wrapper -->
			<div id="popup-content-wrapper" class="d-flex flex-column">
				
				<!-- popup Content -->
            	<div id="popup-content">
					<tiles:insertAttribute name="header" />
					<tiles:insertAttribute name="body" />
				</div>
				<!-- //Main Content -->
				
				<!-- footer -->
				<tiles:insertAttribute name="footer" />
			</div>
			
		</div>
		<!-- //Page Wrapper -->
		
		<%@ include file="/WEB-INF/jsp/common/include/bootstrapSB.jspf" %>
	</body>
</html>