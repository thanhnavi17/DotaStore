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
<script type="text/javascript">
$(document).ready(function(){
		
});
function capNhatPQ(lstPQ) {
	//Lấy thông tin chi tiết của chủ đề
	$.ajax({
		type : "GET",
		url : "capNhatPQ.action",
		data : {
			lst : lstPQ
		},
		dataType : "json",
		async : true,
		success : function(result) {
			alert("ok");
		}
	});
}
</script>
</head>
<body>
	<div class="app-title">
		<div>
			<h1>
				<i class="fa fa-th-list"></i> Phân quyền người dùng
			</h1>
		</div>
		<ul class="app-breadcrumb breadcrumb side">
			<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
			<li class="breadcrumb-item">DotaStore</li>
			<li class="breadcrumb-item active"><a href="#">Đăng ký</a></li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12" style="margin-left: auto; margin-right: auto">
			<div class="tile">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-2">
						<h5 style="text-align: center; color: #555555; font: normal;">Vai
							trò</h5>
						<s:select onclick="redirect(this.value)" multiple="true" size="20%" cssClass="form-control" list="lstVaiTro"
							value="%{vaiTroId}" listKey="maVaiTro" listValue="tenVaiTro" id="vaiTro"/>
					</div>
					<div class="col-md-3">
						<h5
							style="text-align: center; color: #555555; font-family: Arial;">Quyền
							chưa cấp</h5>
						<s:select multiple="true" size="20%" cssClass="form-control" list="lstChucNang"
							value="%{id}" listKey="id" listValue="tenChucNang" id="chucNang"/>
					</div>
					<div class="col-md-2">
						<h5></h5>
						<button id="test" class="col-md-6 form-control"
							style="margin: auto; margin-top: 50px">></button>
						<button class="col-md-6 form-control"
							style="margin: auto; margin-top: 10px">>></button>
						<button class="col-md-6 form-control"
							style="margin: auto; margin-top: 10px"><</button>
						<button class="col-md-6 form-control"
							style="margin: auto; margin-top: 10px"><<</button>
						<div class="col-md-12"
							style="margin: auto; margin-top: 5px; margin-left: auto; margin-right: auto">
						</div>
						<div class="col-md-12"
							style="margin: auto; margin-top: 5px; margin-left: auto; margin-right: auto">
						</div>
						<div class="row">
							<div class="col-md-12">
								<div style="float: right; margin-right: 40.98%">
									<input type="checkbox" class="form-check-input"> <label
										class="form-check-label">Thêm</label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4"></div>
							<div class="col-md-5">
								<input type="checkbox" class="form-check-input"> <label
									class="col-md-12 form-check-label">Sửa</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4"></div>
							<div class="col-md-5">
								<input type="checkbox" class="form-check-input"> <label
									class="col-md-12 form-check-label">Xóa</label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div style="float: right; margin-right: 24%">
									<input type="checkbox" class="form-check-input"> <label
										class="form-check-label">Danh sách</label>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<h5
							style="text-align: center; color: #555555; font-family: Arial;">Quyền
							được cấp</h5>
						<s:select name="colorN" multiple="true"
							cssClass="col-md-12 form-control" size="20px"
							list="#{1:'blue', 2:'pink', 3:'green', 4:'purple', 5:'crimson', 6:'indigo'}"
							value="%{{4, 6}}" />
					</div>
				</div>

				<div style="margin-top: 50px" class="row">
					<div class="col-md-11">
						<button style="float: right;" class="btn btn-primary" type="submit">
							<i class="fa fa-fw fa-lg fa-times-circle"></i>Hủy
						</button>
						&nbsp;
						<button style="float: right; margin-right: 10px" class="btn btn-primary"
							type="submit">
							<i class="fa fa-fw fa-lg fa-check-circle"></i>Cập nhật
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>