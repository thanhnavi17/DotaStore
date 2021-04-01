package vn.com.stanford.service;

import java.util.List;

import vn.com.stanford.entity.PhanQuyen;

public interface PhanQuyenDao extends HanhDong<PhanQuyen, Integer>{
	List<PhanQuyen> timKiemTheoVaiTro(int vaiTroId);
}
