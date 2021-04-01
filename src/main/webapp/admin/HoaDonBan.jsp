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
				<i class="fa fa-th-list"></i> Danh sách tài khoản
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
					<s:form action="timKiemND" method="GET" theme="simple">
							<div class="row">
								<label>Từ khoá:</label>
								<div class="col-md-5">
									<s:textfield name="tuKhoa" value="%{tuKhoa}" class="form-control" />
								</div>
								
								<div class="col-md-1">
									<s:submit value="Tìm kiếm" class="btn btn-primary" />
								</div>
							</div>
					</s:form>
					<hr/>
					<s:form theme="simple">
					<table id="dataTable" class="table table-bordered" >
						<thead>
							<tr data-value=<s:property value='username' />>
								<th>Mã đơn hàng</th>
								<th>Ngày tạo</th>
								<th>Tổng tiền</th>
								<th>Khách hàng</th>
								<th>Trạng thái</th>
								<th style="width: 100px"></th>
							</tr>

						</thead>
						<tbody>
							<s:iterator value="lstHoaDonAll" var="hd">
								<tr>
									<td><s:property value="maHoaDon" /></td>
									<td><s:property value="ngayBan" /></td>
									<td><s:property value="tongHoaDon" /></td>
									<td><s:property value="hoTen" /></td>
									<td><s:checkbox value="%{maTrangThai}" name="trangThai" fieldValue="%{maTrangThai}"/></td>
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
					</s:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>