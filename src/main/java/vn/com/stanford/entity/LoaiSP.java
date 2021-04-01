package vn.com.stanford.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="LoaiSP")
public class LoaiSP implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3815762619515298692L;
	
	int maLoai;
	String loaiSP;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="MaLoai", unique = true , nullable = false)
	public int getMaLoai() {
		return maLoai;
	}
	public void setMaLoai(int maLoai) {
		this.maLoai = maLoai;
	}
	
	@Column(name="LoaiSP", nullable = true)
	public String getLoaiSP() {
		return loaiSP;
	}
	public void setLoaiSP(String loaiSP) {
		this.loaiSP = loaiSP;
	}
	
	
}
