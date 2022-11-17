package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.DeptDAO;
import com.sist.vo.DeptVO;

public class InsertDeptOKAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DeptVO d = new DeptVO();
		int dno = Integer.parseInt(request.getParameter("dno"));
		String dname = request.getParameter("dname");
		String dloc = request.getParameter("dloc");
		d.setDno(dno);
		d.setDname(dname);
		d.setDloc(dloc);
		
		DeptDAO dao = DeptDAO.getInstance();
		int re = dao.insertDept(d);
		request.setAttribute("re", re);
		
		return "insertDeptOK.jsp";
	}

}
