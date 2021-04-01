package vn.com.stanford.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Hero")
public class Hero implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7376829349794601610L;
	
	private int id;
	private String heroName;
	private int statID;
	private String hinhAnh;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="HeroID", unique = true , nullable = false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="HeroName", nullable = true)
	public String getHeroName() {
		return heroName;
	}
	public void setHeroName(String heroName) {
		this.heroName = heroName;
	}
	
	@Column(name="StatID", nullable = true)
	public int getStatID() {
		return statID;
	}
	public void setStatID(int statID) {
		this.statID = statID;
	}
	
	@Column(name="HeroImage", nullable = true)
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

}
