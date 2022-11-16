package com.sist.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.action.DetailBookAction;
import com.sist.action.ListBookAction;
import com.sist.action.SistAction;

/**
 * Servlet implementation class SistController
 */
//@WebServlet("/SistController")
public class SistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, SistAction> map;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SistController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    

	@Override
	public void init(ServletConfig config) throws ServletException {
		// 실제 경로
		String path = config.getServletContext().getRealPath("WEB-INF");
		map = new HashMap<String,SistAction>();
		try {
			FileReader fr = new FileReader(path + "/sist.properties");
			// 파일의 내용을 key,value값으로 분리해서 알려주는 객체선언
			Properties prop = new Properties();
			prop.load(fr);
			// prop을 반복문돌리기 위해서 iterator이라는 객체를 생성
			Iterator iter = prop.keySet().iterator();
			while(iter.hasNext()) {
				String cmd = (String)iter.next();//key
				String clsName = (String)prop.getProperty(cmd);//value
				
				// map에 key,value를 담는다
				map.put(cmd, (SistAction)Class.forName(clsName).newInstance());
			}
		} catch (Exception e) {System.out.println("예외발생:"+e.getMessage());}
	}



	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("front controller 동작함");
		
		String uri = request.getRequestURI();
		System.out.println(uri);
		// uri : /bookTest_mvc/start.do
		
		String cmd = uri.substring(uri.lastIndexOf("/")+1);
		// cmd : start.do
		
		SistAction action = map.get(cmd);
		
		// view = jsp 주소 , request에 list라는 이름으로 상태유지를 하여 jsp로 이동한다
		String view = action.pro(request, response);
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
