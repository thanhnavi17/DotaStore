package vn.com.stanford.service;

import java.util.List;


public interface HanhDong <T, idT> {

List<T> layDanhSach();
	
	T layChiTiet(idT ma);
	
	boolean themMoi(T obj);
	
	boolean capNhat(T obj);
	
	boolean xoa(idT ma);
}
