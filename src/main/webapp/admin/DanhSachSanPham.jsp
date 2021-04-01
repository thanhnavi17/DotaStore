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
				<i class="fa fa-th-list"></i> Danh sách sản phẩm
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
					<s:form action="timKiemSP" method="GET" theme="simple">
						<fieldset class="container">
							<legend>Nhập từ khoá tìm kiếm</legend>
							<div class="row">
								<label>Từ khoá:</label>
								<div class="col-md-5">
									<s:textfield name="tuKhoa" value="%{tuKhoa}" class="form-control" />
								</div>
								<label>Loại SP:</label>
								<div class="col-md-4">
									<s:select list="lstLoai" name="maLoai" value="%{maLoai}"
										listKey="maLoai" listValue="loaiSP"  class="form-control"/>
								</div>
								<div class="col-md-1">
									<s:submit value="Tìm kiếm" class="btn btn-primary" />
								</div>
							</div>
						</fieldset>
					</s:form>
					<hr/>
					<table id="dataTable" class="table table-bordered">
						<thead>
							<tr data-value=<s:property value='username' />>
								<th>Mã SP</th>
								<th>Tên SP</th>
								<th>Giá</th>
								<th>Số lượng tồn</th>
								<th>Mã NPH</th>
								<th>Ghi chú</th>
								<th>Mã loại</th>
								<th></th>
							</tr>

						</thead>
						<tbody>
							<s:iterator value="lstSanPham" var="nd">
								<tr>
									<td><s:property value="maSP" /></td>
									<td><s:property value="tenSP" /></td>
									<td><s:property value="gia" /></td>
									<td><s:property value="soLuongTon" /></td>
									<td><s:property value="maNPH" /></td>
									<td><s:property value="ghiChu" /></td>
									<td><s:property value="maLoai" /></td>
									<td><%if(session.getAttribute("role").equals(2)){ %><a style="display:none"class="btn btn-primary" href='<s:url action="chiTietSP?ma=%{maSP}"/>'>
									<i class="fa fa-pencil-square-o"></i></a>
										&nbsp; <a style="display:none" class="btn btn-danger" 
										href='<s:url action="xoaSP?ma=%{maSP}"/>'
										onclick="return confirm('Bạn có chắc chắn muốn xoá thông tin này ?');"><i class="fa fa-trash-o"></i></a><%} %>
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