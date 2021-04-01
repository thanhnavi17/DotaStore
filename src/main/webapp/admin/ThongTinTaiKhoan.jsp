<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Khai báo sử dụng thẻ tag của struts -->
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Trang Chủ</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<div class="app-title">
		<div>
			<h1>
				<i class="fa fa-th-list"></i> Cập nhật thông tin
			</h1>
		</div>
		<ul class="app-breadcrumb breadcrumb side">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item">DotaStore</li>
			<li class="breadcrumb-item active"><a href="#">Đăng ký</a></li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="tile">

				<s:form action="capNhatND" method="post"
					style="width: 600px; margin: auto;" class="form-horizontal"
					enctype="multipart/form-data" theme="simple">
					<div class="tile-body">

						<div class="form-group row">
							<div class="col-md-8">
								<s:hidden name="objND.maND" value="%{objND.maND}" />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">Họ tên</label>
							<div class="col-md-8">
								<s:textfield cssClass="form-control" name="objND.tenND"
									value="%{objND.tenND}" />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">Email</label>
							<div class="col-md-8">
								<s:textfield cssClass="form-control" name="objND.email"
									value="%{objND.email}" />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">Điện thoại</label>
							<div class="col-md-8">
								<s:textfield cssClass="form-control" name="objND.dienThoai"
									value="%{objND.dienThoai}" />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">Địa chỉ</label>
							<div class="col-md-8">
								<s:textfield cssClass="form-control" name="objND.diaChi"
									value="%{objND.diaChi}" />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">Tên đăng nhập</label>
							<div class="col-md-8">
								<s:textfield cssClass="form-control" name="objND.tenDangNhap"
									value="%{objND.tenDangNhap}" />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">Mật khẩu</label>
							<div class="col-md-8">
								<s:textfield cssClass="form-control" name="objND.matKhau"
									value="%{objND.matKhau}" />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">Tài khoản</label>
							<div class="col-md-8">
								<s:textfield cssClass="form-control" name="objND.taiKhoan"
									value="%{objND.taiKhoan}" />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">Vai trò</label>
							<div class="col-md-4">
								<s:select cssClass="form-control" list="lstVaiTro"
									name="objND.vaiTroId" value="%{objND.vaiTroId}" listKey="maVaiTro"
									listValue="tenVaiTro" class="form-control" />
							</div>
						</div>
						<div class="tile-footer" style="width: 600px; margin: auto;">
							<div class="row">
								<div class="col-md-8 col-md-offset-3">
									<button class="btn btn-primary" type="submit">
										<i class="fa fa-fw fa-lg fa-check-circle"></i>Cập nhật
									</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
										class="btn btn-secondary" href="dsnguoidung.action"><i
										class="fa fa-fw fa-lg fa-times-circle"></i>Trở về</a>
								</div>
							</div>
						</div>
					</div>
				</s:form>

			</div>
		</div>
	</div>
</body>
</html>