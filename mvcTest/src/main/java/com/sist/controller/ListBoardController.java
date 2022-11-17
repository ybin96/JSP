package com.sist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;

/**
 * Servlet implementation class ListBoardController
 */
@WebServlet("/listBoard.do")
public class ListBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListBoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchColumn = "";
		String keyword = "";
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("keyword") != null){
			searchColumn = (String)session.getAttribute("searchColumn");
			keyword = (String)session.getAttribute("keyword");
		}
		
		if(request.getParameter("keyword") != null){
			searchColumn = request.getParameter("searchColumn");
			keyword = request.getParameter("keyword");
		}
		
		System.out.println("검색칼럼 : "+searchColumn);
		System.out.println("검색어 : "+keyword);
	
		int pageNUM = 1;
		if(request.getParameter("pageNUM") != null) {
			pageNUM = Integer.parseInt(request.getParameter("pageNUM"));
		}
		
		
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> list  =  dao.findAll(pageNUM, searchColumn, keyword);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", dao.totalPage);
		
		session.setAttribute("searchColumn", searchColumn);
		session.setAttribute("keyword", keyword);
		
		
		RequestDispatcher dispatcher
		= request.getRequestDispatcher("listBoard.jsp");
		
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}




