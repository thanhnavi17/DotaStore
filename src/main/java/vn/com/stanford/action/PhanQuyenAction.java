/**
 * 
 */
package vn.com.stanford.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import vn.com.stanford.entity.ChucNang;
import vn.com.stanford.entity.NguoiDung;
import vn.com.stanford.entity.PhanQuyen;
import vn.com.stanford.entity.VaiTro;
import vn.com.stanford.service.ChucNangDao;
import vn.com.stanford.service.NguoiDungDao;
import vn.com.stanford.service.PhanQuyenDao;
import vn.com.stanford.service.VaiTroDao;
import vn.com.stanford.service.VaiTroImpl;

/**
 * @author Admin
 *
 */
public class PhanQuyenAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4354666707952355697L;
	
	private Map<String, Object> s;
	
	private int vaiTroId;
	
	public int getVaiTroId() {
		return vaiTroId;
	}

	public void setVaiTroId(int vaiTroId) {
		this.vaiTroId = vaiTroId;
	}
	
	@Autowired
	private NguoiDungDao ndDao;

	@Autowired
	private PhanQuyenDao pqDao;

	@Autowired
	private ChucNangDao cnDao;
	
	private List<VaiTro> lstVaiTro = new ArrayList<VaiTro>();

	public List<VaiTro> getLstVaiTro() {
		return lstVaiTro;
	}

	public void setLstVaiTro(List<VaiTro> lstVaiTro) {
		this.lstVaiTro = lstVaiTro;
	}

	@Override
	public String execute() throws Exception {
		s = ActionContext.getContext().getSession();
		String username = (String)s.get("username");
		System.out.println(username);
		NguoiDung objUser = ndDao.ktraDN(username);
		if(objUser.getVaiTroId()==1 || objUser.getVaiTroId()==2) {
			VaiTroDao vt = new VaiTroImpl();
			lstVaiTro = vt.layDanhSach();
		}
		else {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.sendRedirect("ThongBaoLoi.jsp");
		}
		return SUCCESS;
	}
	
	private List<ChucNang> lstChucNang = new ArrayList<ChucNang>();
	private List<PhanQuyen> lstChucNang2 = new ArrayList<PhanQuyen>();
	private List<PhanQuyen> lstPhanQuyen = new ArrayList<PhanQuyen>();

	public List<ChucNang> getLstChucNang() {
		return lstChucNang;
	}

	public void setLstChucNang(List<ChucNang> lstChucNang) {
		this.lstChucNang = lstChucNang;
	}

	public List<PhanQuyen> getLstChucNang2() {
		return lstChucNang2;
	}

	public void setLstChucNang2(List<PhanQuyen> lstChucNang2) {
		this.lstChucNang2 = lstChucNang2;
	}

	public List<PhanQuyen> getLstPhanQuyen() {
		return lstPhanQuyen;
	}

	public void setLstPhanQuyen(List<PhanQuyen> lstPhanQuyen) {
		this.lstPhanQuyen = lstPhanQuyen;
	}

	public String hienThiChucNang()
	{
		List<PhanQuyen> lstChucNangTheoVT = new ArrayList<PhanQuyen>();
		lstChucNangTheoVT = pqDao.timKiemTheoVaiTro(vaiTroId);
		for(int i = 0;i<lstChucNangTheoVT.size();i++) {
			ChucNang objCN = new ChucNang();
			objCN.setId(lstChucNangTheoVT.get(i).getChucNangId());
			objCN.setTenChucNang(lstChucNangTheoVT.get(i).getTenChucNang());
			lstChucNang.add(objCN);
		}
		return SUCCESS;
	}
	
}
