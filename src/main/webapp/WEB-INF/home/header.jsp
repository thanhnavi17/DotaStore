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
		$('#login-modal #btn-submit').click(function (e) {
            e.preventDefault();
            var tenDangNhap = $('#login-modal #tenDangNhap').val();
            var matKhau = $('#login-modal #matKhau').val();

            $('#login-modal .login_msg').html();
            if($('#login_form').valid()){
            	$.ajax({
                	type: "POST",
                	url: "dangNhapTrangChu",
                	data: {
                    	tenDangNhap :tenDangNhap,
                    	matKhau :matKhau,
                	},
                	async: true,
                	success: function(result) {
                		alert(result.ketQua);
                    	if(result.ketQua != ""){
                    		$('#login-modal .login-success').html('Đăng nhập thành công');
                    		window.location.reload();      
                        	$('#close').click();
                        	$('#login-modal .login-error').css('display','none');
                        
                    	}else{
                    		$('#login-modal .login-error').html('Đăng nhập thất bại');
                        	$('#login-modal .login-error').css('display','block');
                        	$('#login-modal .login-success').css('display','none');
                    	}

                	}
            	});
            }
        });

		$('#register-modal #btnDangKy').click(function(e){
			e.preventDefault;
			var hoTen = $('#register-modal #hoTen').val();
			var email = $('#register-modal #email').val();
			var dienThoai = $('#register-modal #dienThoai').val();
			var tenDangNhap = $('#register-modal #tenDangNhap').val();
			var matKhau = $('#register-modal #matKhau').val();
			var matKhauNhapLai = $('#register-modal #matKhauNhapLai').val();
			$('#register-modal .msg').html();
			if($('#FormRegister').valid()){
				$.ajax({
					type : "POST",
					url : "dangKyTrangChu",
					data: {
						tenND : hoTen,
						email : email,
						dienThoai : dienThoai,
						tenDangNhap : tenDangNhap,
						matKhau : matKhau
					},
					success : function(result){
						alert(result.ketQua);		
					}
				});
			}
		});
	});
</script>
<style>
#register-modal .msg p{
        margin-bottom: 0;
    }
    .hidden{
        display: none;
    }
    .show {
        display: block;
    }
    .cursor{
        cursor: pointer;
    }

    .custom-alert {
        margin-bottom: 15px;
        padding: 10px;
        background: #ebf7fd;
        color: #2d7091;
        border: 1px solid rgba(45, 112, 145, .3);
        border-radius: 4px;
        text-shadow: 0 1px 0 #fff;
    }

    #dialog-payed h2	{
        font-family: ProximaNova,-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;
    }

    #dialog-payed .content-body {
        font-family: ProximaNova,-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif;
        font-weight: 300;
        color: #222;
        text-transform: none;
        text-align: center;
        font-size: 19px;
    }

    .wd-50{
        width: 46%;
        margin: 0 10px;
    }

    .error{
        color: red!important;
    }

    .homepage-item-game{
        position: absolute;
    }

    .img-cover{
        height: auto!important;
    }

    .img-cover img{
        height: auto!important;
    }
    .loginRegister {
        float: left;
        position: relative;
        z-index: 11112;
    }
    .loginRegister a {
        /*padding: 0 8px;*/
        color: #fff;
    }
    .loginRegister a img {
        height: 30px;
        width: 30px;
        border-radius: 50%;
        display: inline-block;
        vertical-align: middle;
        margin-left: 5px;
        margin-top: -3px;
        margin-right: -8px;
    }
    .loginRegister .subMenu {
        margin: 0;
        padding: 10px 0 0;
        list-style: none;
        position: absolute;
        top: 100%;
        right: 0;
        z-index: 12;
        min-width: 220px;
        opacity: 0;
        transform: translateY(30px);
        pointer-events: none;
        transition: .5s;
    }
    .loginRegister .subMenu li{
        margin: 0;
    }
    .loginRegister .subMenu>li>a {
        font: 15px/22px Roboto;
        color: #fff;
        padding: 8px 20px 8px 20px;
        border-bottom: 1px solid #fff;
        display: block;
        /*background: #e4b35a;*/
        background: #2c3040;
    }
    @media (min-width: 1200px){
        .loginRegister:hover > .subMenu {
            opacity: 1!important;
            transform: translateY(0);
            pointer-events: auto;
        }
    }

    .note-bank {
        color: red;
        font-size: 12px;
        font-style: italic;
    }

    /*profile*/
    .accountPage .account_tt {
        padding-bottom: 40px;
    }
    .accountPage .page_title {
        color: #64befd;
        text-transform: uppercase;
        margin: 0;
        font: 22px/26px RobotoBold;
    }

    table{
        color: #fff;
        width: 100%;
        text-align: center;
    }

    table th{
        background: #b3b3b3bf;
        color: #fff;
        font-size: 15px;
        line-height: 35px;
    }

    .accountPage  .save:hover {
        opacity: 0.6;
    }
    .accountPage  .save {
        width: auto;
        background: #666;
        height: 34px;
        line-height: 34px;
        font: 14px/34px RobotoBold;
        text-transform: uppercase;
        color: #fff;
        text-align: center;
        cursor: pointer;
        display: inline-block;
        margin-top: 10px;
    }
    
    .modal_popup {
        opacity: 0;
        position: fixed;
        z-index: 999;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: #000;
        background-color: rgba(0,0,0,.4);
        -webkit-transition: opacity 400ms ease-in;
        -moz-transition: opacity 400ms ease-in;
        /*transition: opacity 400ms ease-in;*/
        pointer-events: none;
        font-size: 0;
        text-align: center;
        overflow: auto;
    }
    .popup_login .modal_popup_content {
        width: 650px;
        padding: 10px 50px 35px;
        background: #fff;
        border-radius: 6px;
        position: relative;
        margin-top: 100px;
        display: inline-block;
        text-align: left;
        font-size: 14px;
    }
    .popup_login .title {
        font-weight: bold;
        font: 20px/40px Roboto;
        color: #e4b35a;
        text-transform: uppercase;
        border-bottom: 1px solid #e4b35a;
        margin-bottom: 5px;
    }
    .popup_login .text {
        font: 15px/24px Roboto;
        margin-bottom: 30px;
    }
    .close_alert {
        text-align: center;
    }
    .close_alert a {
        font: 14px Roboto;
        display: inline-block;
        height: 38px;
        line-height: 38px;
        padding: 0 20px;
        border-radius: 5px;
        text-transform: uppercase;
        background-color: #e4b35a;
        color: #000;
        cursor: pointer;
    }

    .modal_popup.active {
        opacity: 1;
        pointer-events: auto;
    }
    body {
    position: relative;
    font-family: 'Arial', sans-serif;
    font-size: 15px;
    color: #222;
    line-height: 1.6em;
	}
