package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.sist.vo.BookVO;
import com.sist.vo.CustomerOrdersVO;

public class BookDAO {
	final String DRIVER= "oracle.jdbc.driver.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	final String USER = "c##madang";
	final String PWD = "madang";
	
	public BookDAO() {
		try {
			Class.forName(DRIVER);
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
	}
	
	// 고객명을 선택하면 그 고객이 주문한 도서명,가격,날짜를 출력 
	public ArrayList<CustomerOrdersVO> listOrders(String name){
		ArrayList<CustomerOrdersVO> list  = new ArrayList<CustomerOrdersVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select bookname, price, orderdate  "
					+ "from customer c, orders o, book b "
					+ "where c.custid = o.custid and "
					+ "b.bookid = o.bookid and name = ?";
			
			conn = DriverManager.getConnection(URL, USER, PWD);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CustomerOrdersVO c = new CustomerOrdersVO();
				c.setBookname(rs.getString("bookname"));
				c.setPrice(rs.getInt("price"));
				c.setOrderdate(rs.getDate("orderdate"));
				list.add(c);
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
		
		return list;
	}
	
	// 도서 삭제를 위한 메소드
	public int deleteBook(int bookid) {
		int re = -1;
		String sql = "delete book where bookid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(URL,USER,PWD);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bookid);
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("예외처리:"+e.getMessage());
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
	
	// 도서 수정을 위한 메소드
	public int updateBook(BookVO b) {
		int re = -1;
		String sql = "update book set bookname=?,publisher=?,price=? where bookid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(URL,USER,PWD);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBookname());
			pstmt.setString(2, b.getPublisher());
			pstmt.setInt(3, b.getPrice());
			pstmt.setInt(4, b.getBookid());
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("예외처리:"+e.getMessage());
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
	// 도서등록을 위한 메소드
	public int insertBook(BookVO b) {
		int re = -1;
		String sql = "insert into book(bookid,bookname,publisher,price) values(?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DriverManager.getConnection(URL,USER,PWD);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBookid());
			pstmt.setString(2, b.getBookname());
			pstmt.setString(3, b.getPublisher());
			pstmt.setInt(4, b.getPrice());
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("예외처리:"+e.getMessage());
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
	
	// 도서번호로 해당 도서의 상세정보를 찾는 메소드
	public BookVO findById(int bookid) {
		BookVO b  = null;
		String sql = "select * from book where bookid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PWD);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookid);
			rs =pstmt.executeQuery();
			if(rs.next()) {
				b = new BookVO();
				b.setBookid(rs.getInt("bookid"));
				b.setBookname(rs.getString("bookname"));
				b.setPublisher(rs.getString("publisher"));
				b.setPrice(rs.getInt("price"));
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
		return b;
	}
	
	// 도서목록을 보여주기 위한 메소드
	public ArrayList<BookVO> findAll(){
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		String sql = "select * from book";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PWD);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				BookVO b = new BookVO();
				b.setBookid(rs.getInt("bookid"));
				b.setBookname(rs.getString("bookname"));
				b.setPublisher(rs.getString("publisher"));
				b.setPrice(rs.getInt("price"));
				list.add(b);
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
			if(conn != null) {
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











