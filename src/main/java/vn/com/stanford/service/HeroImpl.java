package vn.com.stanford.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import vn.com.stanford.entity.Hero;

@Service
public class HeroImpl implements HeroDao {

	@Override
	public List<Hero> layDanhSach() {
		// Khai báo 1 danh sách
		List<Hero> lstHero = new ArrayList<Hero>();

		// Kết nối đến db qua hibernate
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		// Khởi tạo 1 transaction
		Transaction tx = session.beginTransaction();

		TypedQuery<Hero> query = session.createQuery("from Hero", Hero.class);

		lstHero = query.getResultList();

		tx.commit();

		// Trả về danh sách
		return lstHero;
	}

	@Override
	public Hero layChiTiet(Integer ma) {
		// Khai báo 1 đối tượng sách
		Hero obj = null;

		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Lấy đối tượng sách theo mã
		obj = (Hero) session.get(Hero.class, ma);

		tx.commit();

		return obj;
	}

	@Override
	public boolean themMoi(Hero obj) {
		// Kết nối đến db
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();

		// Thực hiện thêm mới thông tin
		session.save(obj);

		tx.commit();

		return true;
	}

	@Override
	public boolean capNhat(Hero obj) {
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
	public List<Hero> timKiemTheoStat(int statID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();

		Transaction tx = session.beginTransaction();
		

		TypedQuery<Hero> query = session
				.createQuery("from Hero where statID = :ma", Hero.class);

		query.setParameter("ma", statID);
		List<Hero> lst = query.getResultList();
		tx.commit();
		return lst;
	}

}
