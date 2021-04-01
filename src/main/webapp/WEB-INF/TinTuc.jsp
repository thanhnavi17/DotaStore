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
    <div class="container">
        <div class="slideBox ">
            <div class="breadCrumbBox">
                <div class="title">Sản phẩm</div>
            </div>
        </div>
    </div>
    <div class="masterPage productPage">
        <div class="container">
            <div class="sideBar">
                <div class="productLeft postLeft">

                    <h4 class="title">Bài viết liên quan</h4>
                    <div class="groupItem">
                        <div class="itemBox">
                            <div class="khungAnh">
                                <a href="http://fsvalue.com/post?slug=huong-dan-nap-tien" title=""
                                    class="khungAnhCrop0">
                                    <img alt="" class="" src="http://fsvalue.com/images/post/1581503402ewallet.jpg">
                                </a>
                            </div>
                            <h3 class="itemTitle">
                                <a href="http://fsvalue.com/post?slug=huong-dan-nap-tien" title="Hướng dẫn nạp tiền"
                                    style="color: ;">Hướng dẫn nạp tiền</a>
                            </h3>
                            <div class="itemPrice">
                                <!-- <span>0 đ</span> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wrap_list_post">
                <div class="masterMain">
                    <h1 class="pageTitle">Danh Sách Tin Tức - Hướng Dẫn</h1>
                    <br><br>
                    <div class="post">
                        <div class="anh">
                            <a href="http://fsvalue.com/post?slug=huong-dan-nap-tien" title="" class="">
                                <img alt="" class="" src="http://fsvalue.com/images/post/1581503402ewallet.jpg">
                            </a>
                        </div>
                        <div class="des">
                            <h2 class="itemTitle">
                                <a href="http://fsvalue.com/post?slug=huong-dan-nap-tien"
                                    title="Hướng dẫn nạp tiền">Hướng dẫn nạp tiền</a>
                            </h2>
                            <h4>
                                <span class="short_des">
                                    FStorevn xin hướng dẫn quý khách nạp tiền vào ví điện tử của FStorevn.netBước 5:
                                    Điền số tiền muốn nạp, ghi nhớ mã nạp tiền và ấn Xác nhận tạo đơn để nhận Mã nạp
                                    tiền và thông tin chuyển khoảnBước 6: Chuyển khoản theo số tiền và ngân hàng đã
                                    chọn;Phần nội dung chuyển khoản cần điền chính xác Mã nạp tiềnBước 7: Kiểm tra trạng
                                    thái nạp tiền tại Lịch sử nạp/rút tiền
                                </span>
                            </h4>
                            <h5>
                                <span class="date">
                                    2020-04-14 20:32:05
                                </span>
                            </h5>

                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <br>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<style>
    .productLeft {
        margin-top: 25px;
        display: block;
    }
    .productLeft .title {
        font: 18px/27px RobotoBold;
        color: #e4b35a;
        text-transform: uppercase;
        position: relative;
        padding-bottom: 5px;
        margin-bottom: 20px;
    }
    .productLeft .title:before {
        content: '';
        position: absolute;
        left: 0;
        bottom: 0;
        width: 50px;
        height: 3px;
        background-color: #e4b35a;
    }
    .productLeft .itemBox {
        margin-top: 20px;
    }
    .productLeft .itemTitle a {
        font: 14px/18px Roboto;
        color: #fff;
    }
    .productLeft .itemTitle a:hover {
        color: #e4b35a;
    }

    .productLeft .khungAnh {
        float: left;
        margin-right: 10px;
        width: 102px;
    }
    .productLeft .itemTitle {
        margin: -2px 0 4px;
        line-height: 18px;
        max-height: 40px;
        overflow: hidden;
        font-size: 0;
    }
    .productLeft .itemPrice {
        font: 14px/22px Roboto;
        color: #fff;
        margin-top: 5px;
    }
    .productLeft .khungAnh {
        float: left;
        margin-right: 10px;
        width: 102px;
    }
    .khungAnh {
        position: relative;
        z-index: 1;
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
    .khungAnh .khungAnhCrop0 img {
        /* -moz-transform: translate(-50%,-50%);
        -o-transform: translate(-50%,-50%);
        -webkit-transform: translate(-50%,-50%);
        transform: translate(-50%,-50%); */
    }
    .khungAnhCrop0 img {
        left: 50%;
        max-height: 100%;
        max-width: 100%;
        position: absolute;
        top: 50%;
        /* transform: translate(-50%,-50%); */
        z-index: 1;
    }

    .postLeft .itemBox img:hover{
        transform: none !important;
    }

    .masterPage {
        padding: 30px 0 60px;
    }
    .sideBar {
        background-color: #1b1f2a;
        padding: 20px 20px 30px;
        width: 280px;
        margin-right: 20px;
        float: left;
        min-height: 20px;
    }
    .masterMain {
        background-color: #1b1f2a;
        padding: 20px;
        width: calc(100% - 300px);
        float: left;
    }
    .pageTitle {
        font: 22px/32px RobotoBold;
        color: #e4b35a;
		text-align: center;
    }
    .shortDescription {
        margin-top: 40px;
		color:#fff;
		padding-left:10px;
		font-style: italic;
		font-size: 12px;
    }
    .shortDescription .col1 {
        width: calc(450/840*100%);
        margin-right: 20px;
        float: left;
    }
    .shortDescription .slideThumb {
        overflow: hidden;
    }
    .slick-slider {
        position: relative;
        display: block;
        box-sizing: border-box;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        -webkit-touch-callout: none;
        -khtml-user-select: none;
        -ms-touch-action: pan-y;
        touch-action: pan-y;
        -webkit-tap-highlight-color: transparent;
    }

    .shortDescription .col2 {
        width: calc(100% - 450/840*100% - 20px);
        float: left;
        margin-top: -10px;
    }
    .shortDescription .col2 .description span {
        width: 150px;
        display: inline-block;
        font-family: Roboto;
    }
    .shortDescription .col2>ul {
        margin: 0;
        padding: 0;
        list-style: none;
    }
    .shortDescription .col2>ul li {
        width: 100%;
        border-bottom: 1px solid #232836;
        font: 14px/22px Roboto;
        color: #fff;
        padding: 6px 0;
    }
    .shortDescription .col2>ul li span {
        width: 150px;
        display: inline-block;
        font-family: Roboto;
    }
    .shortDescription .col2 .description {
        font: 14px/22px Roboto;
        color: #fff;
        padding: 6px 0;
        border-bottom: 1px solid #232836;
        width: 100%;
    }
    .shortDescription .col2 .quantityChoose {
        margin: 15px 0 21px;
    }
    .quantityChoose span {
        font: 15px/40px RobotoBold;
        float: left;
        margin-right: 15px;
        color: #fff;
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
        color: #fff !important;
        cursor: pointer;
    }
    .quantityChoose li a.tru {
        border-radius: 4px 0 0 4px;
    }
    .quantityChoose li a.cong {
        border-radius: 0 4px 4px 0;
    }
    .quantityChoose li a.tru, .quantityChoose li a.cong {
        pointer-events: auto;
        width: 25px;
        background-color: #1b1f2a;
    }
    .quantityChoose .datHang {
        color: #1b1f2a;
        background: #e4b35a;
        padding: 0 35px;
        float: right;
        height: 40px;
        font: 14px/40px RobotoBold;
        text-transform: uppercase;
        cursor: pointer;
    }
    .quantityChoose .datHang:hover {
        -webkit-filter: brightness(120%);
        filter: brightness(120%);
        -ms-filter: brightness(120%);
        -moz-filter: brightness(120%);
        -o-filter: brightness(120%);
    }
    .iconSocial {
        height: 21px;
    }
    .iconSocial .addthis_sharing_toolbox {
        float: left;
        margin-top: 1px;
    }

    .fullDescription {
        margin-top: 5px;
    }
    .fullDescription .tabs {
        margin: 0;
        padding: 0 25px;
        list-style: none;
    }
    .fullDescription .tabs li {
        float: left;
        margin-right: 10px;
    }
    .fullDescription .tabs a {
        display: inline-block;
        color: #fff;
        font: 15px/37px RobotoBold;
        border: 1px solid #333a4e;
        border-bottom: none!important;
        border-radius: 4px 4px 0 0;
        background-color: #232836;
        padding: 0 30px;
    }
    .fullDescription .description {
        padding: 30px 30px;
        border: 1px solid #333a4e;
        background-color: #232836;
        color: #fff;
        font: 14px/24px Roboto;
        min-height: 100px;
    }

    .fullDescription .tabs li.active a, .fullDescription .tabs a:hover {
        border: 1px solid #e4b35a;
        color: #1b1f2a;
        background-color: #e4b35a;
    }

    .fbComment {
        margin-top: 30px;
        margin-bottom: 40px;
    }
    .fbComment .title {
        font-family: RobotoBold;
        text-transform: uppercase;
        font-size: 18px;
        line-height: 22px;
        color: #fff;
        margin: 0 0 20px;
    }
    .fbComment .content {
        border: 1px solid #e2e2e2;
        padding: 5px 2px;
        background: #fff;
    }
     .tab2 {
        display: none;
    }

    .wrap_list_post .post{
        width: 100%;
        padding: 20px 0;
        min-height: 160px;
        border-bottom: #fff dotted 1px;
    }

    .wrap_list_post .post:last-child {
        border-bottom: none!important;
    }

    .wrap_list_post .des{
        width: 70%;
        float: left;
        padding-left:5%;
        max-height: 160px;
        overflow: hidden;
    }

    .wrap_list_post .des .itemTitle a{
        font-weight: bold;
        color:#5d5d5d;
    }

    .wrap_list_post .des a, .wrap_list_post .des .short_des{
        margin-top:5px;
        color:#fff;
    }

    .wrap_list_post .des .short_des{
        max-height: 100px;
        display: block;
        overflow :hidden;
        font-size: 14px;
    }

    .wrap_list_post .des a:hover{
        opacity: 0.6;
    }

    .wrap_list_post .post .anh{
        width: 30%;
        float: left;
    }

    .wrap_list_post .post img{
        width: 100%;
        max-width: 100%;
    }

    .wrap_list_post .des .date{
        color:#fff;
        font-size:11px;
        font-style: italic;
    }

    .wrap_list_post .pageTitle{
        border-bottom: 2px solid;
    }

    .clearfix::after {
        content: "";
        clear: both;
        display: table;
    }

</style>
</html>