<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Khai báo sử dụng tags của struts -->
<%@ taglib prefix="s" uri="/struts-tags"%>
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
	<div style="height: 30px"></div>
	<div id="thongBao" class="msg_add_cart msg_add_cart_success alert alert-success" style="display:none;"></div>
	<div class="msg_add_cart msg_add_cart_error alert alert-danger" style="display:none;"></div>
	<div class="container masterPage productPage">
		<s:form id="form_search" method="get" action="timKiemTrangChu">
							
			<div class="search-left">
				<div class="filter-cat-group">
					<div class="filter-cat-title filter-cat-title-left">
						<span class="glyphicon glyphicon-option-vertical">Filter</span>
					</div>
					<div class="filter-cat-content-right filter-parameter"
						style="min-height: 50px;">
						<a href="trangchu" class="fist-filter">Xoá filter</a>
					</div>
				</div>
				
				<div class="filter-cat-group-image">
					<div class="filter-cat-title filter-cat-title-top">
						<span class="glyphicon glyphicon-option-vertical">Strength</span>
					</div>
					<div class="filter-cat-content hero_strength">
					<s:iterator value="lstHeroStr" var="str">
						<div class="filter-hero">
							<a href='<s:url action="timKiemTrangChu?heroID=%{id}"/>' class="a_filter" data-type='hero'
								data-val=<s:property value="id"/>> <img class="mask "
								src="images/hero/${str.hinhAnh }"
								width="62" height="35" alt="axe" />
							</a>
						</div>
						</s:iterator>	
					</div>
				</div>

				<div class="filter-cat-group-image">
					<div class="filter-cat-title filter-cat-title-top">
						<span class="glyphicon glyphicon-option-vertical"></span>Agility
					</div>
					<div class="filter-cat-content hero_agility">
					<s:iterator value="lstHeroAgi" var="agi">
						<div class="filter-hero">
							<a href='<s:url action="timKiemTrangChu?heroID=%{id}"/>' class="a_filter" data-type='hero'
								data-val=<s:property value="id"/>> <img class="mask "
								src="images/hero/${agi.hinhAnh }"
								width="62" height="35" alt="monkey_king" />
							</a>
						</div>
						</s:iterator>
					</div>
				</div>

				<div class="filter-cat-group-image">
					<div class="filter-cat-title filter-cat-title-top">
						<span class="glyphicon glyphicon-option-vertical"></span>Intelligence
					</div>
					<div class="filter-cat-content hero_intelligence">
						<s:iterator value="lstHeroInt" var="i">
						<div class="filter-hero">
							<a href='<s:url action="timKiemTrangChu?heroID=%{id}"/>' class="a_filter" data-type='hero'
								data-val=<s:property value="id"/>> <img class="mask "
								src="images/hero/${i.hinhAnh }"
								width="62" height="35" alt="dark_willow" />
							</a>
						</div>
						</s:iterator>
					</div>
				</div>


			</div>
			<div class="masterMain">

				<h1 class="pageTitle1">Dota2 Items</h1>

				<div class="filter">
					<span>Sắp xếp theo giá</span>
					<ul>
						<li class="  "><a class="order asc " data-order="desc">
								Từ thấp đến cao </a></li>
					</ul>
					<div class="searchBox">
						<input id="tkSanPham" type="text" name="tuKhoa"
							placeholder="Tìm kiếm sản phẩm..." value=""> <a
							class="btnSearch"><i class="fa fa-search" aria-hidden="true"></i></a>
					</div>
				</div>

				<div class="productDS productPage">
					<div class="groupItem">
					<s:iterator value="lstSanPham" var="sp">
						<div class="itemBox">
							<div class="khungAnh">
								<a href='<s:url action="chitietsp?ma=%{maSP}"/>'
									title="${sp.tenSP }" class="khungAnhCrop0"> <img
									alt="${sp.tenSP }" class=""
									src="images/item/${sp.image }">
								</a>
							</div>
							<h3 class="itemTitle">
								<a href='<s:url action="chitietsp?ma=%{maSP}"/>'
									style="color: rgb(173, 229, 92);"><s:property value="tenSP"/></a>
							</h3>
							<div class="itemPrice">
								<span><s:property value="gia*0.9"/>.đ</span> <span class="old_price"><s:property value="gia"/>.đ</span>
							</div>
							<div class="btnClick">
										<a class="addCart" data-item-id="${sp.maSP }" href=
											"addCart?ma=${maSP}">Thêm vào giỏ</a>
									</div>
						</div>
						</s:iterator>
					</div>
					
				</div>
			</div>
		</s:form>
	</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$('.addCart').click(function(e){
			$('#alert .text').html("Thêm sản phẩm vào giỏ hàng thành công");
			$('#alert').addClass('active');
		})
	});
</script>
</html>