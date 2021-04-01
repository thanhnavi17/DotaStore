package vn.com.stanford.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="VaiTro")
public class VaiTro implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8310527913480599310L;
	
	private int maVaiTro;
	private String tenVaiTro;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="MaVaiTro", unique = true , nullable = false)
	public int getMaVaiTro() {
		return maVaiTro;
	}
	public void setMaVaiTro(int maVaiTro) {
		this.maVaiTro = maVaiTro;
	}
	
	@Column(name="TenVaiTro", nullable = true)
	public String getTenVaiTro() {
		return tenVaiTro;
	}
	public void setTenVaiTro(String tenVaiTro) {
		this.tenVaiTro = tenVaiTro;
	}
	
	
}
