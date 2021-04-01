package vn.com.stanford.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class AuthorizationInterceptor implements Interceptor {

	public AuthorizationInterceptor() {
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void init() {
		// TODO Auto-generated method stub

	}

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> session = arg0.getInvocationContext().getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		if (session.get("username") != null) {
			String username = (String) session.get("username");
			
			System.out.println("Ban dang dang nhap voi Username: " + username);

		}else {
			response.sendRedirect("admin/dangNhap");
		}

		return arg0.invoke();
	}

}
