package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import domain.MyMember1;
import domain.Rental;


public class RentalDao {
	
	private static RentalDao instance = new RentalDao();
	
	private RentalDao() {
	}

	public static RentalDao getInstance() {
		return instance;
	}
	
	// DB연결 메소드
		private Connection getConnection() throws Exception {
			Context initContext = new InitialContext();
			DataSource ds = (DataSource) initContext.lookup("java:/comp/env/jdbc/oracle");
			return ds.getConnection();
		} // getConnection 끝
		
public void insertRental(Rental bean) {
	Connection con = null;
	PreparedStatement pstmt = null; // select 용
	PreparedStatement pstmt2 = null; // insert 용
	ResultSet rs = null;
	String sql = "";
	
	try {
		// 드라이버 로딩. DB연결
		con = getConnection();
		sql = "SELECT MAX(num) FROM rental";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		// 실행
		if (rs.next()) {
		// 글이 있는 경우 최대값+1
		int num = rs.getInt(1) + 1;
		bean.setNum(num);
		} else {
		bean.setNum(1); // 글이 없는 경우 글번호 1
		}
		
		sql = "INSERT INTO rental (num,bookname,username,brstart,brend) VALUES (?,?,?,?,?)";
		pstmt2 = con.prepareStatement(sql);
		pstmt2.setInt(1, bean.getNum());
		pstmt2.setString(2, bean.getBookname());
		pstmt2.setString(3, bean.getUsername());
		pstmt2.setString(4, bean.getBrstart());
		pstmt2.setString(5, bean.getBrend());
		
		// 실행
		pstmt2.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
			}
		}
		if (pstmt2 != null) {
			try {
				pstmt2.close();
			} catch (SQLException e) {
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
	}
} // insertRental() 끝

public Rental getrent(String bookname) {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Rental bean = null;
	String sql = "";
	
	try {
		con = getConnection();
		
		sql = "select * from rental where bookname=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bookname);
		// 실행
		rs = pstmt.executeQuery();
		// rs => 변수저장
		if (rs.next()) {
			bean = new Rental();
			bean.setNum(rs.getInt("Num"));
			bean.setBookname(rs.getString("bookname"));
			bean.setUsername(rs.getString("username"));
			bean.setBrstart(rs.getString("brstart"));
			bean.setBrend(rs.getString("brend"));
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {}
		}
	}
	return bean;
} // getMember()의 끝

	
// 전체 글개수 가져오기 메소드
		public int getrentCount() {
			Connection con = null;
			PreparedStatement pstmt = null;  // select용
			ResultSet rs = null;
			String sql = "";
			int count = 0;
			
			try {
				con = getConnection();
				// sql  전체글개수 가져오기  select count(*)
				sql = "select count(*) from rental";
				pstmt = con.prepareStatement(sql);
				// 실행
				rs = pstmt.executeQuery();
				// rs 데이터 있으면 count 저장
				if (rs.next()) {
					count = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException e) {}
				}
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {}
				}
			}
			return count;
		} // getMemberCount() 끝
		
		public List<Rental> getRentals() {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			List<Rental> list = new ArrayList<>();
			
			try {
				con = getConnection();
				
				sql = "select * from rental order by num DESC";
				pstmt = con.prepareStatement(sql);
				// 실행
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					Rental bean = new Rental();
					bean.setNum(rs.getInt("Num"));
					bean.setBookname(rs.getString("bookname"));
					bean.setUsername(rs.getString("username"));
					bean.setBrstart(rs.getString("brstart"));
					bean.setBrend(rs.getString("brend"));
										
					list.add(bean); // 리스트에 추가
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException e) {}
				}
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {}
				}
			}
			
			return list;
		} // getRent()의 끝	
		
		
		// 대여삭제 메소드 
		
		public void deleterent(int num) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			
			try {
				con = getConnection();				
				sql = "delete from rental where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				// 실행
				rs = pstmt.executeQuery();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {				
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException e) {}
				}
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {}
				}
				 
	
		} // deleteRental()의 끝
		
}
