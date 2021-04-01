<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Khai báo sử dụng thẻ tag của struts -->
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Đăng ký</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<div class="app-title">
		<div>
			<h1>
				<i class="fa fa-th-list"></i> Danh sách sách
			</h1>
		</div>
		<ul class="app-breadcrumb breadcrumb side">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item">Tech News</li>
			<li class="breadcrumb-item active"><a href="#">Đăng ký</a></li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="tile">
				<div class="tile-body">
					<s:form action="dangKy.action" method="post" theme="simple">
						<table style="width: 100%; color: white">
							<s:textfield cssClass="ggg" name="tenDangNhap" id="taiKhoan"
								placeholder="Tài khoản" required="" />
							<s:password cssClass="ggg" name="matKhau" id="matKhau"
								placeholder="Mật khẩu" required="" />
							<s:textfield cssClass="ggg" name="hoTen" id="hoTen"
								placeholder="Họ tên" required="" />
							<s:textfield cssClass="ggg" name="dienThoai" id="dienThoai"
								placeholder="Điện thoại" required="" />
							<s:textfield cssClass="ggg" name="email" id="email"
								placeholder="Email" required="" />
							<s:textfield cssClass="ggg" name="diaChi" id="diaChi"
								placeholder="Địa chỉ" required="" />
							<s:submit name="btnDangKy" value="Đăng Ký" />
						</table>
					</s:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>