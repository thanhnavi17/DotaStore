package vn.com.stanford.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import vn.com.stanford.entity.HoaDonBan;

@Service
public class HoaDonBanImpl implements HoaDonBanDao {

	@Override
	public List<HoaDonBan> layDanhSach() {
		// Khai báo 1 danh sách
		List<HoaDonBan> lstNguoiDung = new ArrayList<HoaDonBan>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<HoaDonBan> query = session.createQuery("from HoaDonBan", HoaDonBan.class);

		lstNguoiDung = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstNguoiDung;
	}

	@Override
	public HoaDonBan layChiTiet(String ma) {
		// Khai báo 1 đối tượng sách
		HoaDonBan obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (HoaDonBan) session.get(HoaDonBan.class, ma);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(HoaDonBan obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(HoaDonBan obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean xoa(String ma) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<HoaDonBan> timKiem(int khachHangId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<HoaDonBan> query = session
				.createQuery("from HoaDonBan where khachHangId = :ma", HoaDonBan.class);
		query.setParameter("ma", khachHangId);
		List<HoaDonBan> lst = query.getResultList();
		tx.commit();
		return lst;
	}

}
