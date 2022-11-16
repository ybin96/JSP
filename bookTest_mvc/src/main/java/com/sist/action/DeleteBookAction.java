package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.BookDAO;

public class DeleteBookAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		BookDAO dao = BookDAO.getInstance();
		int re = dao.deleteBook(bookid);
		request.setAttribute("re", re);
		return "deleteBook.jsp";
	}

}
