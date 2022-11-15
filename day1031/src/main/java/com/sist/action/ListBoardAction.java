package com.sist.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;

public class ListBoardAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
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
		
		BoardDAO dao = new BoardDAO();
		int pageNUM = 1;
		if(request.getParameter("pageNUM") != null) {
			pageNUM = Integer.parseInt(request.getParameter("pageNUM"));
		}
		
		
		ArrayList<BoardVO> list = dao.findAll(pageNUM, searchColumn, keyword);
		request.setAttribute("list", list);	
		request.setAttribute("totalPage", dao.totalPage);
		
		session.setAttribute("searchColumn", searchColumn);
		session.setAttribute("keyword", keyword);
		
		
		return "listBoard.jsp";
	}

}










