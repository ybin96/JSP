package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

/**
 * Servlet implementation class insertMemberOK
 */
@WebServlet("/insertMemberOK")
public class insertMemberOK extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertMemberOK() {
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
		// 사용자가 입력한 정보를 가져온다 (id,pwd,name)
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI();
		String ip = request.getRemoteAddr();
		
		MemberVO m = new MemberVO(id,pwd,name);
		MemberDAO dao = new MemberDAO();
		int re = dao.insertMember(m);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(re>0) {
			out.print("<h2>신규회원 등록</h2>");
		}else {
			out.print("<h2>신규회원 등록 실패</h2>");
		}
		out.print("URL:"+url+"<br>");
		out.print("URi:"+uri+"<br>");
		out.print("ip:"+ip+"<br>");
		out.print("<a href='insertMember.html'>신규회원 등록하러가기</a>");
	}

}
