package vn.com.stanford.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;

import vn.com.stanford.entity.VaiTro;

public class VaiTroImpl implements VaiTroDao {

	@Override
	public List<VaiTro> layDanhSach() {
		// Khai báo 1 danh sách
		List<VaiTro> lstVaiTro = new ArrayList<VaiTro>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<VaiTro> query = session.createQuery("from VaiTro", VaiTro.class);

		lstVaiTro = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstVaiTro;
	}

	@Override
	public VaiTro layChiTiet(Integer ma) {
		// Khai báo 1 đối tượng sách
		VaiTro obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (VaiTro) session.get(VaiTro.class, ma);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(VaiTro obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(VaiTro obj) {
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
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách cần xoá
		VaiTro obj = (VaiTro) session.get(VaiTro.class, ma);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

}
