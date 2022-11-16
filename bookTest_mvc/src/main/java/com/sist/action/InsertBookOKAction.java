package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.BookDAO;
import com.sist.vo.BookVO;

public class InsertBookOKAction implements SistAction {

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
		int re = dao.insertBook(b);
		String msg = "등록 성공";
		if(re<=0) {
			msg="등록 실패";
		}
		request.setAttribute("msg", msg);
		return "insertBookOK.jsp";
	}

}
