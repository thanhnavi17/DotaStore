package vn.com.stanford.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import vn.com.stanford.service.LoaiSPDao;
import vn.com.stanford.service.*;
import vn.com.stanford.entity.LoaiSP;
import vn.com.stanford.entity.NguoiDung;
import vn.com.stanford.entity.SanPham;

public class SanPhamAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4188542268999173706L;
	
	private Map<String, Object> s;

	@Autowired
	private SanPhamDao spDao;//= new SanPhamImpl();
	
	@Autowired
	private NguoiDungDao ndDao;
	
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
	
	private List<LoaiSP> lstLoai = new ArrayList<LoaiSP>();

	public List<LoaiSP> getLstLoai() {
		return lstLoai;
	}

	public void setLstLoai(List<LoaiSP> lstLoai) {
		this.lstLoai = lstLoai;
	}
	
	@Override
	public String execute() throws Exception {
		hienThiLoaiSP();
		//Lấy danh sách sp
		lstSanPham = spDao.layDanhSach();
		
		//Kiểm tra quyền
		s = ActionContext.getContext().getSession();
		String username = (String)s.get("username");
		NguoiDung objND = ndDao.ktraDN(username);
		int vaiTro = (Integer)s.get("role");
		if(objND.getVaiTroId()==5) {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.sendRedirect("trangchu");
		}else {
			return SUCCESS;
		}
		
		return ERROR;
	}
	
	@Autowired
	private LoaiSPDao loaiDao;
	
	public void setLoaiDao(LoaiSPDao loaiDao) {
		this.loaiDao = loaiDao;
	}
	
	private void hienThiLoaiSP() {
		
		lstLoai = loaiDao.layDanhSach();
		
		LoaiSP root = new LoaiSP();
		root.setMaLoai(0);
		root.setLoaiSP("--- Chọn loại sản phẩm ---");
		lstLoai.add(0, root);
	}
	
	//Khai báo 1 đối tượng để hiển thị chi tiết và lấy thông tin sửa xoá
	private SanPham objSP;
	
	public SanPham getObjSP() {
		return objSP;
	}

	public void setObjSP(SanPham objSP) {
		this.objSP = objSP;
	}

	//Khai báo từ khoá và mã loại để tìm kiếm
	private String tuKhoa = "";
	private String maLoai = "";
	private int heroID;

	public int getHeroID() {
		return heroID;
	}

	public void setHeroID(int heroID) {
		this.heroID = heroID;
	}

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
	
	public String timKiemSP() {
		hienThiLoaiSP();
		
		lstSanPham = spDao.timKiemSP(tuKhoa, maLoai,heroID);
		return SUCCESS;
	}
	
	//Lấy mã sp từ giao diện
	private int ma;
	
	public int getMa() {
		return ma;
	}

	public void setMa(int ma) {
		this.ma = ma;
	}

	public String chiTietSP() {
		hienThiLoaiSP();
		System.out.println(ma);
		if(ma>0) {
			objSP = spDao.layChiTiet(ma);
		}
		return SUCCESS;
	}
	
	//Khai báo mã sản phẩm
	private int maSP;
	
	public int getMaSP() {
		return maSP;
	}

	public void setMaSP(int maSP) {
		this.maSP = maSP;
	}

	//Khai báo các thuộc tính để xứ lý upload
	private File fileUpload;

	private String fileUploadFileName;

	private String fileUploadContentType;
	
	
	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public String capNhatThemMoiSP()
	{
		boolean kq = false;
		//Hiển thị loại sp
		hienThiLoaiSP();
		
		if (objSP != null) {
			// Bắt lỗi dữ liệu
			if (StringUtils.isEmpty(objSP.getTenSP())) {
				addActionError("Bạn cần phải nhập tên sách");
				return INPUT;
			}

			// Xử lý upload file
			if (fileUploadFileName != null && !fileUploadFileName.isEmpty() && fileUploadFileName.length() > 0) {
				try {
					// Lấy đường dẫn từ web.xml
					String filePath = ServletActionContext.getServletContext().getInitParameter("file-upload");
					System.out.println("Image Location:" + filePath);
					// Tạo 1 đối tượng file
					File fileToCreate = new File(filePath, fileUploadFileName);
					// Di chuyển file
					FileUtils.copyFile(fileUpload, fileToCreate);
				} catch (IOException ex) {
					System.err.println("Có lỗi xảy ra. Chi tiết: " + ex);
				}
				// Thực hiện gán ảnh để lưu vào db như sau
				objSP.setImage(fileUploadFileName);
			}
			
			// TH sửa
			System.out.println(maSP);
			if (maSP > 0) {
				kq = spDao.capNhat(objSP);
			} else {// TH thêm mới
				kq = spDao.themMoi(objSP);
			}

			if (kq) {
				return SUCCESS;
			}
		}
		return SUCCESS;
	}
	
	public String xoaThongTinSP()
	{
		if (ma > 0) {
			boolean ketQua = spDao.xoa(ma);

			if (ketQua) {
				return SUCCESS;
			}
		}
		return ERROR;
	}
	
	public String hienThiSPTrangChu()
	{
		lstSanPham = spDao.layDanhSach();
		
		return SUCCESS;
	}
	
	public String hienThiChiTietSP()
	{
		objSP = spDao.layChiTiet(ma);
		lstSanPham = spDao.arcana(3);
		return SUCCESS;
	}
	
}
