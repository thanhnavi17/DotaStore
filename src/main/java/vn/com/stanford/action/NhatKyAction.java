package vn.com.stanford.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import vn.com.stanford.entity.NhatKy;
import vn.com.stanford.service.NhatKyDao;

public class NhatKyAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5093319804751501831L;
	
	@Autowired
	private NhatKyDao nkDao;

	public void setNkDao(NhatKyDao nkDao) {
		this.nkDao = nkDao;
	}
	
	private List<NhatKy> lstNhatKy = new ArrayList<NhatKy>();
	
	public List<NhatKy> getLstNhatKy() {
		return lstNhatKy;
	}

	public void setLstNhatKy(List<NhatKy> lstNhatKy) {
		this.lstNhatKy = lstNhatKy;
	}

	@Override
	public String execute() throws Exception {
		lstNhatKy = nkDao.layDanhSach();
		return SUCCESS;
	}
}
