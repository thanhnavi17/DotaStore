package vn.com.stanford.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="HoaDonBan")
public class HoaDonBan implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5786669175589159760L;

	private String maHoaDon;
	private Date ngayBan;
	private float tongHoaDon;
	int khachHangId;
	
	@Id
	@Column(name="MaHoaDon", unique = true , nullable = false)
	public String getMaHoaDon() {
		return maHoaDon;
	}
	
	public void setMaHoaDon(String maHoaDon) {
		this.maHoaDon = maHoaDon;
	}
	
	@Column(name="NgayBan", nullable = true)
	public Date getNgayBan() {
		return ngayBan;
	}
	public void setNgayBan(Date ngayBan) {
		this.ngayBan = ngayBan;
	}
	
	@Column(name="TongHoaDon", nullable = true)
	public float getTongHoaDon() {
		return tongHoaDon;
	}
	public void setTongHoaDon(float tongHoaDon) {
		this.tongHoaDon = tongHoaDon;
	}
	
	@Column(name="KhachHangID", nullable = true)
	public int getKhachHangId() {
		return khachHangId;
	}
	public void setKhachHangId(int khachHangId) {
		this.khachHangId = khachHangId;
	}
	
	private int maTrangThai;

	@Column(name="TrangThai", nullable = true)
	public int getMaTrangThai() {
		return maTrangThai;
	}

	public void setMaTrangThai(int maTrangThai) {
		this.maTrangThai = maTrangThai;
	}
	
	private String trangThai;

	@Transient
	public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	
	private String hoTen;

	@Transient
	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	
}
