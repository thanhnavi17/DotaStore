package vn.com.stanford.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SanPham")
public class SanPham implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2666699787662782722L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="MaSP", unique = true , nullable = false)
	private int maSP;
	
	@Column(name="TenSP", nullable = true, length=50)
	private String tenSP = "";
	
	@Column(name="Gia", nullable = true)
	private float gia = 0;
	
	@Column(name="SoLuongTon", nullable = true)
	private int soLuongTon = 0;
	
	@Column(name="MaNPH", nullable = true)
	private int maNPH = 0;
	
	@Column(name="GhiChu", nullable = true)
	private String ghiChu = "";
	
	@Column(name="MaLoai", nullable = true)
	private int maLoai = 0;
	
	@Column(name="Image", nullable = true)
	private String image = "";
	
	@Column(name="HeroID", nullable = true)
	private int heroID;
	
	
	public int getMaSP() {
		return maSP;
	}
	public void setMaSP(int maSP) {
		this.maSP = maSP;
	}
	
	
	public String getTenSP() {
		return tenSP;
	}
	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}
	
	
	public float getGia() {
		return gia;
	}
	public void setGia(float gia) {
		this.gia = gia;
	}
	
	
	public int getSoLuongTon() {
		return soLuongTon;
	}
	public void setSoLuongTon(int soLuongTon) {
		this.soLuongTon = soLuongTon;
	}
	
	
	public int getMaNPH() {
		return maNPH;
	}
	public void setMaNPH(int maNPH) {
		this.maNPH = maNPH;
	}
	
	
	public String getGhiChu() {
		return ghiChu;
	}
	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
	
	
	public int getMaLoai() {
		return maLoai;
	}
	public void setMaLoai(int maLoai) {
		this.maLoai = maLoai;
	}
	
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	public int getHeroID() {
		return heroID;
	}
	public void setHeroID(int heroID) {
		this.heroID = heroID;
	}
	
	//Khai báo thuộc tính để chứa số lượng sản phẩm
	@Column(name="SoLuong", nullable = true)
	private int soLuong;

	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
	
}
