package vn.com.stanford.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import vn.com.stanford.entity.*;
import vn.com.stanford.service.*;

public class HoaDonAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5829763672017118965L;
	
	private List<HoaDonBan> lstHDBan = new ArrayList<HoaDonBan>();
	private List<HoaDonBanChiTiet> lstHDChiTiet = new ArrayList<HoaDonBanChiTiet>();

	public List<HoaDonBan> getLstHDBan() {
		return lstHDBan;
	}

	public void setLstHDBan(List<HoaDonBan> lstHDBan) {
		this.lstHDBan = lstHDBan;
	}

	public List<HoaDonBanChiTiet> getLstHDChiTiet() {
		return lstHDChiTiet;
	}

	public void setLstHDChiTiet(List<HoaDonBanChiTiet> lstHDChiTiet) {
		this.lstHDChiTiet = lstHDChiTiet;
	}

	@Autowired
	HoaDonBanDao hdDao;
	
	@Autowired
	HoaDonCTDao hdctDao;
	
	@Autowired
	NguoiDungDao ndDao;
	
	@Override
	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		String tenDangNhap = (String)session.get("username");
		NguoiDung objND = ndDao.ktraDN(tenDangNhap);
		lstHDBan = hdDao.timKiem(objND.getMaND());
		for(int i = 0;i<lstHDBan.size();i++) {
			if(lstHDBan.get(i).getMaTrangThai()==0) {
				lstHDBan.get(i).setTrangThai("Chưa hoàn thành");
			}else {
				lstHDBan.get(i).setTrangThai("Hoàn thành");
			}
		}
		return SUCCESS;
	}
	
	private String ma;
	
	public String getMa() {
		return ma;
	}

	public void setMa(String ma) {
		this.ma = ma;
	}
	
	private HoaDonBan objCT;

	public HoaDonBan getObjCT() {
		return objCT;
	}

	public void setObjCT(HoaDonBan objCT) {
		this.objCT = objCT;
	}

	public String hoaDonBanChiTiet() {
		System.out.println(ma);
		lstHDChiTiet = hdctDao.timKiemTheoMa(ma);

		objCT = hdDao.layChiTiet(ma);
		
		return SUCCESS;
	}
	
	private List<HoaDonBan> lstHoaDonAll = new ArrayList<HoaDonBan>();
	
	public List<HoaDonBan> getLstHoaDonAll() {
		return lstHoaDonAll;
	}

	public void setLstHoaDonAll(List<HoaDonBan> lstHoaDonAll) {
		this.lstHoaDonAll = lstHoaDonAll;
	}

	public String dsHoaDon() {
		lstHoaDonAll = hdDao.layDanhSach();

		for(int i = 0;i<lstHoaDonAll.size();i++) {
			NguoiDung objND = ndDao.layChiTiet(lstHoaDonAll.get(i).getKhachHangId());
			lstHoaDonAll.get(i).setHoTen(objND.getTenND());

		}
		return SUCCESS;
	}
}
