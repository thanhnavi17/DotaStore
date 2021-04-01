package vn.com.stanford.action;

import com.opensymphony.xwork2.ActionSupport;

public class BaiVietAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 848599055038300867L;

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	public String themMoiBaiViet() {
		return SUCCESS;
	}
}
