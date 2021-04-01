package vn.com.stanford.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;

import vn.com.stanford.entity.LoaiSP;

public class LoaiSPImpl implements LoaiSPDao {

	@Override
	public List<LoaiSP> layDanhSach() {
		// Khai báo 1 danh sách
		List<LoaiSP> lstSanPham = new ArrayList<LoaiSP>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<LoaiSP> query = session.createQuery("from LoaiSP", LoaiSP.class);

		lstSanPham = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstSanPham;
	}

	@Override
	public LoaiSP layChiTiet(Integer ma) {
		// Khai báo 1 đối tượng sách
		LoaiSP obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (LoaiSP) session.get(LoaiSP.class, ma);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(LoaiSP obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(LoaiSP obj) {
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
		LoaiSP obj = (LoaiSP) session.get(LoaiSP.class, ma);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

}
