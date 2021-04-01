/**
 * 
 */
package vn.com.stanford.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;

import vn.com.stanford.entity.NguoiDung;
import vn.com.stanford.service.MaHoa;
import vn.com.stanford.service.NguoiDungDao;
import vn.com.stanford.service.NguoiDungImpl;

/**
 * @author Admin
 *
 */
public class DangNhapAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5430851378792498555L;

	private String tenDangNhap;
	private String matKhau;

	@RequiredFieldValidator(message = "Bạn cần nhập tên đăng nhập")
	public String getTenDangNhap() {
		return tenDangNhap;
	}

	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}

	@RequiredFieldValidator(message = "Bạn cần nhập mật khẩu đăng nhập")
	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	@Override
	public String execute() {

		return INPUT;
	}

	
	@Override
	public void validate() { // TODO Auto-generated method stub
		/*
		 * if(StringUtils.isBlank(tenDangNhap)) {
		 * addActionError("Bạn cần nhập tên đăng nhập"); } }
		 */
		super.validate();
	}
	
	//Khai báo đối tượng đăng nhập
	NguoiDungDao ndDao = new NguoiDungImpl();
	private NguoiDung objND;
	

	public NguoiDung getObjND() {
		return objND;
	}

	public void setObjND(NguoiDung objND) {
		this.objND = objND;
	}

	public String dangNhapHeThong() {
		System.out.println("Tên đăng nhập: " + tenDangNhap);
		System.out.println("Mật khẩu: " + matKhau);
		//Kiểm tra đăng nhập
		objND = ndDao.ktraDN(tenDangNhap);
		String matKhauDB = MaHoa.maHoa(matKhau);
		if(objND!=null) {
			if(matKhauDB.equals(objND.getMatKhau())) {
				// Sau khi đăng nhập thành công thì gán vào session
				Map<String, Object> session = ActionContext.getContext().getSession();

				System.out.println("Đăng nhập hệ thống thành công");

				// Lưu thông tin đăng nhập vào session
				session.put("username", tenDangNhap);
				session.put("role", objND.getVaiTroId());
				return SUCCESS;
			}
		}else {
			System.out.println("Đăng nhập thất bại. Bạn vui lòng kiểm tra lại thông tin");
		}
		return ERROR;
	}
}
