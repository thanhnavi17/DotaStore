package vn.com.stanford.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import vn.com.stanford.entity.NguoiDung;
import vn.com.stanford.entity.VaiTro;
import vn.com.stanford.service.*;


public class NguoiDungAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8814022850278206240L;

	private Map<String, Object> s;
	
	@Autowired
	private NguoiDungDao ndDao;
	
	public void setNdDao(NguoiDungDao ndDao) {
		this.ndDao = ndDao;
	}

	private NguoiDung objND;
	
	public NguoiDung getObjND() {
		return objND;
	}

	public void setObjND(NguoiDung objND) {
		this.objND = objND;
	}

	private List<NguoiDung> lstNguoiDung = new ArrayList<NguoiDung>();

	public List<NguoiDung> getLstNguoiDung() {
		return lstNguoiDung;
	}

	public void setLstNguoiDung(List<NguoiDung> lstNguoiDung) {
		this.lstNguoiDung = lstNguoiDung;
	}
	
	private List<VaiTro> lstVaiTro = new ArrayList<VaiTro>();
	
	public List<VaiTro> getLstVaiTro() {
		return lstVaiTro;
	}

	public void setLstVaiTro(List<VaiTro> lstVaiTro) {
		this.lstVaiTro = lstVaiTro;
	}

	@Override
	public String execute() throws Exception {
		hienThiVaiTro();
		lstNguoiDung = ndDao.layDanhSach();
		VaiTroDao vtDao = new VaiTroImpl();
		for(int i = 0;i<lstNguoiDung.size();i++)
		{
			VaiTro objVT = new VaiTro();
			objVT = vtDao.layChiTiet(lstNguoiDung.get(i).getVaiTroId());
			
			lstNguoiDung.get(i).setTenVaiTro(objVT.getTenVaiTro());
		}
		s = ActionContext.getContext().getSession();
		String username = (String)s.get("username");
		System.out.println("welcome "+username);
//		NguoiDung objND = ndDao.ktraDN(username);
//		if(objND.getVaiTroId()==1) {
			return SUCCESS;
//		}else {
//			HttpServletResponse response = ServletActionContext.getResponse();
//			response.sendRedirect("ThongBaoLoi.jsp");
//		}
//		return ERROR;
	}
	
	private int userId;
	
	
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String xoaThongTinNguoiDung()
	{
		if (userId!=0) {
			boolean ketQua = ndDao.xoa(userId);

			if (ketQua) {
				return SUCCESS;
			}
		}

		return ERROR;
	}
	
	public String chiTietThongTinND()
	{
		
		if(userId>0) {
			objND = ndDao.layChiTiet(userId);
		}
		System.out.println(objND.getTenDangNhap());
		hienThiVaiTro();
		return SUCCESS;
	}
	
	public String phanQuyenND() {
		hienThiVaiTro();
		VaiTroDao vtDao = new VaiTroImpl();
		lstVaiTro = vtDao.layDanhSach();
		return SUCCESS;
	}
	
	private void hienThiVaiTro()
	{
		VaiTroDao vt = new VaiTroImpl();
		lstVaiTro = vt.layDanhSach();
		VaiTro root = new VaiTro();
		root.setMaVaiTro(0);
		root.setTenVaiTro("---Chọn vai trò---");
		lstVaiTro.add(0, root);
	}
	
	
	
	private String tuKhoa="";
	private int vaiTroId;

	public String getTuKhoa() {
		return tuKhoa;
	}

	public void setTuKhoa(String tuKhoa) {
		this.tuKhoa = tuKhoa;
	}

	public int getVaiTroId() {
		return vaiTroId;
	}

	public void setVaiTroId(int vaiTroId) {
		this.vaiTroId = vaiTroId;
	}
	
	public String timKiemThongTinND() {
		System.out.println("aaa");

		hienThiVaiTro();
		lstNguoiDung = ndDao.timKiemND(tuKhoa, vaiTroId);
		
		return SUCCESS;
	}
	
	public String dangXuat()
	{
		s = ActionContext.getContext().getSession();
		s.remove("username");
	
		return SUCCESS;
	}
	
	public String capNhatThongTinNguoiDung()
	{
		hienThiVaiTro();
		return SUCCESS;
	}
}
