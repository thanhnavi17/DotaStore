package vn.com.stanford.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

import vn.com.stanford.entity.NguoiDung;
import vn.com.stanford.service.MaHoa;
import vn.com.stanford.service.NguoiDungDao;
import vn.com.stanford.service.NguoiDungImpl;

public class DangKyAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1713607006246642665L;
	
	@Autowired
	private NguoiDungDao ndDao;

	private NguoiDung objND;

	public NguoiDung getObjND() {
		return objND;
	}

	public void setObjND(NguoiDung objND) {
		this.objND = objND;
	}
	
	@Override
	public String execute() throws Exception {
		
		return SUCCESS;
	}
	
	private String tenND;
	private String email;
	private String dienThoai;
	private String tenDangNhap;
	private String matKhau;
	
	public String getTenND() {
		return tenND;
	}

	public void setTenND(String tenND) {
		this.tenND = tenND;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDienThoai() {
		return dienThoai;
	}

	public void setDienThoai(String dienThoai) {
		this.dienThoai = dienThoai;
	}

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
	
	private String ketQua;

	public String getKetQua() {
		return ketQua;
	}

	public void setKetQua(String ketQua) {
		this.ketQua = ketQua;
	}

	public String dangKyTrangChu() {
		System.out.println(matKhau);
		System.out.println(tenDangNhap);
		NguoiDung objKT = new NguoiDung();
		objKT = ndDao.ktraDN(tenDangNhap);

		if(objKT != null) {
			ketQua = "Tài khoản đã tồn tại";
		}
		else {
			NguoiDung objNDNew = new NguoiDung();
			objNDNew.setTenND(tenND);
			objNDNew.setTenDangNhap(tenDangNhap);
			objNDNew.setDienThoai(dienThoai);
			objNDNew.setEmail(email);
			objNDNew.setMatKhau(MaHoa.maHoa(matKhau));
			objNDNew.setVaiTroId(5);
	
			ndDao.themMoi(objNDNew);
			ketQua = "Đăng kí thành công";

		}
		return SUCCESS;
	}
}
