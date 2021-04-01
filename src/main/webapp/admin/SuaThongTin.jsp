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
				<i class="fa fa-th-list"></i> Cập nhật sản phẩm
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
				<s:form action="capNhatThemMoi" method="post"
					style="width: 600px; margin: auto;" class="form-horizontal"
					enctype="multipart/form-data" theme="simple">
					<div class="tile-body">

						<div class="form-group row">
							<div class="col-md-8">
								<s:hidden cssClass="form-control" name="maSP"
									value="%{objSP.maSP}" />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">Tên sản phẩm</label>
							<div class="col-md-8">
								<s:textfield cssClass="form-control" id="tenSP" name="objSP.tenSP" placeholder="Vui lòng nhập tên sp" required="required"
									value="%{objSP.tenSP}" />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">Giá</label>
							<div class="col-md-8">
								<s:textfield cssClass="form-control" name="objSP.gia"
									value="%{objSP.gia}" />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">Số lượng tồn</label>
							<div class="col-md-8">
								<s:textfield cssClass="form-control" name="objSP.soLuongTon"
									value="%{objSP.soLuongTon}" />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">Mã NPH</label>
							<div class="col-md-8">
								<s:textfield cssClass="form-control" name="objSP.maNPH"
									value="%{objSP.maNPH}" />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">Mã hero</label>
							<div class="col-md-8">
								<s:textfield cssClass="form-control" name="objSP.heroID"
									value="%{objSP.heroID}" />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">Mã loại</label>
							<div class="col-md-4">
								<s:select cssClass="form-control" list="lstLoai"
									name="objSP.maLoai" value="%{objSP.maLoai}" listKey="maLoai"
									listValue="loaiSP" class="form-control" />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">Hình ảnh</label>
							<div class="col-md-4">
								<img alt="hình ảnh"
										src="images/<s:property value="objSP.image" />"
										width="150" height="150"> <s:hidden
											name="objSP.image" value="%{objSP.image}" /> <s:file
											name="fileUpload" label="Chọn 1 file cần upload" size="40" />
										<s:property value="fileUploadFileName" />
										<s:property value="fileUploadContentType" /> <br>
							</div>
						</div>
						<div class="tile-footer" style="width: 600px; margin: auto;">
							<div class="row">
								<div class="col-md-8 col-md-offset-3">
									<button class="btn btn-primary" type="submit">
										<i class="fa fa-fw fa-lg fa-check-circle"></i>Cập nhật
									</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
										class="btn btn-secondary" href="dssp.action"><i
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

