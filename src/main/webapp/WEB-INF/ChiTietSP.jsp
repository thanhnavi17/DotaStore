<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!-- Khai báo sử dụng tags của struts -->
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/chitiet.css" rel="stylesheet" type="text/css" />
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
				<div class="productLeft">
					<h4 class="title">Sản phẩm nổi bật</h4>
					<div class="groupItem">
						<s:iterator value="lstSanPham" var="sp">
							<div class="itemBox">
								<div class="khungAnh">
									<a href="chitietsp.action?ma=${sp.maSP}"
										title="${sp.tenSP }" class="khungAnhCrop0"> <img
										alt="${sp.tenSP }" class=""
										src="images/item/${sp.image }">
									</a>

								</div>
								<h3 class="itemTitle">
									<a href="chitietsp.action?ma=${sp.maSP}"
										title="${sp.tenSP }" style="color: rgb(173, 229, 92);">${sp.tenSP }</a>
								</h3>
								<div class="itemPrice" style="color: #b7bbcb;">
									<span>${sp.gia }</span>
								</div>
							</div>
						</s:iterator>
					</div>
				</div>
			</div>

			<div class="masterMain">
				<h1 class="pageTitle">${objSP.tenSP }</h1>
				<div class="shortDescription">
					<div class="col1">
						<div class="slideThumb">
							<div class="slideFor slick-initialized slick-slider">
								<div aria-live="polite" class="slick-list draggable">
									<div class="slick-track" style="opacity: 1; width: 445px;"
										role="listbox">
										<div class="item slick-slide slick-current slick-active"
											data-slick-index="0" aria-hidden="false" tabindex="-1"
											role="option" aria-describedby="slick-slide00"
											style="width: 445px; position: relative; left: 0px; top: 0px; z-index: 999; opacity: 1;">
											<div class="itemBox1">
												<div class="khungAnh">
													<a href="#" class="khungAnhCrop0" tabindex="0"> <img
														alt="${objSP.tenSP }" class=""
														src="images/item/${objSP.image }">
													</a>

												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
							<div class="slideNav slick-initialized slick-slider">

								<div aria-live="polite" class="slick-list draggable">
									<div class="slick-track"
										style="opacity: 1; width: 91px; transform: translate3d(0px, 0px, 0px);"
										role="listbox">
										<div class="item slick-slide slick-current slick-active"
											data-slick-index="0" aria-hidden="false" tabindex="-1"
											role="option" aria-describedby="slick-slide10"
											style="width: 91px;">
											<div class="itemBox1">
												<div class="khungAnh">
													<a href="javascript://" class="khungAnhCrop0" tabindex="0">
														<img alt="${objSP.tenSP }" class=""
														src="images/item/${objSP.image }">
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="col2">
						<ul>
							<li><span>Giá bán</span>${objSP.gia *0.9 }</li>
						</ul>
						<ul>
							<li><span>Tình trạng</span>${objSP.ghiChu }</li>
						</ul>
						<div class="description">
							<span>Mô tả sản phẩm</span> <span>phantom_assassin Arcana
								wearable</span>
						</div>
						<div class="quantityChoose">
							<span>Số lượng</span>
							<ul>
								<li><a class="tru"><i class="fa fa-minus"
										aria-hidden="true"></i></a></li>
								<li><a id="quantity" class="val">1</a></li>
								<li><a class="cong"><i class="fa fa-plus"
										aria-hidden="true"></i></a></li>
							</ul>
								<a class="datHang" title="Đặt hàng" data-item-id="${objSP.maSP }"
									>Đặt hàng</a>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('.tru').click(function(){
			tru();
		});
		
		$('.cong').click(function(){
			cong();
		});
		
		$('.datHang').click(function(){
			var maSP = $(this).attr('data-item-id');

            var valObj = $(this).parent().parent().find('.val');
            var currentQty = valObj.html();

			$.ajax({
            	type: "GET",
            	url: "datHang",
            	data: {
            		ma : maSP,
            		soLuong : currentQty
            	},
            	success : function(result){
            		if(currentQty > 1){
            			$('#alert .text').html(result.ketQua);
            			$('#alert').addClass('active');
            			$('#totalItem').html(result.soLuongTrongGio);
            		}
            	}
            });
		});
	});
	
	function tru() {
        let obj = $('#quantity');
        let current = obj.html();
        if(current > 0) {
            obj.html(--current);
        }
    }

    function cong() {
        let obj = $('#quantity');
        let current = obj.html();
        obj.html(++current);
    }
</script>
</body>
</html>