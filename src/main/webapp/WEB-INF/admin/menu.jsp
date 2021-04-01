<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg" alt="User Image">
        <div>
          <p class="app-sidebar__user-name">Stanford Pro</p>
          <p class="app-sidebar__user-designation">Frontend Developer</p>
        </div>
      </div>
      <ul class="app-menu">
        <li><a class="app-menu__item" href="trangchu"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Trang chủ</span></a></li>
        <li><a class="app-menu__item" href="dssp.action" style="display:none"><i class="app-menu__icon fa fa-book"></i><span class="app-menu__label">Danh sách sản phẩm</span></a></li>
        <%
        System.out.print(session.getAttribute("role"));
        if(session.getAttribute("role").equals(4)){ 
        %>
        
        <li><a class="app-menu__item" href="capNhatThemMoi" style="display:none"><i class="app-menu__icon fa fa-pie-chart"></i><span class="app-menu__label">Thêm mới sản phẩm</span></a></li>
        <li><a class="app-menu__item" href="dsNhatKy.action" style="display:none"><i class="app-menu__icon fa fa-bars"></i><span class="app-menu__label">Nhật ký</span></a></li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview" style="display:none"><i class="app-menu__icon fa fa-edit"></i><span class="app-menu__label">Người dùng</span><i class="treeview-indicator fa fa-angle-right"></i></a>
        <%}else{ %>
        <li><a class="app-menu__item" href="dssp.action"><i class="app-menu__icon fa fa-book"></i><span class="app-menu__label">Danh sách sản phẩm</span></a></li>
        <li><a class="app-menu__item" href="capNhatThemMoi"><i class="app-menu__icon fa fa-pie-chart"></i><span class="app-menu__label">Thêm mới sản phẩm</span></a></li>
        <li><a class="app-menu__item" href="dsNhatKy.action"><i class="app-menu__icon fa fa-bars"></i><span class="app-menu__label">Nhật ký</span></a></li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-edit"></i><span class="app-menu__label">Người dùng</span><i class="treeview-indicator fa fa-angle-right"></i></a>
        <%} %>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="dsnguoidung.action"><i class="icon fa fa-circle-o"></i> Danh sách người dùng</a></li>
            <li><a class="treeview-item" href="phanQuyen.action"><i class="icon fa fa-circle-o"></i> Phân quyền</a></li>
            <li><a class="treeview-item" href="capNhatND.action"><i class="icon fa fa-circle-o"></i> Thêm mới tài khoản</a></li>
            <li><a class="treeview-item" href="form-notifications.html"><i class="icon fa fa-circle-o"></i> Form Notifications</a></li>
          </ul>
        </li>
        
        
      </ul>
    </aside>
</body>
</html>