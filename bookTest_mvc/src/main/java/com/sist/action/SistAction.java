package com.sist.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SistAction {
	public String pro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
