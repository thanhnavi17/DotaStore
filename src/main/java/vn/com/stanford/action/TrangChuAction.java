package vn.com.stanford.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import vn.com.stanford.service.HeroDao;
import vn.com.stanford.service.MaHoa;
import vn.com.stanford.service.NguoiDungDao;
import vn.com.stanford.service.SanPhamDao;
import vn.com.stanford.entity.*;

public class TrangChuAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8280891544440579204L;
	
	@Autowired
	private SanPhamDao spDao;
	
	@Autowired
	private HeroDao hrDao;
	
	public void setSpDao(SanPhamDao spDao) {
		this.spDao = spDao;
	}

	private List<SanPham> lstSanPham = new ArrayList<SanPham>();
	
	public List<SanPham> getLstSanPham() {
		return lstSanPham;
	}


	public void setLstSanPham(List<SanPham> lstSanPham) {
		this.lstSanPham = lstSanPham;
	}
	
	private List<Hero> lstHeroStr = new ArrayList<Hero>();
	private List<Hero> lstHeroAgi = new ArrayList<Hero>();
	private List<Hero> lstHeroInt = new ArrayList<Hero>();
	
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


	@Override
	public String execute() throws Exception {
		hienThiDuLieuTrangChu();
		return SUCCESS;
	}
	
	private int heroID;

	public int getHeroID() {
		return heroID;
	}

	public void setHeroID(int heroID) {
		this.heroID = heroID;
	}

	private String tuKhoa;
	private String maLoai;

	public String getTuKhoa() {
		return tuKhoa;
	}

	public void setTuKhoa(String tuKhoa) {
		this.tuKhoa = tuKhoa;
	}

	public String getMaLoai() {
		return maLoai;
	}

	public void setMaLoai(String maLoai) {
		this.maLoai = maLoai;
	}

	public String timKiemSPTrangChu() {
		lstSanPham = spDao.timKiemSP(tuKhoa, maLoai, heroID);
		// Lấy danh sách hero
		lstHeroStr = hrDao.timKiemTheoStat(1);
		lstHeroAgi = hrDao.timKiemTheoStat(2);
		lstHeroInt = hrDao.timKiemTheoStat(3);
		return SUCCESS;
	}
	
	private String tenDangNhap;
	private String matKhau;
	
	public String getTenDangNhap() {
		return tenDangNhap;
	}

	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	
	@Autowired
	NguoiDungDao ndDao;
	
	private NguoiDung objND;

	public NguoiDung getObjND() {
		return objND;
	}

	public void setObjND(NguoiDung objND) {
		this.objND = objND;
	}

	private String ketQua ="";
	
	public String getKetQua() {
		return ketQua;
	}

	public void setKetQua(String ketQua) {
		this.ketQua = ketQua;
	}

	public String dangNhapTrangChu()
	{
		hienThiDuLieuTrangChu();
		// Kiểm tra đăng nhập
		System.out.println(tenDangNhap);
		objND = ndDao.ktraDN(tenDangNhap);
		String matKhauDB = MaHoa.maHoa(matKhau);
		System.out.println(objND.getTenDangNhap()+ "ten dang nhap la");
		if (objND != null) {
			if (matKhauDB.equals(objND.getMatKhau())) {
				// Sau khi đăng nhập thành công thì gán vào session
				Map<String, Object> session = ActionContext.getContext().getSession();

				System.out.println("Đăng nhập hệ thống thành công");
				ketQua = "Chào mừng" + objND.getTenND();
				// Lưu thông tin đăng nhập vào session
				session.put("username", tenDangNhap);
				session.put("hoTen", objND.getTenND());
				session.put("taiKhoan", objND.getTaiKhoan());
				session.put("userID", objND.getMaND());
				return SUCCESS;
			}
		} else {
			System.out.println("Đăng nhập thất bại. Bạn vui lòng kiểm tra lại thông tin");
			ketQua = "";
		}
		return SUCCESS;
	}
	
	private Map<String, Object> s;
	
	public String dangXuatTrangChu() {
		s = ActionContext.getContext().getSession();
		s.remove("username");
		s.remove("hoTen");
		s.remove("taiKhoan");
		s.remove("userID");
		s.remove("cart");
		s.remove("quantity");
		s.remove("tongTien");
		hienThiDuLieuTrangChu();
		return SUCCESS;
	}
	
	private int ma;

	public int getMa() {
		return ma;
	}

	public void setMa(int ma) {
		this.ma = ma;
	}

	public String hienThiThongTinCaNhanTrangChu()
	{
		System.out.println(ma);
		objND = ndDao.layChiTiet(ma);
		return SUCCESS;
	}
	
	private void hienThiDuLieuTrangChu() {
		// lấy danh sản phẩm
		lstSanPham = spDao.layDanhSach();

		// Lấy danh sách hero
		lstHeroStr = hrDao.timKiemTheoStat(1);
		lstHeroAgi = hrDao.timKiemTheoStat(2);
		lstHeroInt = hrDao.timKiemTheoStat(3);
	}
	
	public String doiMatKhauTrangChu() {
		return SUCCESS;
	}
}
