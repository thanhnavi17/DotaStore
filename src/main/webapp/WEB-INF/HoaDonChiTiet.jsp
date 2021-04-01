<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
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
                                        <li class="change-password"><a href="#"
                                                title="Đổi mật khẩu"><span>Đổi mật khẩu</span></a></li>
                                        <li class="log-order"><a href="hoaDonBan"
                                                title="Quản lý đơn hàng"><span>Quản lý đơn hàng</span></a></li>
                                        <li class="money"><a href="#"
                                                title="Quản lý nạp rút tiền"><span>Quản lý ví tiền</span></a></li>
                                        <li class="history-charge-money"><a href="#"
                                                title="Lịch sử nạp/rút tiền"><span>Lịch sử nạp/rút tiền</span></a></li>
                                        <li><a href="dangXuatTrangChu" title="Thoát"><span>Thoát</span></a>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                            <div class="masterMain">
                                <div id="changePassForm" class="account_tt">
                                    <h1 class="page_title">Danh sách đơn hàng</h1>

                                    <div class="wrap_order_detail">
                                        <div class="wrap">
                                            <label for="">Mã đơn hàng: </label>
                                            <s:textfield type="text" value="%{objCT.maHoaDon}"/>
                                        </div>

                                        <div class="wrap">
                                            <label for="">Ngày Tạo: </label>
                                            <s:textfield type="text" value="%{objCT.ngayBan}"/>
                                        </div>
 

                                        <div class="wrap">
                                            <label for="">Tổng Tiền: </label>
                                            <s:textfield type="text" value="%{objCT.tongHoaDon}"/>
                                        </div>
                                    </div>

                                    <form method="post" action="">
                                        
                                        <div class="giaodich_ds">
                                            <div class="group_item">
                                                <table>
                                                    <tr>
                                                        <th style="width: 5%">Ảnh</th>
                                                        <th style="width: 13%">Tên Sản Phẩm</th>
                                                        <th style="width: 8%">Số Lượng</th>
                                                        <th style="width: 8%">Giá tiền</th>
                                                    </tr>
                                                    <s:iterator value="lstHDChiTiet" var="ct">
                                                    <tr>
                                                        <td>
                                                            <img src="images/item/${ct.hinhAnh }"
                                                                style="width: 95px; height: 63px;">

                                                        </td>
                                                        <td><s:property value="tenSP"/></td>
                                                        <td>
                                                            <s:property value="soLuong"/>
                                                        </td>
                                                        <td><s:property value="giaBan"/></td>
                                                        
                                                    </tr>
                                                    </s:iterator>
                                                </table>
                                                <br>

                                            </div>
                                        </div>
                                    </form>
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
<style>
    @media (max-width: 1199px) {
      .sideBar {display: block; width: 100%; margin-right: 0; margin-bottom: 25px;}
    }
</style>

<style type="text/css">
    .masterPage {
      padding: 30px 0 60px;
    }
    .container {
      width: 1170px;
      margin: 0 auto;
    }
    .container:after{
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

    .menu-sidebar li.active{
      opacity: 0.6;
      font-weight: bold;
      background: #96878799;
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
    .accountPage .account_tt {
            padding-bottom: 0;
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

        .masterMain{
            /*padding: 20px 5px;*/
        }

        .giaodich_ds {
            /*overflow-x: auto;*/
        }

        .giaodich_ds .group_item {
            width: 100%;
            margin-top: 15px;
            border: 1px solid #64befd;
            border-right-width: 2px;
        }

        .giaodich_ds .item_box:first-child {
            background: #e4b35a;
        }

        .giaodich_ds .item_box {
            border-bottom: 1px solid #e4b35a;
        }

        .giaodich_ds .item_box:first-child span {
            font-size: 14px;
            color: #333;
            line-height: 35px;
            font-family: RobotoBold;
        }

        .giaodich_ds .item_stt {
            width: 60px;
            float: left;
            text-align: center;
        }

        .giaodich_ds .item_box.footer {
            padding: 20px 0;
            border-bottom: none;
        }
        .giaodich_ds .item_box.footer .price_total {
            float: right;
            margin-right: 25px;
            font: 18px/26px RobotoBold;
            color: #fff;
        }
        .giaodich_ds .item_box.footer .price_total span {
            font: 18px/26px RobotoBold;
            color: #fff;
            margin-left: 55px;
        }

        .giaodich_ds .item_box:first-child span {
            font-size: 14px;
            color: #333;
            line-height: 35px;
            font-family: RobotoBold;
        }

        .giaodich_ds span.item_title, .giaodich_ds a.item_title {
            padding-left: 10px;
            padding-right: 10px;
            word-break: break-all;
        }

        .giaodich_ds .item_title {
            width: 130px;
            float: left;
        }

        .giaodich_ds .item_nt {
            width: 130px;
            float: left;
            padding: 0 10px;
        }

        .giaodich_ds tr td {
            border: solid 1px #a79c9c;
            padding: 6px 5px;
        }

        .wrap_order_detail{
            margin-top: 20px;
        }

        .wrap_order_detail label{
            width: 40%;
            float: left;
            color: #fff;
        }

        .wrap_order_detail input{
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

        .wrap_order_detail .wrap {
            width: 90%;
            margin: 0 auto;
        }
</style>
</html>