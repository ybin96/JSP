package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.BookDAO;
import com.sist.vo.BookVO;

public class UpdateBookOKAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookVO b = new BookVO();
		int bookid= Integer.parseInt(request.getParameter("bookid"));
		String bookname= request.getParameter("bookname");
		String publisher= request.getParameter("publisher");
		int price= Integer.parseInt(request.getParameter("price"));
		b.setBookid(bookid);
		b.setBookname(bookname);
		b.setPrice(price);
		b.setPublisher(publisher);
		
		BookDAO dao = BookDAO.getInstance();
		int re = dao.updateBook(b);
		String msg = "수정 성공";
		if(re<0) {
			msg = "수정 실패";
		}
		
		request.setAttribute("msg", msg);
		return "updateBookOK.jsp";
	}

}
