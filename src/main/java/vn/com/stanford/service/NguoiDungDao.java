package vn.com.stanford.service;

import java.util.List;

import vn.com.stanford.entity.NguoiDung;

public interface NguoiDungDao extends HanhDong<NguoiDung, Integer>{
	NguoiDung ktraDN(String tenDangNhap);
	List<NguoiDung> timKiemND(String tuKhoa,int vaiTroId);
}
