package vn.com.stanford.service;

import java.util.List;

import vn.com.stanford.entity.SanPham;

public interface SanPhamDao extends HanhDong<SanPham, Integer>{
	List<SanPham> timKiemSP(String tuKhoa,String maLoai,int heroID);
	List<SanPham> arcana(int maLoai);
	List<SanPham> timKiemSanPham(int maSP);
}
