package vn.com.stanford.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="HoaDonBanChiTiet")
public class HoaDonBanChiTiet implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5777338596300587939L;

	private String hoaDonID;
	private int maSP;
	private int soLuong;
	private float giaBan;
	private String tenSP;
	private String hinhAnh;
	
	@Id
	@Column(name="HoaDonID", unique = true , nullable = false)
	public String getHoaDonID() {
		return hoaDonID;
	}
	
	public void setHoaDonID(String hoaDonID) {
		this.hoaDonID = hoaDonID;
	}
	
	@Id
	@Column(name="MaSP", unique = true ,nullable = false)
	public int getMaSP() {
		return maSP;
	}
	
	public void setMaSP(int maSP) {
		this.maSP = maSP;
	}
	
	@Column(name="SoLuong", nullable = true)
	public int getSoLuong() {
		return soLuong;
	}
	
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
	@Column(name="GiaBan", nullable = true)
	public float getGiaBan() {
		return giaBan;
	}
	
	public void setGiaBan(float giaBan) {
		this.giaBan = giaBan;
	}
	
	@Column(name="TenSP", nullable = true)
	public String getTenSP() {
		return tenSP;
	}
	
	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}
	
	@Column(name="HinhAnh", nullable = true)
	public String getHinhAnh() {
		return hinhAnh;
	}
	
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	
}
