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
				<i class="fa fa-th-list"></i> Nhật ký
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
				<div class="tile-body">
					
					<hr/>
					<table id="dataTable" class="table table-bordered">
						<thead>
							<tr data-value=<s:property value='username' />>
								<th>Id</th>
								<th>Nội dung</th>
								<th>Hành động</th>
								<th>Người tạo</th>
								<th>Chức năng</th>
								<th>Địa chỉ IP</th>
								<th>Ngày tạo</th>
								<th style="width: 100px"></th>
							</tr>

						</thead>
						<tbody>
							<s:iterator value="lstNhatKy" var="nd">
								<tr>
									<td><s:property value="nhatKyId" /></td>
									<td><s:property value="noiDung" /></td>
									<td><s:property value="hanhDong" /></td>
									<td><s:property value="nguoiTaoId" /></td>
									<td><s:property value="chucNang" /></td>
									<td><s:property value="diaChiIp" /></td>
									<td><s:property value="ngayTao" /></td>
									<td><a class="btn btn-primary" href='<s:url action="chiTietND?userId=%{maND}"/>'>
									<i class="fa fa-pencil-square-o"></i></a>
										&nbsp; <a class="btn btn-danger" 
										href='<s:url action="xoaNguoiDung?userId=%{maND}"/>'
										onclick="return confirm('Bạn có chắc chắn muốn xoá thông tin này ?');"><i class="fa fa-trash-o"></i></a>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>