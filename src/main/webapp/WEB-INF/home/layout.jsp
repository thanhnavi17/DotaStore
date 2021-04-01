<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=1200, initial-scale=1" name="viewport">

        <title>Chuyên dịch vụ DOTA2</title>
        <link rel="icon" href="http://fsvalue.com/img/favicon_fs.ico" type="image/gif" sizes="16x16">

        <script src="https://use.fontawesome.com/85f8281779.js"></script>

        <link href="css/lib/slick.min.css" rel="stylesheet">
        <link href="css/lib/bootstrap.min.css" rel="stylesheet">
        <link href="css/uikit.modify.css" rel="stylesheet">
        <link href="css/reset.css" rel="stylesheet">
        <link href="css/library.css" rel="stylesheet">
        <link href="http://fsvalue.com/css/front/billing.css" rel="stylesheet">
        <link href="http://fsvalue.com/css/front/styles.css" rel="stylesheet">
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/lib/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/lib/slick.min.js"></script>
        <script type="text/javascript" src="js/uikit.min.js"></script>
        <script type="text/javascript" src="http://fsvalue.com/js/front/common_script.js"></script>
        <script type="text/javascript" src="http://fsvalue.com/js/front/newsite_script.js"></script>
        <link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<script type="text/javascript">
$(window).scroll(function() {
    if($(this).scrollTop() > 50) $('#goTop').stop().animate({ bottom: '10px' }, 200);
    else $('#goTop').stop().animate({ bottom: '-60px' }, 200);
});
$(document).ready(function() {
    $('#goTop, .goTop-page').click(function(event) {
        event.preventDefault();
        $('html, body').animate({scrollTop: 0},500);
    });
});
</script>
</head>
<body id="wrapper">

	<!-- Khai báo sử dụng header -->
	<tiles:insertAttribute name="header"/>
	<main class="app-content">
    <!-- Khai báo sử dụng body -->
	<tiles:insertAttribute name="body"/>
   	</main>
   	<!-- Khai báo sử dụng footer -->
   	<tiles:insertAttribute name="footer"/>
</body>

</html>