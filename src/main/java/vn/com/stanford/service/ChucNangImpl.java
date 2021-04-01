package vn.com.stanford.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;

import vn.com.stanford.entity.ChucNang;

public class ChucNangImpl implements ChucNangDao {

	@Override
	public List<ChucNang> layDanhSach() {
		// Khai báo 1 danh sách
		List<ChucNang> lstChucNang = new ArrayList<ChucNang>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<ChucNang> query = session.createQuery("from ChucNang", ChucNang.class);

		lstChucNang = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstChucNang;
	}

	@Override
	public ChucNang layChiTiet(Integer ma) {
		// Khai báo 1 đối tượng sách
		ChucNang obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (ChucNang) session.get(ChucNang.class, ma);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(ChucNang obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean capNhat(ChucNang obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.update(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean xoa(Integer ma) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ChucNang> layDanhSachTheoVaiTro(int vaiTroId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<ChucNang> query = session
				.createQuery("from ChucNang where vaiTroId = :ma", ChucNang.class);
		query.setParameter("ma", vaiTroId);
		List<ChucNang> lst = query.getResultList();
		tx.commit();
		return lst;
	}

}
