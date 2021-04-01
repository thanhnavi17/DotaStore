package vn.com.stanford.service;

import java.util.List;

import vn.com.stanford.entity.HoaDonBanChiTiet;

public interface HoaDonCTDao extends HanhDong<HoaDonBanChiTiet, String>{
	List<HoaDonBanChiTiet> timKiemTheoMa(String maHoaDon);
}
