package vn.com.stanford.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;

import vn.com.stanford.entity.PhanQuyen;

public class PhanQuyenImpl implements PhanQuyenDao {

	@Override
	public List<PhanQuyen> layDanhSach() {
		// Khai báo 1 danh sách
		List<PhanQuyen> lstPhanQuyen = new ArrayList<PhanQuyen>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();
		
		TypedQuery<PhanQuyen> query = session.createQuery("from PhanQuyen", PhanQuyen.class);

		lstPhanQuyen = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstPhanQuyen;
	}

	@Override
	public PhanQuyen layChiTiet(Integer ma) {
		// Khai báo 1 đối tượng sách
		PhanQuyen obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (PhanQuyen) session.get(PhanQuyen.class, ma);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(PhanQuyen obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean capNhat(PhanQuyen obj) {
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
	public List<PhanQuyen> timKiemTheoVaiTro(int vaiTroId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		TypedQuery<PhanQuyen> query = session.createQuery("from PhanQuyen where vaiTroId = :ma", PhanQuyen.class);

//		query.setParameter("ten", "%" + tuKhoa + "%");
		query.setParameter("ma", vaiTroId);
		List<PhanQuyen> lst = query.getResultList();

		tx.commit();
		return lst;
	}

}
