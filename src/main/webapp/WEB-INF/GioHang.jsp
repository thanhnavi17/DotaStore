<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$('.tru').click(function(){
			var maSP = $(this).attr('data-item-id');

            var valObj = $(this).parent().parent().find('.val');
            var currentQty = valObj.html();
            if(currentQty > 1){
				$.ajax({
					type: "get",
					url: "thayDoiSoLuong",
					data: {
						ma : maSP,
						soLuong : -1
					},
					async: true,
					success: function(result){
						if(currentQty > 1){
							valObj.html(--currentQty);
							$('#tongTien').html(result.ketQua + ' đ');
						}else{
						
						}
					}
				});
            }
		});
		$('.cong').click(function(){
			var maSP = $(this).attr('data-item-id');

            var valObj = $(this).parent().parent().find('.val');
            var currentQty = valObj.html();
			$.ajax({
				type: "get",
				url: "thayDoiSoLuong",
				data: {
					ma : maSP,
					soLuong : 1
				},
				async: true,
				success: function(result){
					valObj.html(++currentQty);
					$('#tongTien').html(result.ketQua + ' đ');
				}
			});
		});
		
		$('.cart_form_submit').click(function(){
			var tongTienHang = parseFloat($('#tongTien').html());

			var taiKhoanND = parseFloat($('#taiKhoan').html());
			var soDu = taiKhoanND - tongTienHang;
			if(taiKhoanND > tongTienHang){
				$.ajax({
					type: "POST",
					url: "thanhToanDonHang",
					success: function(result){
						window.location.reload();
						$('#alert .text').html("Thanh toán thành công");
		    			$('#alert').addClass('active');
					}
				});
			}else{
				$('#alert .text').html("Tài khoản không đủ, vui lòng nạp thêm");
    			$('#alert').addClass('active');
			}
		});
	});
</script>
</head>
<body>
	<div class="main-body">
		<div class="container">
			<div class="slideBox ">
				<div class="breadCrumbBox">
					<div class="title">Sản phẩm</div>
				</div>
			</div>
		</div>
		<div class="masterPage productPage">
			<div class="masterPage giohang_page">
				<div class="container">
					<div class="wrap_msg_alert">
						<div class="table_giohang">
							<div class="content">
								<div class="group_item">
									<div class="item_box header">
										<div class="sp" style="padding-left: 50px;">Ảnh</div>
										<div class="name">Tên sản phẩm</div>
										<div class="sl">Số lượng</div>
										<div class="price">Giá bán (VNĐ)</div>
										<div class="delete">Xóa</div>
									</div>
									<div id="ds_hang">
										<s:iterator value="listGioHang" var="gh">
											<div class="item_box content order_item">
												<div class="sp">
													<div class="khungAnh">
														<span class="khungAnhCrop0"> <img
															src="images/item/${gh.sanPham.image }">
														</span>
													</div>
												</div>
												<div class="name">
													<span><s:property value="sanPham.tenSP" /></span>
												</div>
												<div class="sl">
													<div class="quantityChoose">
														<ul>
															<li><a class="tru"
																data-item-id="${gh.sanPham.maSP }"><i
																	class="fa fa-minus" aria-hidden="true"></i></a></li>
															<li><a id="quantity" class="val"><s:property
																		value="soLuong"/></a></li>
															<li><a class="cong"
																data-item-id="${gh.sanPham.maSP }"><i
																	class="fa fa-plus" aria-hidden="true"></i></a></li>
														</ul>
													</div>
												</div>
												<div class="price">
													<span><s:property value="sanPham.gia" /> đ</span>
												</div>
												<div class="delete">
													<a href="removeCart?maSP=${gh.sanPham.maSP }"
														class="removeFromCart" data-item-id="${gh.sanPham.maSP }"><i
														class="fa fa-window-close" aria-hidden="true"></i></a>
												</div>
											</div>
										</s:iterator>
									</div>
								</div>
								<div class="total">
									<a href="trangchu" class="continue">Tiếp tục mua hàng</a>
									<div class="total_price">
										Tổng: <span id="tongTien"> ${sessionScope.tongTien } </span><span>đ</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="ttThanhToan">
						<div class="col1">

							<div class="btnClick" style="text-align: center">
								<a class="cart_form_submit" title="Gửi đơn hàng">Thanh toán</a>
							</div>

						</div>
						<div class="col2">
							<span>Hoặc bạn có thể đến trực tiếp địa chỉ sau:</span> <span
								class="name">Stanford</span>
							<ul>
								<li><span>Địa chỉ:</span> Số 20 Ngõ 678 Đường Láng, Đống Đa, Hà Nội</li>
								<li><span><a href="tel:0942996736">Phone:</a>&nbsp;</span>0942996736
									</li>
								<li><a href="mailto:thanh.navi17@gmail.com"><span>Email:</span>
										thanhma@gmail.com</a></li>
							</ul>
							<div class="text1">Xin chân thành cảm ơn!</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<style>
