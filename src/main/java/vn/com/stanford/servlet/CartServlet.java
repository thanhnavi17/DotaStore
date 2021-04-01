package vn.com.stanford.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.com.stanford.entity.SanPham;
import vn.com.stanford.service.SanPhamDao;
import vn.com.stanford.service.SanPhamImpl;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Xử lý thêm sp vào giỏ hàng
		String maSanPham = req.getParameter("maSP");
		int maSP = Integer.parseInt(maSanPham);
		if(maSP > 0) {
			SanPhamDao spDao = new SanPhamImpl();
			
			SanPham objSP = spDao.layChiTiet(maSP);
			
			if(objSP != null) {
				//Kiểm tra session
				HttpSession session = req.getSession(true);
				
				if(session!=null) {
					//Khai báo 1 danh sách
					List<SanPham> lstSanPham = new ArrayList<SanPham>();
					
					if(session.getAttribute("cart") != null)
					{
						//Nếu giỏ hàng có lưu trong session thì lấy danh sách ra
						lstSanPham= (List<SanPham>)session.getAttribute("cart") ;
					}
					
					boolean isTonTai = false;
					//Duyệt xem sản phẩm đã có trong giỏ chưa
					for(int i = 0; i < lstSanPham.size(); i++)
					{
						if(lstSanPham.get(i).getMaSP()==objSP.getMaSP())
						{
							objSP.setSoLuong(lstSanPham.get(i).getSoLuong() + 1);
							//Gán vào danh sách
							lstSanPham.set(i, objSP);
							isTonTai = true;
						}
					}
					
					//Nếu sản phẩm chưa có trong giỏ hàng
					if(!isTonTai)
					{
						objSP.setSoLuong(1);
						
						//Thêm vào danh sách
						lstSanPham.add(objSP);
					}
					//Lưu vào session
					session.setAttribute("cart", lstSanPham);
					resp.sendRedirect("trangchu");
				}
			}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
