package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.sist.vo.DeptVO;

public class DeptDAO {
	final String DRIVER_NAME = "oracle.jdbc.driver.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	final String USER = "c##madang";
	final String PWD = "madang";	
	
	public DeptDAO() {
		try {
			Class.forName(DRIVER_NAME);
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
	}
	
	// 부서를 삭제하기 위한 메소드 정의
	public int deleteDept(int dno) {
		int re=-1;
		String sql = "delete dept where dno=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(URL,USER,PWD);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,dno);
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return re;
	}
	
	//부서를 수정하기 위한 메소드 정의
	public int updateDept(DeptVO d) {
		System.out.println("수정할 객체 : "+ d);
		int re = -1;
		String sql = "update dept set dname=?,dloc=? where dno=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PWD);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, d.getDname());
			pstmt.setString(2, d.getDloc());
			pstmt.setInt(3,d.getDno());
			re = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return re;
	}
	
	
	
	//새로운 부서를 추가하는 메소드를 정의
	public int insertDept(DeptVO d) {
		int re = -1;
		String sql = "insert into dept(dno,dname,dloc) values(?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PWD);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, d.getDno());
			pstmt.setString(2, d.getDname());
			pstmt.setString(3, d.getDloc());
			re = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return re;
	}
	
	
	
	//부서번호를 매개변수로 전달받아 해당부서의 정보를 검색하여 반환하는 메소드를 정의
	public DeptVO findByNo( int dno   ){
		 DeptVO d = null;
		 String sql = "select * from dept where dno=?";
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 try {
			 conn = DriverManager.getConnection(URL, USER, PWD);
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, dno);
			 rs  = pstmt.executeQuery();
			 if(rs.next()) {
				d = new DeptVO();
				d.setDno(rs.getInt("dno"));
				d.setDname(rs.getString("dname"));
				d.setDloc(rs.getString("dloc"));
			 }			 
			 
		 }catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		 }finally {
			 if(rs != null) {
				 try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 
			 if(pstmt != null) {
				 try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
			 
			 if(conn != null) {
				 try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			 }
		 }
		 
		 return d;
	}
	
	public ArrayList<DeptVO> findAll(){
		ArrayList<DeptVO> list = new ArrayList<DeptVO>();
		String sql  = "select * from dept";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PWD);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				DeptVO d = new DeptVO();
				d.setDno(rs.getInt("dno"));
				d.setDname(rs.getString("dname"));
				d.setDloc(rs.getString("dloc"));
				list.add(d);
			}	
			
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if(stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if( conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return list;
	}
}




















