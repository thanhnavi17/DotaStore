<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	var values="Test,Prof,Off";
	$.each(values.split(","), function(i,e){
	    $("#strings option[value='" + e + "']").prop("selected", true);
	});
});
</script>
</head>
<body>
<select name='strings' id="strings" multiple style="width:100px;">
    <option value="Test">Test</option>
    <option value="Prof">Prof</option>
    <option value="Live">Live</option>
    <option value="Off">Off</option>
    <option value="On">On</option>
</select>
</body>
</html>