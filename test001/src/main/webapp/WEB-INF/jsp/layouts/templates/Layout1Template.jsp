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
	<body id="page-top">
		<!-- Page Wrapper -->
		<div id="wrapper">
			<!--사이드메뉴 -->
			<tiles:insertAttribute name="snbMenu" />
			
			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">
				
				<!-- Main Content -->
            	<div id="content">
					<tiles:insertAttribute name="header" />
					<div class="container-fluid">
						<tiles:insertAttribute name="body" />
					</div>
				</div>
				<!-- //Main Content -->
				
				<!-- footer -->
				<tiles:insertAttribute name="footer" />
			</div>
			
		</div>
		<!-- //Page Wrapper -->
		
		<!-- Scroll to Top Button-->
	    <a class="scroll-to-top rounded" href="#page-top">
	        <i class="fas fa-angle-up"></i>
	    </a>
	    
		<tiles:insertAttribute name="logoutModal" />
		<%@ include file="/WEB-INF/jsp/common/include/bootstrapSB.jspf" %>
	</body>
</html>