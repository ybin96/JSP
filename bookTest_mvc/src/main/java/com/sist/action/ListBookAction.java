package com.sist.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.BookDAO;
import com.sist.vo.BookVO;

public class ListBookAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BookDAO dao = BookDAO.getInstance();
		ArrayList<BookVO> list = dao.findAll();
		
		// list를 상태유지하기위해 사용
		request.setAttribute("list", list);
		return "listBook.jsp";
	}

}
