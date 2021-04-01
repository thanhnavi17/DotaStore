package vn.com.stanford.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import vn.com.stanford.entity.NguoiDung;

@Service
public class NguoiDungImpl implements NguoiDungDao {

	@Override
	public List<NguoiDung> layDanhSach() {
		// Khai báo 1 danh sách
		List<NguoiDung> lstNguoiDung = new ArrayList<NguoiDung>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<NguoiDung> query = session.createQuery("from NguoiDung", NguoiDung.class);

		lstNguoiDung = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstNguoiDung;
	}

	@Override
	public NguoiDung layChiTiet(Integer ma) {
		// Khai báo 1 đối tượng sách
		NguoiDung obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (NguoiDung) session.get(NguoiDung.class, ma);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(NguoiDung obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(NguoiDung obj) {
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
		NguoiDung obj = (NguoiDung) session.get(NguoiDung.class, ma);

		if (obj != null) {
			session.delete(obj);

			tx.commit();

			return true;
		}

		return false;
	}

	@Override
	public NguoiDung ktraDN(String tenDangNhap) {
		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		// Khởi 1 phiên giao dịch trong hibernate
		Transaction tx = session.beginTransaction();
		TypedQuery<NguoiDung> query = session.createQuery(" from NguoiDung where username = :ten", NguoiDung.class);
		// Thiết lập tham số
		query.setParameter("ten", tenDangNhap);
		// Lấy danh sách
		List<NguoiDung> lst = query.getResultList();
		tx.commit();
		if (lst.size() > 0) {
			return lst.get(0);
		}
		// Trả về kết quả
		return null;
	}

	@Override
	public List<NguoiDung> timKiemND(String tuKhoa, int vaiTroId) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		String cauLenh = "from NguoiDung where 1=1";
		if(tuKhoa!=null&&!tuKhoa.isEmpty()) {
			cauLenh += " and Username like '%"+tuKhoa+"%' or TenKH like '%"+tuKhoa+"%'";
		}
		if(vaiTroId>0) {
			cauLenh += " and vaiTroId = "+ vaiTroId;
		}
		System.out.println(cauLenh);
		TypedQuery<NguoiDung> query = session
				.createQuery(cauLenh, NguoiDung.class);
//		query.setParameter("ten", "%" + tuKhoa + "%");
//		query.setParameter("ma", vaiTroId);
		List<NguoiDung> lst = query.getResultList();
		tx.commit();
		return lst;
	}

}