.masterPage {
	padding-bottom: 60px;
}

.giohang_page {
	color: #fff;
}

.giohang_page .container {
	width: 1170px;
	background-color: #1b1f2a;
	padding: 30px 20px 50px;
}

.giohang_page .text_top {
	font-weight: bold;
	font: 16px/26px RobotoBold;
	margin-bottom: 15px;
}

.giohang_page .text_top a.phone {
	font-weight: bold;
	font: 22px/26px Roboto;
	color: #e4b35a;
	margin-left: 5px;
}

.table_giohang {
	overflow-x: auto;
}

.giohang_page .text_top {
	font: 16px/26px Roboto;
	margin-bottom: 15px;
}

.table_giohang .content {
	width: 1130px;
}

.table_giohang .header {
	background: #b6fd8d82;
	height: 42px;
	padding: 0 !important;
	border-top: none;
	color: #142909;
}

.table_giohang .item_box {
	border-bottom: 1px solid #e4b35a;
	padding: 20px 0;
}

.table_giohang .header .sp, .table_giohang .header .name, .table_giohang .header .sl,
	.table_giohang .header .price, .table_giohang .header .price_1,
	.table_giohang .header .delete {
	font: 15px/42px Roboto;
	font-weight: bold;
	text-transform: uppercase;
}

.table_giohang .item_box .sp {
	width: 150px;
	float: left;
	padding-left: 15px;
}

.table_giohang .item_box .name {
	width: calc(100% - 560px - 180px);
	float: left;
	padding-left: 20px;
}

.table_giohang .item_box .sl {
	width: 200px;
	float: left;
}

.table_giohang .item_box .price {
	width: 250px;
	float: left;
}

.table_giohang .item_box .price_1 {
	width: 180px;
	float: left;
}

.table_giohang .item_box .delete {
	width: 80px;
	float: left;
	text-align: center;
}

.table_giohang .item_box.content .sp .khungAnh {
	height: 100%;
	width: 100%;
	float: right;
}

.khungAnhCrop, .khungAnhCrop0 {
	display: inline-block;
	height: 100%;
	left: 0;
	overflow: hidden;
	position: absolute;
	text-align: center;
	top: 0;
	width: 100%;
	z-index: 1;
}

.khungAnhCrop0 img {
	left: 50%;
	max-height: 100%;
	max-width: 100%;
	position: absolute;
	top: 50%;
	transform: translate(-50%, -50%);
	z-index: 1;
}

.khungAnh {
	position: relative;
	z-index: 1;
}

.table_giohang .item_box.content .sp {
	height: 60px;
}

.table_giohang .item_box.content .name {
	font: 15px/22px Roboto;
	height: 60px;
	position: relative;
}

.table_giohang .item_box.content .name span {
	position: absolute;
	top: 50%;
	left: 20px;
	transform: translateY(-50%);
}

.quantityChoose {
	margin-top: 10px;
}

.quantityChoose ul {
	margin: 0;
	padding: 0;
	list-style: none;
	float: left;
}

.quantityChoose li {
	float: left;
	margin-right: -1px;
}

.quantityChoose li a {
	width: 45px;
	height: 40px;
	display: inline-block;
	border: 1px solid #232836;
	font: 15px/40px RobotoBold;
	text-align: center;
	pointer-events: none;
	color: #fff;
}

.quantityChoose li a.tru, .quantityChoose li a.cong {
	pointer-events: auto;
	width: 25px;
	background-color: #1b1f2a;
}

.quantityChoose li a.tru {
	border-radius: 4px 0 0 4px;
}

.quantityChoose li a.cong {
	border-radius: 0 4px 4px 0;
}

.table_giohang .item_box.content .price span {
	display: inline-block;
	margin-top: 21px;
}

.table_giohang .item_box.content .price_1 span {
	display: inline-block;
	margin-top: 21px;
}

.table_giohang .item_box.content .delete span {
	margin-top: 25px;
	cursor: pointer;
	margin-top: 21px;
	display: inline-block;
	font-size: 18px;
}

.table_giohang .total {
	border-bottom: 1px solid #e4b35a;
	padding: 12px 0;
}

