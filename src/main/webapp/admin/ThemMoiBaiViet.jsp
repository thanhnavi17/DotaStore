<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Khai báo sử dụng thẻ tag của struts -->
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Thêm khóa đào tạo mới</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<div class="app-title">
		<div>
			<h1>
				<i class="fa fa-th-list"></i> Thêm khoá đào tạo mới
			</h1>
		</div>
		<ul class="app-breadcrumb breadcrumb side">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item">Thùy Yên - Wedding</li>
			<li class="breadcrumb-item active"><a href="dsKhoaDT">Danh sách khóa đào tạo</a></li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="tile">
				<s:form cssClass="form-horizontal"
					action="themMoiCapNhatKhoaDT" method="post"
					enctype="multipart/form-data" theme="simple">
					<div class="tile-body">
						<div class="form-group row">
							<div class="col-md-8">
								<s:hidden name="" value="" />
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-1">Tên khóa học:</label>
							<div class="col-md-6">
								<s:textfield cssClass="form-control" name=""
									value="" />
							</div>
						</div>
						<label></label>
						<div class="form-group row">
							<label class="control-label col-md-1">Mô tả:</label>
							<div class="col-md-11">
								<s:textarea class="form-control" id="moTa" name=""
									rows="20" value=""></s:textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-1">Nội dung:</label>
							<div class="col-md-11">
								<s:textarea class="form-control" id="noiDung" name=""
									rows="20" value=""></s:textarea>
							</div>
						</div>
					</div>
					<label></label>
					<div class="tile-footer">
						<div class="row">
							<label class="control-label col-md-1"></label>
							<div class="col-md-8 col-md-offset-3">
								<button class="btn btn-primary" type="submit">
									<i class="fa fa-fw fa-lg fa-check-circle"></i>Cập nhật
								</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
									class="btn btn-secondary" href="chiTietKhoaDT"><i
									class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
							</div>
						</div>
					</div>
				</s:form>
			</div>
		</div>
	</div>
	<!--Khai báo sử dụng ckeditor-->
	<script
		src="https://cdn.ckeditor.com/ckeditor5/24.0.0/classic/ckeditor.js">
	</script>
	<script>
		ClassicEditor.create(document.querySelector('#moTa'));
		ClassicEditor.create(document.querySelector('#noiDung'));
	</script>
</body>
</html>