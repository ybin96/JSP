package com.sist.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;

public class UpdateBoardOKAction implements SistAction {

	@Override
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getRealPath("upload");
		MultipartRequest multi
			= new MultipartRequest(request, path, 1024*1024*5, "utf-8", new DefaultFileRenamePolicy());
		int no = Integer.parseInt(multi.getParameter("no"));
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String pwd = multi.getParameter("pwd");
		String oldFname = multi.getParameter("oldFname");
		String fname = "";
		
		File file = multi.getFile("uploadFile");
		if(file != null) {
			fname = file.getName();
		}
		
		BoardVO b = new BoardVO();
		b.setNo(no);
		b.setTitle(title);
		b.setPwd(pwd);
		b.setFname(oldFname);
		if(fname != null && !fname.equals("")) {
			b.setFname(fname);
		}
		
		BoardDAO dao = new BoardDAO();
		int re = dao.updateBoard(b);
		if(re > 0) {
			if(fname != null && !fname.equals("")) {
				if(oldFname != null && !oldFname.equals("")) {
					File file2 = new File(path + "/" + oldFname);
					file2.delete();
				}
			}	
		}		
		request.setAttribute("re", re);
		return "updateBoardOK.jsp";
	}

}