.table_giohang .total a {
	float: left;
	height: 38px;
	line-height: 38px;
	background: #666;
	border-radius: 3px;
	font: 14px/38px RobotoMedium;
	color: #fff;
	text-transform: uppercase;
	margin-left: 12px;
	padding: 0 25px;
}

.table_giohang .total a:hover {
	background: #e4b35a;
}

.table_giohang .total .total_price {
	font: 18px/38px RobotoBold;
	float: right;
	margin-right: 268px;
}

.table_giohang .total .total_price span {
	color: #51ff1d;
	font-size: 22px;
	padding-left: 20px;
}

.giohang_page .luuY {
	font: 15px/22px Roboto;
	color: #e01010;
	font-style: italic;
	margin-top: 20px;
}

.ttThanhToan {
	margin-top: 25px;
}

.ttThanhToan .col1 {
	float: left;
	width: 56.63716814%;
	margin-right: 30px;
}

input, select, textarea {
	outline: 0;
	background: #fff;
	border: 1px solid #ddd;
	width: 100%;
	padding: 0 10px;
	color: #333;
}

.ttThanhToan .ptThanhToan input:checked+label, .ttThanhToan .ptThanhToan .item:hover label
	{
	color: #e4b35a;
}

.ttThanhToan .form input, .ttThanhToan .form textarea {
	height: 30px;
	font: 14px/30px Roboto;
	border: 1px solid #d1cbc2;
	margin-top: 10px;
}

.ttThanhToan .form textarea {
	height: 70px !important;
}

.ttThanhToan .ptThanhToan {
	margin-top: 15px;
}

.ttThanhToan .ptThanhToan .text {
	font-weight: bold;
	font: 14px/21px Roboto;
}

.ttThanhToan .ptThanhToan .item {
	margin-top: 15px;
}

.ttThanhToan .ptThanhToan input {
	display: none;
}

.ttThanhToan .ptThanhToan label {
	cursor: pointer;
	font-family: Roboto;
	font-size: 14px;
	color: #fff;
	float: left;
}

.ttThanhToan .ptThanhToan label:after {
	opacity: 0;
	content: '';
	position: absolute;
	width: 9px;
	height: 9px;
	top: 1px;
	left: 1px;
	border-radius: 50%;
}

.ttThanhToan .ptThanhToan .item span {
	display: inline-block;
	width: 20px;
	height: 20px;
	background-color: #fff;
	margin-right: 7px;
	border-radius: 3px;
	float: left;
}

.ttThanhToan .ptThanhToan .item:hover input+label span, .ttThanhToan .ptThanhToan input:checked+label span
	{
	background: url(http://fsvalue.com/img/icon/checked.png) no-repeat
		center center #e4b35a;
	border-color: #e4b35a;
}

.ttThanhToan .ptThanhToan .taiKhoan {
	font: 12px/20px Roboto;
	color: #fff;
	padding: 10px;
	border: 1px solid #fff;
	margin-top: 15px;
}

select {
	padding: 0 0 0 10px;
}

.ttThanhToan .ptThanhToan .taiKhoan select {
	height: 30px;
	font: 14px/30px Roboto;
	border: 1px solid #d1cbc2;
	margin-bottom: 10px;
}

.ttThanhToan .ptThanhToan .taiKhoan .content {
	display: none;
}

.ttThanhToan .btnClick {
	margin-top: 25px;
}

.ttThanhToan .btnClick a {
	/* float: left; */
	height: 37px;
	font: 14px/37px RobotoBold;
	color: #fff;
	padding: 0 30px;
	background-color: #666;
	margin-right: 10px;
	border-radius: 4px;
	text-transform: uppercase;
	cursor: pointer;
	display: block;
	width: 200px;
	margin: 0 auto;
}

.ttThanhToan .btnClick a:hover {
	background-color: #e4b35a;
}

.ttThanhToan .btnClick span {
	font: 13px/37px Roboto;
	color: #fff;
}

.ttThanhToan .col2 {
	width: calc(100% - 640/ 1130 * 100% - 30px);
	font: 14px/28px Roboto;
	color: #fff;
	float: left;
}

.ttThanhToan .col2 span {
	font-family: Roboto;
	font-weight: bold;
}

.ttThanhToan .col2 .name {
	text-transform: uppercase;
	color: #e4b35a;
	font-size: 18px;
	display: block;
	margin-top: 8px;
}

.ttThanhToan .col2 a {
	font: 14px/28px Roboto;
	font-weight: bold;
	color: #fff;
}

.ttThanhToan .col2 ul {
	margin: 10px 0;
	padding: 0;
	list-style: none;
}

.ttThanhToan .col2 span {
	font-family: Roboto;
	font-weight: bold;
}
</style>
</html>