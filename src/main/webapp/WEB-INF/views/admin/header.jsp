<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">

	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="admin/css/admin.css" />
	<script src="admin/script/admin.js"></script>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#imageAddBtn').click( function(){
				var formselect = $('#fileupForm')[0];   // 지목된 폼을 변수에 저장
				var formData = new FormData( formselect );
				$.ajax(
						{
							url:"<%=request.getContextPath()%>/fileup" ,
							type:"POST",
							enctype:"multipart/form-data",
							data: formData,
							timeout: 10000,
							contentType : false,
							processData : false,

							success: function( data ){
								$('#filename').html("<div>" + data.image + "</div>" );
								$("#filename").append("<img src='place_images/" + data.savefilename + "' height='150'/>");
								$('#image').val( data.image );
								$('#savefilename').val( data.savefilename );
							},
							error:function(){  alert("실패"); },
						}
				);
			});
		});
	</script>

	<script type="text/javascript">
		$(function(){
			$('#imageHotelAddBtn').click( function(){
				var formselect = $('#fileupHotelForm')[0];   // 지목된 폼을 변수에 저장
				var formData = new FormData( formselect );
				$.ajax(
						{
							url:"<%=request.getContextPath()%>/fileupload" ,
							type:"POST",
							enctype:"multipart/form-data",
							data: formData,
							timeout: 10000,
							contentType : false,
							processData : false,

							success: function( data ){
								$('#filename').html("<div>" + data.image + "</div>" );
								$("#filename").append("<img src='/hotel_images/" + data.savefilename + "' height='150'/>");
								$('#image').val( data.image );
								$('#savefilename').val( data.savefilename );
							},
							error:function(){  alert("실패"); },
						}
				);
			});
		});
	</script>

</head>
<body>

<div id="wrap">
	<header>
		<div id="logo">
			<img style="width:100%" src="admin/images/adminbanner2.webp">
			<button class="logout-button" onClick="location.href='adminLogout'">Logout</button>
		</div>
	</header>