</style>
</head>
<body>
<div class="modal_popup popup_login" id="alert">
		<div class="modal_popup_content">
			<div class="title">Thông báo</div>
			<div class="text"></div>
			<div class="close_alert">
				<a>Chấp nhận</a>
			</div>
		</div>
	</div>

	<script>
    $(document).ready(function () {
        $('.close_alert').on('click', function () {
            $(this).parent().parent().removeClass('active')
        });
    });
</script>
	<div class="headerContent">
		<div class="topBox">
			<div class="container">
				<a class="hotline" href="tel:0942996736"><i
					class="fa fa-phone-square" aria-hidden="true"></i><span>Hotline:
						094 299 6736</span></a>
				<div class="topRight">
				<%if(session.getAttribute("quantity") != null){ %>
					<a class="go_Cart" href="dsGioHang" title="giỏ hàng"><i class="fa fa-shopping-cart" aria-hidden="true"></i><span
						id="totalItem">${sessionScope.quantity }</span>
					</a>
					<%} else {%>
					<a class="go_Cart" href="dsGioHang" title="giỏ hàng"><i class="fa fa-shopping-cart" aria-hidden="true"></i><span
						id="totalItem">0</span>
					</a>
					<%} %>
					<div id="dky_dnhap" class="loginRegister">
					<%if(session.getAttribute("username") != null) {%>
						<ul class="uk-list mb0 list-top-right uk-flex-middle uk-flex ">
							<li><a class="login-button mr10 btn-login"
								href="#login-modal"
								data-uk-modal="{modal: false, keyboard: false, bgclose: false, center: false}" style="display:none;">Đăng
									Nhập</a></li>
							<li><a class="register-button btn-register"
								href="#register-modal"
								data-uk-modal="{modal: false, keyboard: false, bgclose: false, center: false}" style="display:none;">Đăng
									ký</a></li>
						</ul>
						<a class="name" style="color:white;">Xin chào:<b> ${sessionScope.hoTen }</b>
							(<b id="taiKhoan" style="color: #b6fd8d82">${sessionScope.taiKhoan }</b>VND)</a>
						<ul class="subMenu name" style="opacity: 0;">
							<li><a title=" Thông tin cá nhân"
								href="thongTinCaNhan?ma=${sessionScope.userID }">Thông tin cá nhân</a></li>
							<li><a title="Quản lý đơn hàng"
								href="#">Quản lý đơn hàng</a></li>
							<li><a title="Yêu cầu nạp rút tiền"
								href="#">Quản lý ví tiền</a></li>
							<li><a title="Thoát" href="dangXuatTrangChu">Đăng
									xuất</a></li>
						</ul>
						<%}else{ %>
						<ul class="uk-list mb0 list-top-right uk-flex-middle uk-flex ">
							<li><a class="login-button mr10 btn-login"
								href="#login-modal"
								data-uk-modal="{modal: false, keyboard: false, bgclose: false, center: false}">Đăng
									Nhập</a></li>
							<li><a class="register-button btn-register"
								href="#register-modal"
								data-uk-modal="{modal: false, keyboard: false, bgclose: false, center: false}">Đăng
									ký</a></li>
						</ul>
						<a class="name" style="display:none;color: white;">Xin chào:<b> ${sessionScope.hoTen }</b>
							(<b style="color: #b6fd8d82">${sessionScope.taiKhoan }</b>VND)</a>
						<ul class="subMenu name" style="opacity: 0;display:none;">
							<li><a title=" Thông tin cá nhân"
								href="thongTinCaNhan?ma=${sessionScope.userID }">Thông tin cá nhân</a></li>
							<li><a title="Quản lý đơn hàng"
								href="#">Quản lý đơn hàng</a></li>
							<li><a title="Yêu cầu nạp rút tiền"
								href="#">Quản lý ví tiền</a></li>
							<li><a title="Thoát" href="dangXuatTrangChu">Đăng
									xuất</a></li>
						</ul>
						<%} %>
					</div>
				</div>
			</div>
		</div>
		<div class="headerBox">
			<div class="container">
				<div class="logo">
					<a title="Stanford" href="trangchu" id="reload"><img alt=""
						src="images/Logo.png"></a>
				</div>
				<div class="header_right">
					<div class="menuBox">
						<div class="menu_res_btn">
							<span class="open_menu_res">open_menu_res</span>
						</div>
						<ul class="menuMain">
							<li class="active"><a href="trangchu"
								title="Trang chủ" target=""><span>Trang chủ</span> </a></li>
							<li class="megaMenu"><a
								href="#" title="DOTA 2"
								target=""> <span>DOTA 2</span>
							</a></li>
							<li class=""><a href="#"
								title="Games PC" target=""> <span>Games PC</span>
							</a> <span class="openSub"></span></li>
							<li class=""><a
								href="#" target=""
								title="Gift Code"> <span>Gift Code</span>
							</a> <span class="openSub"></span></li>
							<li class=""><a
								href="huongDanMuaHang"
								title="Hướng dẫn" target=""><span>Hướng dẫn</span> </a></li>
							<li class=""><a href="dsTinTuc" title="Tin Tức" target=""><span>Tin
										Tức</span> </a></li>
							<li class=""><a href="lienHe"
								title="Liên hệ" target=""><span>Liên hệ</span> </a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- Login modal -->
