package vn.com.stanford.service;

import java.util.List;

import vn.com.stanford.entity.HoaDonBan;

public interface HoaDonBanDao extends HanhDong<HoaDonBan, String>{
	List<HoaDonBan> timKiem(int khachHangId);
}
