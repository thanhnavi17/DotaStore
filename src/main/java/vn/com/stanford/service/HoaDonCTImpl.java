package vn.com.stanford.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import vn.com.stanford.entity.HoaDonBanChiTiet;

@Service
public class HoaDonCTImpl implements HoaDonCTDao {

	@Override
	public List<HoaDonBanChiTiet> layDanhSach() {
		// Khai báo 1 danh sách
		List<HoaDonBanChiTiet> lstNguoiDung = new ArrayList<HoaDonBanChiTiet>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<HoaDonBanChiTiet> query = session.createQuery("from HoaDonBanChiTiet", HoaDonBanChiTiet.class);

		lstNguoiDung = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstNguoiDung;
	}

	@Override
	public HoaDonBanChiTiet layChiTiet(String ma) {
		// Khai báo 1 đối tượng sách
		HoaDonBanChiTiet obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (HoaDonBanChiTiet) session.get(HoaDonBanChiTiet.class, ma);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(HoaDonBanChiTiet obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(HoaDonBanChiTiet obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean xoa(String ma) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<HoaDonBanChiTiet> timKiemTheoMa(String maHoaDon) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		TypedQuery<HoaDonBanChiTiet> query = session
				.createQuery("from HoaDonBanChiTiet where HoaDonID = :ma", HoaDonBanChiTiet.class);
		query.setParameter("ma", maHoaDon);
		List<HoaDonBanChiTiet> lst = query.getResultList();
		tx.commit();
		return lst;
	}

}
