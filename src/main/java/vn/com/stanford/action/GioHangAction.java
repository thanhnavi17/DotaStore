package vn.com.stanford.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import vn.com.stanford.service.*;
import vn.com.stanford.entity.*;
import static org.apache.commons.lang3.RandomStringUtils.randomAlphanumeric;

public class GioHangAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7466245560285570200L;
	
	@Autowired
	SanPhamDao spDao;

	private int ma;

	public int getMa() {
		return ma;
	}

	public void setMa(int ma) {
		this.ma = ma;
	}
	
	private int soLuong;
	
	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	private List<GioHang> listGioHang = new ArrayList<GioHang>();
	
	public List<GioHang> getListGioHang() {
		return listGioHang;
	}

	public void setListGioHang(List<GioHang> listGioHang) {
		this.listGioHang = listGioHang;
	}

	@Override
	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		listGioHang = (List<GioHang>)session.get("cart");
		
		return SUCCESS;
	}
	
	private String ketQua;
	
	public String getKetQua() {
		return ketQua;
	}

	public void setKetQua(String ketQua) {
		this.ketQua = ketQua;
	}

	public String addCart()
	{
		System.out.println(ma);
		//Lấy session
		Map<String, Object> session = ActionContext.getContext().getSession();
		
		List<GioHang> lstGioHang = new ArrayList<GioHang>();
		//Nếu giỏ hàng chưa có gì
		if(session.get("cart") == null) {
			
			SanPham objSP = spDao.layChiTiet(ma);
			GioHang objGH = new GioHang();
			objGH.setSanPham(objSP);
			objGH.setSoLuong(1);
			lstGioHang.add(objGH);
			
			session.put("cart", lstGioHang);
			int soLuongSP = soLuongSP(lstGioHang);
			session.put("quantity", soLuongSP);
			session.put("tongTien", tongTien(lstGioHang));
			
		}else { //Nếu giỏ hàng đã có sản phẩm
			lstGioHang = (List<GioHang>)session.get("cart");
			boolean isTonTai = false;
			//nếu sản phẩm đã tồn tại trong giỏ
			for(int i = 0;i<lstGioHang.size();i++) 
			{
				if(lstGioHang.get(i).getSanPham().getMaSP() == ma) 
				{
					lstGioHang.get(i).setSoLuong(lstGioHang.get(i).getSoLuong()+1);
					
					isTonTai = true;
				}
			}
			if(!isTonTai) { //Nếu sp chưa tồn tại
				SanPham objSP = spDao.layChiTiet(ma);
				GioHang objGH = new GioHang();
				objGH.setSanPham(objSP);
				objGH.setSoLuong(1);
				lstGioHang.add(objGH);
			}
			session.put("cart", lstGioHang);
			int soLuongSP = soLuongSP(lstGioHang);
			session.put("quantity", soLuongSP);
			session.put("tongTien", tongTien(lstGioHang));
		}
		
		hienThiDuLieuTrangChu();
		return SUCCESS;
	}
	
	private int soLuongSP(List<GioHang> lstGioHang) {
		int soLuongSP = 0;
		soLuongSP = lstGioHang.size();
		return soLuongSP;
	}
	
	private float tongTien(List<GioHang> lstGioHang) {
		float tongTien = 0;
		for(int i = 0;i<lstGioHang.size();i++) {
			tongTien += (lstGioHang.get(i).getSoLuong()*lstGioHang.get(i).getSanPham().getGia());
		}
		return tongTien;
	}
	
	private List<SanPham> lstSanPham = new ArrayList<SanPham>();
	private List<Hero> lstHeroStr = new ArrayList<Hero>();
	private List<Hero> lstHeroAgi = new ArrayList<Hero>();
	private List<Hero> lstHeroInt = new ArrayList<Hero>();
	
	public List<SanPham> getLstSanPham() {
		return lstSanPham;
	}

	public void setLstSanPham(List<SanPham> lstSanPham) {
		this.lstSanPham = lstSanPham;
	}

	public List<Hero> getLstHeroStr() {
		return lstHeroStr;
	}

	public void setLstHeroStr(List<Hero> lstHeroStr) {
		this.lstHeroStr = lstHeroStr;
	}

	public List<Hero> getLstHeroAgi() {
		return lstHeroAgi;
	}

	public void setLstHeroAgi(List<Hero> lstHeroAgi) {
		this.lstHeroAgi = lstHeroAgi;
	}

	public List<Hero> getLstHeroInt() {
		return lstHeroInt;
	}

	public void setLstHeroInt(List<Hero> lstHeroInt) {
		this.lstHeroInt = lstHeroInt;
	}

	private void hienThiDuLieuTrangChu() {

		HeroDao hrDao = new HeroImpl();
		// lấy danh sản phẩm
		lstSanPham = spDao.layDanhSach();

		// Lấy danh sách hero
		lstHeroStr = hrDao.timKiemTheoStat(1);
		lstHeroAgi = hrDao.timKiemTheoStat(2);
		lstHeroInt = hrDao.timKiemTheoStat(3);
	}
	
	//Khai báo mã sp để thực hiện việc xoá 
	private int maSP;
	
	public int getMaSP() {
		return maSP;
	}

	public void setMaSP(int maSP) {
		this.maSP = maSP;
	}

	public String removeCart() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		List<GioHang> lstGioHang = (List<GioHang>)session.get("cart");
		for(int i = 0;i<lstGioHang.size();i++) {
			if(lstGioHang.get(i).getSanPham().getMaSP() == maSP) {
				lstGioHang.remove(i);
			}
		}
		session.put("cart", lstGioHang);
		session.put("quantity", soLuongSP(lstGioHang));
		session.put("tongTien", tongTien(lstGioHang));
		listGioHang = (List<GioHang>)session.get("cart");
		return SUCCESS;
	}
	
	
	
	public String thayDoiSoLuong() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		List<GioHang> lstGioHang = (List<GioHang>)session.get("cart");
		for(int i = 0;i<lstGioHang.size();i++) {
			if(lstGioHang.get(i).getSanPham().getMaSP()== ma) {
				lstGioHang.get(i).setSoLuong(lstGioHang.get(i).getSoLuong()+soLuong);
			}
		}
		session.put("cart", lstGioHang);
		session.put("quantity", soLuongSP(lstGioHang));
		session.put("tongTien", tongTien(lstGioHang));
		ketQua = ""+tongTien(lstGioHang);
		return SUCCESS;
	}
	
	private int soLuongTrongGio;
	
	public int getSoLuongTrongGio() {
		return soLuongTrongGio;
	}

	public void setSoLuongTrongGio(int soLuongTrongGio) {
		this.soLuongTrongGio = soLuongTrongGio;
	}

	public String datHang() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		List<GioHang> lstGioHang = new ArrayList<GioHang>();
		System.out.println(ma);
		System.out.println(soLuong);
		// Nếu giỏ hàng chưa có gì
		if (session.get("cart") == null) {
			
			SanPham objSP = spDao.layChiTiet(ma);
			
			GioHang objGH = new GioHang();
			objGH.setSanPham(objSP);
			
			objGH.setSoLuong(soLuong);

			lstGioHang.add(objGH);
			
			session.put("cart", lstGioHang);
			session.put("quantity", soLuongSP(lstGioHang));
			session.put("tongTien", tongTien(lstGioHang));
			
			ketQua = "Thêm vật phẩm "+ objGH.getSanPham().getTenSP()+ " vào giỏ hàng thành công";
			soLuongTrongGio = soLuongSP(lstGioHang);

		} else { // Nếu giỏ hàng đã có sản phẩm
			lstGioHang = (List<GioHang>) session.get("cart");
			boolean isTonTai = false;
			// nếu sản phẩm đã tồn tại trong giỏ
			for (int i = 0; i < lstGioHang.size(); i++) {
				if (lstGioHang.get(i).getSanPham().getMaSP() == ma) {
					lstGioHang.get(i).setSoLuong(lstGioHang.get(i).getSoLuong() + soLuong);

					isTonTai = true;
					ketQua = "Thêm vật phẩm "+lstGioHang.get(i).getSanPham().getTenSP()+" vào giỏ hàng thành công";

				}
			}
			if (!isTonTai) { // Nếu sp chưa tồn tại
				SanPham objSP = spDao.layChiTiet(ma);
				GioHang objGH = new GioHang();
				objGH.setSanPham(objSP);
				objGH.setSoLuong(1);
				lstGioHang.add(objGH);
				ketQua = "Thêm vật phẩm "+objGH.getSanPham().getTenSP()+" vào giỏ hàng thành công";
			}
			session.put("cart", lstGioHang);
			session.put("quantity", soLuongSP(lstGioHang));
			session.put("tongTien", tongTien(lstGioHang));
		}
		soLuongTrongGio = soLuongSP(lstGioHang);

		return SUCCESS;
	}
	
	private String tongTienHang;
	private String taiKhoanND;
	private String thongBao;
	public String getTongTienHang() {
		return tongTienHang;
	}
	public void setTongTienHang(String tongTienHang) {
		this.tongTienHang = tongTienHang;
	}
	public String getTaiKhoanND() {
		return taiKhoanND;
	}
	public void setTaiKhoanND(String taiKhoanND) {
		this.taiKhoanND = taiKhoanND;
	}
	public String getThongBao() {
		return thongBao;
	}
	public void setThongBao(String thongBao) {
		this.thongBao = thongBao;
	}
	
	public String thanhToan() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		float tongTien = (Float)session.get("tongTien");
		float taiKhoan = (Float)session.get("taiKhoan");
		if(taiKhoan >= tongTien) {
			float soDu = taiKhoan - tongTien;
			session.put("taiKhoan", soDu);

			thongBao = "Thanh toán thành công";
			System.out.println(thongBao);
			NguoiDungDao ndDao = new NguoiDungImpl();
			NguoiDung objND = ndDao.layChiTiet((Integer)session.get("userID"));
			objND.setTaiKhoan(soDu);
			ndDao.capNhat(objND);
			
			//Viết hoá đơn
			HoaDonBanDao hdDao = new HoaDonBanImpl();
			HoaDonBan objHD = new HoaDonBan();
			String maHoaDon = randomAlphanumeric(6);
			objHD.setMaHoaDon(maHoaDon);
			objHD.setKhachHangId(objND.getMaND());
			Date ngay = new Date();
			objHD.setNgayBan(ngay);
			objHD.setTongHoaDon(tongTien);
			hdDao.themMoi(objHD);
			
			//Hoá đơn chi tiết
			HoaDonCTDao hdctDao = new HoaDonCTImpl();
			HoaDonBanChiTiet objCT = new HoaDonBanChiTiet();
			objCT.setHoaDonID(maHoaDon);
			List<GioHang> lstGioHang = (List<GioHang>)session.get("cart");
			for(int i = 0;i<lstGioHang.size();i++) {
				objCT.setMaSP(lstGioHang.get(i).getSanPham().getMaSP());
				objCT.setTenSP(lstGioHang.get(i).getSanPham().getTenSP());
				objCT.setSoLuong(lstGioHang.get(i).getSoLuong());
				objCT.setGiaBan(lstGioHang.get(i).getSanPham().getGia());
				objCT.setHinhAnh(lstGioHang.get(i).getSanPham().getImage());
				
				hdctDao.themMoi(objCT);
			}
			
			session.remove("cart");
			session.put("quantity", 0);
			session.put("tongTien", 0);
		}else {
			thongBao = "Tài khoản không đủ, vui lòng nạp thêm";
			System.out.println(thongBao);
		}
		listGioHang = (List<GioHang>)session.get("cart");
		return SUCCESS;
	}
}