<div id="login-modal" class="uk-modal auth-modal" aria-hidden="true" style="display: none; overflow-y: scroll;">
  <div class="uk-modal-dialog">
    <div class="auth-panel">
      <div class="auth-panel__head">
        <h2 class="auth-panel__heading">
          <i class="fa fa-sign-in"></i> Đăng nhập tài khoản
        </h2>
        <a class="uk-modal-close uk-close auth-modal__close" id="close"></a>
      </div>
      <div class="auth-panel__body mb15">
        <s:form action="" class="auth-form" id="login_form">
          <div class="login-error login_msg uk-alert uk-alert-danger" style="display: none"></div>
          <div class="login-success login_msg uk-alert uk-alert-success" style="display: none"></div>
          <div class="auth-form__row">
            <label for="" class="auth-form__label">Email/Số điện thoại</label>
            <div class="auth-form__group">
              <span class="auth-form__icon"><i class="fa fa-envelope-o"></i></span>
              <input type="text" id="tenDangNhap" class="auth-form__field" placeholder="Vui lòng nhập Email/Số điện thoại" name="tenDangNhap" required>
            </div>
          </div>
          <div class="auth-form__row">
            <div class="uk-clearfix">
              <label for="" class="uk-float-left auth-form__label">Mật khẩu</label>
              
            </div>
            <div class="auth-form__group">
              <span class="auth-form__icon"><i class="fa fa-key"></i></span>
              <input type="password" id="matKhau" class="auth-form__field" placeholder="Vui lòng nhập mật khẩu" name="matKhau" required>
            </div>
          </div>
          <div class="auth-form__row">
            Chưa có tài khoản? <a href="#" title="Đăng ký tài khoản" data-uk-modal="{target:&#39;#register-modal&#39;}">Đăng ký ngay</a>
          </div>
          <div class="auth-form__row">
            <button type="submit" id="btn-submit" class="auth-form__submit">Đăng nhập</button>
          </div>
        </s:form>
      </div>
    </div>
  </div>
