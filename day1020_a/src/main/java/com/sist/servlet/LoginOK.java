package com.sist.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

/**
 * Servlet implementation class LoginOK
 */
@WebServlet("/loginOK")
public class LoginOK extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginOK() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberDAO dao = new MemberDAO();
		if(dao.isMember(id, pwd)) {
			MemberVO m = dao.findById(id);
			//HttpSession session = request.getSession();
			//session.setAttribute("member", m);
			request.getSession().setAttribute("member", m);
			response.sendRedirect("main.jsp");
		}else {
			response.sendRedirect("login.jsp");
		}
		
	}

}











