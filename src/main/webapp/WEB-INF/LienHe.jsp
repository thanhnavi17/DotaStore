<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main-body">
		<div class="slideBox container"
			style="margin-top: 30px; margin-bottom: 30px;">
			<div class="breadCrumbBox">
				<div class="title">Liên hệ</div>
				<ul>
					<li><a href="trangchu">Trang chủ</a></li>
					<li class="active"><a href="lienHe" title="Liên hệ">Liên
							hệ</a></li>
				</ul>
			</div>
		</div>

		<div class="masterPage contactUsPage">
			<div class="masterMain1 container">
				<div class="col1">

					<h1 class="title">Stanford</h1>
					<ul class="companyInfo">
						<li class="add"><span>Địa chỉ</span> : Số 20 Ngõ 678 Đường
							Láng, Đống Đa, Hà Nội</li>
						<li class="phone"><a href="tel:094 321 1696"><span>Điện
									thoại</span> : 0942996736</a></li>
						<li class="mail"><a href="mailto:thanh.navi17@gmail.com"><span>Email</span>
								: thanhma@gmail.com</a></li>
						<li class="web"><a href="//www.stanford.com.vn"><span>Website</span>
								: www.stanford.com.vn</a></li>
					</ul>

					<div id="form_contact" class="contactForm">
						<div class="title">Gửi liên hệ cho chúng tôi</div>
						<input id="tbHoTen" class="required" value="" type="text"
							placeholder="Họ tên *"> <input id="tbPhone"
							class="required" value="" type="text" placeholder="Điện thoại *">
						<input id="tbEmail" class="required" value="" type="text"
							placeholder="Email *"> <input id="tbAdd" class="required"
							value="" type="text" placeholder="Địa chỉ *">
						<textarea id="tbNoiDung" class="required" placeholder="Nội dung *"></textarea>
						<div class="btnClick">
							<a href="javascript://" onclick="SendContact();"
								title="Gửi liên hệ" class="submit">Gửi liên hệ</a> <a
								href="javascript://" onclick="NhapLai();" title="Nhập lại"
								class="cancel">Nhập lại</a>
						</div>
					</div>
				</div>
				<div class="col2">
					<div class="googleMap">
						<div class="title">Vị trí trên bản đồ Google</div>
						<div class="map" id="map1">
							<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d782.959165922978!2d105.80470877467138!3d21.01657735072819!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab5e182b2cf1%3A0x2b1a7afa9ec19075!2zMjAgTmfDtSA2NzggxJDGsOG7nW5nIEzDoW5nLCBMw6FuZyBUaMaw4bujbmcsIMSQ4buRbmcgxJBhLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1610650424547!5m2!1svi!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<style>
.masterPage {
	padding: 0px 60px 0px 60px;
	margin-bottom: 60px;
}

.container {
	width: 1170px;
	margin: 0 auto;
}

.contactUsPage .container {
	background-color: #1b1f2a;
	padding: 30px 20px 50px;
}

.contactUsPage .col1 {
	width: 50%;
	float: left;
	margin-right: 55px;
}

.contactUsPage .col2 {
	width: calc(100% - 565/ 1130 * 100% - 55px);
	float: left;
}

.contactUsPage .col1 .title {
	font: 18px/26px RobotoBold;
	color: #e4b35a;
	margin: 0 0 11px;
	text-transform: uppercase;
}

.contactUsPage .companyInfo {
	margin: 0 0 15px;
	padding: 0;
	list-style: none;
}

.contactUsPage .companyInfo li {
	font: 15px/27px Roboto;
	color: #c2c2c2;
}

.contactUsPage .companyInfo span {
	font-family: RobotoBold;
	display: inline-block;
	width: 80px;
}

.contactUsPage .companyInfo a {
	color: #c2c2c2;
}

.contactUsPage .contactForm .title {
	font: 18px/26px RobotoBold;
	color: #e4b35a;
	margin-bottom: 10px;
	text-transform: uppercase;
}

input, select, textarea {
	outline: 0;
	background: #fff;
	border: 1px solid #ddd;
	width: 100%;
	padding: 0 10px;
	color: #333;
}

.contactUsPage .contactForm input, .contactUsPage .contactForm select,
	.contactUsPage .contactForm textarea {
	height: 30px;
	line-height: 30px;
	border: 1px solid #cbcbcb;
	background: #fff;
	padding: 0 10px;
	width: 100% !important;
	margin-bottom: 10px;
	font-size: 15px;
	font-family: Roboto;
}

.contactUsPage .contactForm input, .contactUsPage .contactForm select,
	.contactUsPage .contactForm textarea {
	height: 30px;
	line-height: 30px;
	border: 1px solid #cbcbcb;
	background: #fff;
	padding: 0 10px;
	width: 100% !important;
	margin-bottom: 10px;
	font-size: 15px;
	font-family: Roboto;
}

.contactUsPage .contactForm textarea {
	height: 100px !important;
	line-height: 24px;
	padding: 5px 10px;
	margin-bottom: 0;
}

.contactUsPage .contactForm .btnClick {
	margin-top: 14px;
}

.contactUsPage .contactForm a {
	width: calc(50% - 5px);
	margin-right: 10px;
	background: #666;
	height: 36px;
	line-height: 36px;
	font: 15px/36px RobotoBold;
	text-transform: uppercase;
	color: #fff;
	float: left;
	text-align: center;
	cursor: pointer;
}

.contactUsPage .contactForm a:hover {
	background: #e4b35a;
}

.contactUsPage .contactForm a:last-child {
	margin-right: 0;
}

.contactUsPage .googleMap .title {
	font: 18px/26px RobotoBold;
	color: #e4b35a;
	margin-bottom: 20px;
	text-transform: uppercase;
}

.contactUsPage .googleMap .map {
	width: 100%;
	height: 493px;
}

#map1 iframe {
	width: 100%;
	height: 100%;
}
</style>
</html>