</div>
<!-- register modal -->
<div id="register-modal" class="uk-modal auth-modal" aria-hidden="true" style="display: none; overflow-y: scroll;">
  <div class="uk-modal-dialog">
    <div class="auth-panel">
      <div class="auth-panel__head">
        <h2 class="auth-panel__heading">
          <i class="fa fa-key"></i> Đăng ký tài khoản
        </h2>
        <a class="uk-modal-close uk-close auth-modal__close"></a>
      </div>
      <div class="auth-panel__body">
        <s:form action="" class="auth-form" id="FormRegister">
          <div class="msg msg-error msg uk-alert uk-alert-danger" style="display: none;"></div>
          <div class="msg uk-alert uk-alert-success" style="display: none;"></div>
          <div class="auth-form__row">
            <label for="" class="auth-form__label">Họ và tên</label>
            <div class="auth-form__group">
              <span class="auth-form__icon"><i class="fa fa-user"></i></span>
              <input type="text" name="hoTen" id="hoTen" value="" class="auth-form__field" placeholder="Vui lòng nhập họ và tên *" required>
            </div>
          </div>
          <div class="auth-form__row">
            <label for="" class="auth-form__label">Email</label>
            <div class="auth-form__group">
              <span class="auth-form__icon"><i class="fa fa-envelope-o"></i></span>
              <input type="email" name="email" id="email" value="" class="auth-form__field" placeholder="Vui lòng nhập Email *" required>
            </div>
          </div>
          <div class="auth-form__row">
            <label for="" class="auth-form__label">Phone</label>
            <div class="auth-form__group">
              <span class="auth-form__icon"><i class="fa fa-phone"></i></span>
              <input type="text" name="dienThoai" id="dienThoai" value="" class="auth-form__field" placeholder="Vui lòng nhập Số Điện Thoại">
            </div>
          </div>
          <div class="auth-form__row">
            <label for="" class="auth-form__label">Tên đăng nhập</label>
            <div class="auth-form__group">
              <span class="auth-form__icon"><i class="fa fa-user"></i></span>
              <input type="text" name="tenDangNhap" id="tenDangNhap" value="" class="auth-form__field" placeholder="Vui lòng nhập tên đăng nhập *" required>
            </div>
          </div>
          <div class="auth-form__row">
            <label for="" class="auth-form__label">Mật khẩu</label>
            <div class="auth-form__group">
              <span class="auth-form__icon"><i class="fa fa-key"></i></span>
              <input type="password" name="matKhau" id="matKhau" value="" class="auth-form__field" placeholder="Vui lòng nhập mật khẩu *" required>
            </div>
          </div>
          <div class="auth-form__row">
            <label for="" class="auth-form__label">Nhập lại mật khẩu</label>
            <div class="auth-form__group">
              <span class="auth-form__icon"><i class="fa fa-key"></i></span>
              <input type="password" name="matKhauNhapLai" id="matKhauNhapLai" class="auth-form__field" placeholder="Vui lòng nhập lại mật khẩu *" required>
            </div>
          </div>
          <div class="auth-form__row">
            <button type="submit" name="" id="btnDangKy" class="auth-form__submit">Đăng ký</button>
          </div>
        </s:form>
      </div>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$('#login_form').validate({
			rules : {
				tenDangNhap : "required",
				matKhau : "required"
			},
			messages:{
				tenDangNhap : "Vui lòng nhập tên đăng nhập",
				matKhau : "Vui lòng nhập mật khẩu"
			}
		});
		
		$('#FormRegister').validate({
			rules : {
				hoTen : "required",
				email : "required",
				tenDangNhap : {
					required : true,
					minlength : 5,
				},
				matKhau : {
					required : true,
					minlength : 5,
				},
				matKhauNhapLai : {
					required : true,
					minlength : 5,
					equalTo : "#matKhau"
				}
			},
			messages:{
				hoTen : "Vui lòng nhập họ tên",
				email : "Vui lòng nhập email",
				tenDangNhap : {
					required : "Vui lòng nhập tên đăng nhập",
					minlength : "Tên đăng nhập phải có độ dài tối thiếu 5 kí tự"
				},
				matKhau : {
					required : "Vui lòng nhập mật khẩu",
					minlength : "Mật khẩu phải có độ dài tối thiếu 5 kí tự"
				},
				matKhauNhapLai : {
					required : "Vui lòng nhập mật khẩu",
					minlength : "Mật khẩu phải có độ dài tối thiểu 5 kí tự",
					equalTo : "Mật khẩu không đúng"
				}
			}
		});
	});
</script>
</html>