package vn.com.stanford.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import vn.com.stanford.entity.NhatKy;

@Service(value="NhatKyDao")
public class NhatKyImpl implements NhatKyDao{

	@Override
	public List<NhatKy> layDanhSach() {
		// Khai báo 1 danh sách
		List<NhatKy> lstNhatKy = new ArrayList<NhatKy>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<NhatKy> query = session.createQuery("from NhatKy", NhatKy.class);

		lstNhatKy = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstNhatKy;
	}

	@Override
	public NhatKy layChiTiet(Integer ma) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean themMoi(NhatKy obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean capNhat(NhatKy obj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean xoa(Integer ma) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
