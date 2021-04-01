<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main-body">
		<section id="home-page" class="panel-body">
			<section class="homepage-line mt15">
				<div class="uk-container uk-container-center">
					<div class="masterPage">
						<div class="container">
							<div class="accountPage">
								<div class="sideBar">
									<div class="menuLeft">
										<div class="title">Quản lý tài khoản</div>
										<ul class="menu-sidebar">
											<li class="profile"><a href="thongTinCaNhan"
												title="Thông tin cá nhân"><span>Thông tin cá nhân</span></a></li>
											<li class="change-password"><a href="doiMatKhau"
												title="Đổi mật khẩu"><span>Đổi mật khẩu</span></a></li>
											<li class="log-order"><a href="hoaDonBan"
												title="Quản lý đơn hàng"><span>Quản lý đơn hàng</span></a></li>
											<li class="money"><a href="#"
												title="Quản lý nạp rút tiền"><span>Quản lý ví
														tiền</span></a></li>
											<li class="history-charge-money"><a href="#"
												title="Lịch sử nạp/rút tiền"><span>Lịch sử
														nạp/rút tiền</span></a></li>
											<li><a href="dangXuatTrangChu" title="Thoát"><span>Thoát</span></a>
											</li>

										</ul>
									</div>
								</div>
								<div class="masterMain">
									<div id="changePassForm" class="account_tt">

										<div class="col_2">
											<div id="formAccount" class="form">
												<s:form method="post" action="capNhatTaiKhoan" theme="simple">
													<div class="wrap">
														<label for="">Họ và tên: </label> 
														<s:textfield name="objND.hoTen"
															type="text" value="%{objND.tenND}" placeholder="Họ và tên"/>
													</div>

													<div class="wrap">
														<label for="">Email: </label> 
														<s:textfield name="objND.email"
															type="email" value="%{objND.email}" required="required"
															placeholder="Email"/>
													</div>

													<div class="wrap">
														<label for="">Địa chỉ: </label> 
														<s:textfield name="objND.diaChi"
															type="text" value="%{objND.diaChi}" placeholder="Địa Chỉ"/>
													</div>

													<div class="wrap">
														<label for="">Điện thoại: </label> 
														<s:textfield name="objND.dienThoai"
															type="text" value="%{objND.dienThoai}" required="required"
															placeholder="Số Điện Thoại *"/>
													</div>

													<div class="wrap">
														<label for="">Ngân Hàng: </label> 
														<s:textfield name="method"
															type="text" value="" placeholder="Ngân Hàng"/>
													</div>

													<div class="wrap">
														<label for="">Tên Chủ Tài Khoản: </label> 
														<s:textfield
															name="card_name" type="text" value=""
															placeholder="Tên Chủ Tài Khoản"/>
													</div>

													<div class="wrap">
														<label for="">Số Tài Khoản: </label> 
														<s:textfield
															name="card_number" type="text" value=""
															placeholder="Số Tài Khoản"/>
													</div>

													<div class="wrap" style="text-align: center;width: 20%;float:right;">
														<s:submit type="submit" class="save" value="Cập nhật"/>
													</div>
												</s:form>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</section>
		</section>
	</div>

</body>
<style type="text/css">
.masterPage {
	padding: 30px 0 60px;
}

.container {
	width: 1170px;
	margin: 0 auto;
}

.container:after {
	content: "";
	display: table;
	clear: both;
}

.masterMain {
	background-color: #1b1f2a;
	padding: 20px;
	width: calc(100% - 300px);
	float: left;
}

.sideBar {
	background-color: #1b1f2a;
	padding: 20px 20px 30px;
	width: 280px;
	margin-right: 20px;
	float: left;
	min-height: 20px;
}

.menuLeft .title {
	font: 18px/22px RobotoBold;
	color: #64befd;
	border-top: 2px solid #e4b35a;
	text-transform: uppercase;
	padding: 13px 15px;
}

.menuLeft ul {
	margin: 0;
	padding: 0;
	list-style: none;
	background-color: #232836;
}

.menuLeft a {
	font: 15px/22px Roboto;
	color: #fff;
	display: block;
	padding: 12px 15px;
	border-bottom: 1px solid #061f30;
}

.menu-sidebar li.active {
	opacity: 0.6;
	font-weight: bold;
	background: #96878799;
}

.accountPage .form.matkhau {
	width: 250px;
	margin-top: 20px;
}

.container {
	width: 1170px;
	margin: 0 auto;
}

.accountPage .form.matkhau input {
	height: 34px;
	line-height: 34px;
	border: 1px solid #e2e2e2;
	width: 100%;
	padding: 0 10px;
	font-size: 15px;
	font-family: Roboto;
	margin-bottom: 10px;
	border-radius: 3px;
}

.account_tt .col_2 {
	width: 100%;
	float: left;
	/* margin-right: 40px; */
}

.account_tt .col_2 label {
	width: 40%;
	float: left;
	color: #fff;
	/* padding-left: 30px; */
}

.account_tt .col_2 input, .account_tt .col_2 select {
	height: 34px;
	line-height: 34px;
	border: 1px solid #e2e2e2;
	width: 60%;
	padding: 0 10px;
	border-radius: 3px;
	font-size: 15px;
	font-family: Roboto;
	margin-bottom: 10px;
	font-style: italic;
}

.wrap {
	width: 90%;
	margin: 0 auto;
}

.masterMain {
	padding-top: 40px;
}

.accountPage .save {
	width: 114px;
}
</style>
</html>