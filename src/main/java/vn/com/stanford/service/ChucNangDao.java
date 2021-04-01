package vn.com.stanford.service;

import java.util.List;

import vn.com.stanford.entity.ChucNang;

public interface ChucNangDao extends HanhDong<ChucNang, Integer>{
	List<ChucNang> layDanhSachTheoVaiTro(int vaiTroId);
}
