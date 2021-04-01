/**
 * 
 */
package vn.com.stanford.service;

import java.util.ArrayList;
import java.util.List;

import vn.com.stanford.entity.*;



/**
 * @author Admin
 *
 */
public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		List<LoaiSP> lstSP = new ArrayList<LoaiSP>();
		
		LoaiSPDao hrDao = new LoaiSPImpl();
		lstSP = hrDao.layDanhSach();

		lstSP.forEach((s) -> {
			System.out.println(s.getLoaiSP());
		});
	}

}
