package vn.com.stanford.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="NguoiDung")
public class NguoiDung implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4997292902778936166L;
	
	int maND;
	String tenND;
	String email;
	String dienThoai;
	String diaChi;
	String tenDangNhap;
	String matKhau;
	float taiKhoan;
	int vaiTroId;
	String tenVaiTro;
	
	@Transient
	public String getTenVaiTro() {
		return tenVaiTro;
	}
	public void setTenVaiTro(String tenVaiTro) {
		this.tenVaiTro = tenVaiTro;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="maKH", unique = true , nullable = false)
	public int getMaND() {
		return maND;
	}
	public void setMaND(int maND) {
		this.maND = maND;
	}
	
	@Column(name="TenKH", nullable = true)
	public String getTenND() {
		return tenND;
	}
	public void setTenND(String tenND) {
		this.tenND = tenND;
	}
	
	@Column(name="Email", nullable = true)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name="DienThoai", nullable = true)
	public String getDienThoai() {
		return dienThoai;
	}
	public void setDienThoai(String dienThoai) {
		this.dienThoai = dienThoai;
	}
	
	@Column(name="DiaChi", nullable = true)
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	
	@Column(name="Username", nullable = true)
	public String getTenDangNhap() {
		return tenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}
	
	@Column(name="Password", nullable = true)
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	
	@Column(name="TaiKhoan", nullable = true)
	public float getTaiKhoan() {
		return taiKhoan;
	}
	public void setTaiKhoan(float taiKhoan) {
		this.taiKhoan = taiKhoan;
	}
	
	@Column(name="VaiTroID", nullable = true)
	public int getVaiTroId() {
		return vaiTroId;
	}
	public void setVaiTroId(int vaiTroId) {
		this.vaiTroId = vaiTroId;
	}
	
	
}
