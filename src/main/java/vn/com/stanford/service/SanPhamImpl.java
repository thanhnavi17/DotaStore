package vn.com.stanford.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;

import vn.com.stanford.entity.SanPham;


public class SanPhamImpl implements SanPhamDao {

	@Override
	public List<SanPham> layDanhSach() {
		// Khai báo 1 danh sách
		List<SanPham> lstSanPham = new ArrayList<SanPham>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<SanPham> query = session.createQuery("from SanPham", SanPham.class);

		lstSanPham = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstSanPham;
	}

	@Override
	public SanPham layChiTiet(Integer ma) {
		// Khai báo 1 đối tượng sách
		SanPham obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (SanPham) session.get(SanPham.class, ma);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(SanPham obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(SanPham obj) {
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
		SanPham obj = (SanPham) session.get(SanPham.class, ma);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public List<SanPham> timKiemSP(String tuKhoa, String maLoai, int heroID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		String cauLenh = "from SanPham where 1=1";
		if(tuKhoa!=null&&!tuKhoa.isEmpty()) {
			cauLenh += " and tenSP like '%"+tuKhoa+"%'";
		}
		if(maLoai!=null&&!maLoai.isEmpty()) {
			cauLenh += " and maLoai = '"+ maLoai+"'";
		}
		if(heroID>0) {
			cauLenh += " and heroID = '"+ heroID + "'";
		}
		TypedQuery<SanPham> query = session
				.createQuery(cauLenh, SanPham.class);
//		TypedQuery<SanPham> query = session
//				.createQuery("from SanPham where tenSP like :ten and maLoai = :ma", SanPham.class);
//		query.setParameter("ten", "%" + tuKhoa + "%");
//		query.setParameter("ma", "'"+maLoai+"'");
		
		List<SanPham> lst = query.getResultList();
		tx.commit();
		return lst;
	}

	@Override
	public List<SanPham> arcana(int maLoai) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		
		TypedQuery<SanPham> query = session
				.createQuery("from SanPham where maLoai =: ma", SanPham.class);
		query.setParameter("ma", maLoai);
		List<SanPham> lst = query.getResultList();
		tx.commit();
		return lst;
	}

	@Override
	public List<SanPham> timKiemSanPham(int maSP) {
		// TODO Auto-generated method stub
		return null;
	}

}
