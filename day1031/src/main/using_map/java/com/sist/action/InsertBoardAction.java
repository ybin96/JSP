package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertBoardAction implements SistAction{

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no =0;
		String title = "새글작성";
		if(request.getParameter("no") != null) {
			no = Integer.parseInt(request.getParameter("no"));
			title = "답글작성";
		}
		
		request.setAttribute("no", no);
		request.setAttribute("title", title);
		
		
		
		return "insertBoard.jsp";
	}

}








