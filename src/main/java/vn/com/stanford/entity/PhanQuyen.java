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
@Table(name="PhanQuyen")
public class PhanQuyen implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 71240422009263343L;
	int id = 0;
	int vaiTroId;
	int danhSach;
	int them;
	int sua;
	int xoa;
	int chucNangId;
	private String tenChucNang = "";
	
	@Transient
	public String getTenChucNang() {
		return tenChucNang;
	}
	public void setTenChucNang(String tenChucNang) {
		this.tenChucNang = tenChucNang;
	}
	
	@Column(name="ChucNangId", nullable = true)
	public int getChucNangId() {
		return chucNangId;
	}
	public void setChucNangId(int chucNangId) {
		this.chucNangId = chucNangId;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id", unique = true , nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="VaiTroId", nullable = true)
	public int getVaiTroId() {
		return vaiTroId;
	}
	public void setVaiTroId(int vaiTroId) {
		this.vaiTroId = vaiTroId;
	}
	
	@Column(name="DanhSach", nullable = true)
	public int getDanhSach() {
		return danhSach;
	}
	public void setDanhSach(int danhSach) {
		this.danhSach = danhSach;
	}
	
	@Column(name="Them", nullable = true)
	public int getThem() {
		return them;
	}
	public void setThem(int them) {
		this.them = them;
	}
	
	@Column(name="Sua", nullable = true)
	public int getSua() {
		return sua;
	}
	public void setSua(int sua) {
		this.sua = sua;
	}
	
	@Column(name="Xoa", nullable = true)
	public int getXoa() {
		return xoa;
	}
	public void setXoa(int xoa) {
		this.xoa = xoa;
	}
	
	
}
