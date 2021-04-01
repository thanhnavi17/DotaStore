package vn.com.stanford.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="NhatKy")
public class NhatKy implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 574011212250834233L;
	
	private int nhatKyId, nguoiTaoId;
	private String noiDung,tenChucNang, diaChiIp;
	private Date ngayTao;
	private HanhDongEnum hanhDong;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "NhatKyId", unique = true, nullable = false)
	public int getNhatKyId() {
		return nhatKyId;
	}
	public void setNhatKyId(int nhatKyId) {
		this.nhatKyId = nhatKyId;
	}
	
	@Column(name = "HanhDong", nullable = true)
	@Convert(converter = HanhDongEnumConverter.class)
	public HanhDongEnum getHanhDong() {
		return hanhDong;
	}
	public void setHanhDong(HanhDongEnum hanhDong) {
		this.hanhDong = hanhDong;
	}
	@Column(name = "NguoiTaoId", nullable = true)
	public int getNguoiTaoId() {
		return nguoiTaoId;
	}
	public void setNguoiTaoId(int nguoiTaoId) {
		this.nguoiTaoId = nguoiTaoId;
	}
	
	@Column(name = "NoiDung", nullable = true)
	public String getNoiDung() {
		return noiDung;
	}
	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	
	@Column(name = "TenChucNang", nullable = true)
	public String getTenChucNang() {
		return tenChucNang;
	}
	public void setTenChucNang(String tenChucNang) {
		this.tenChucNang = tenChucNang;
	}
	
	@Column(name = "DiaChiIP", nullable = true)
	public String getDiaChiIp() {
		return diaChiIp;
	}
	public void setDiaChiIp(String diaChiIp) {
		this.diaChiIp = diaChiIp;
	}
	
	@Column(name = "NgayTao", nullable = true)
	public Date getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
	}
	
	
}
