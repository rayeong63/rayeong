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

import org.json.JSONArray;

import domain.MyMember1;


public class MyMember1Dao {
	
	private static MyMember1Dao instance = new MyMember1Dao();
	
	private MyMember1Dao() {
		}
	
	public static MyMember1Dao getInstance() {
		return instance;
	}
	
	// DB연결 메소드
	private Connection getConnection() throws Exception {
		Connection con = null;
		
		// DB 연결에 필요한 정보
//		String url = "jdbc:oracle:thin:@127.0.0.1:1521:testDB";
//		String user = "scott";
//		String password = "1234";
		// 드라이버 로딩
//		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 연결
//		con = DriverManager.getConnection(url, user, password);
		
		
		Context initContext = new InitialContext();
		DataSource ds = (DataSource) initContext.lookup("java:/comp/env/jdbc/oracle");
		con = ds.getConnection();
		return con;
	} // getConnection() 끝	
	
	public JSONArray getGenderCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		JSONArray jsonArray = new JSONArray();
		JSONArray recordArr = null;
		
		recordArr = new JSONArray();
		recordArr.put("성별");
		recordArr.put("인원수");
		jsonArray.put(recordArr);
		
		try {
			con = getConnection();
			sql = "select gender, count(gender) cnt from mymember1 group by gender order by gender";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				recordArr = new JSONArray();
				recordArr.put(rs.getString("gender"));
				recordArr.put(rs.getInt("cnt"));
				
				jsonArray.put(recordArr);
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
		return jsonArray;
	}

	public void insertMember(MyMember1 bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			// 드라이버 로딩. DB연결
			con = getConnection();
			sql = "INSERT INTO mymember1 (id,name,passwd,reg_date,gender,email,tel) VALUES (?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
		
			pstmt.setString(1, bean.getId());			
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPasswd());
			pstmt.setTimestamp(4, bean.getReg_date());
			pstmt.setString(5, bean.getGender());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getTel());
					
			// 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
	} // insertMember() 끝
	
	
	// 로그인 사용자 체크 메소드
	public int userCheck(String id, String passwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int check = -1;
		// 아이디 불일치: -1
		// 아이디 일치, 패스워드 불일치: 0
		// 아이디 패스워드 모두 일치: 1
		
		sql = "select passwd from mymember1 where id=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 실행
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				// 아이디 있음
				if (passwd.equals(rs.getString("passwd"))) {
					check = 1;
				} else {
					check = 0;
				}
			} else {
				check = -1;
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
		return check;
	} // userCheck()의 끝
	
	
	public MyMember1 getMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MyMember1 bean = null;
		String sql = "";
		
		try {
			con = getConnection();
			
			sql = "select * from mymember1 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 실행
			rs = pstmt.executeQuery();
			// rs => 변수저장
			if (rs.next()) {
				bean = new MyMember1();
				bean.setId(rs.getString("id"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setName(rs.getString("name"));				
				bean.setTel(rs.getString("tel"));
				bean.setGender(rs.getString("gender"));
				bean.setEmail(rs.getString("email"));
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
			public int getMemberCount() {
				Connection con = null;
				PreparedStatement pstmt = null;  // select용
				ResultSet rs = null;
				String sql = "";
				int count = 0;
				
				try {
					con = getConnection();
					// sql  전체글개수 가져오기  select count(*)
					sql = "select count(*) from mymember1";
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
	
	public int updateMember(MyMember1 bean) {
		Connection con = null;
		PreparedStatement pstmt = null;  // select용
		PreparedStatement pstmt2 = null; // update용
		ResultSet rs = null;
		String sql = "";
		int check = 0;
		
		try {
			con = getConnection();
			
			sql = "select passwd from mymember1 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			// 실행
			rs = pstmt.executeQuery();
			// rs 데이터 있으면 아이디 있음
			//              패스워드비교 맞으면 update  main.jsp이동
			//                        틀리면 "패스워드틀림" 뒤로이동
			if (rs.next()) {
				// 아이디 있음
				if (bean.getPasswd().equals(rs.getString("passwd"))) {
					// update   main.jsp이동
					sql = "update mymember1 set name=?, passwd=?, gender=?, email=?, tel=? where id=?";
					pstmt2 = con.prepareStatement(sql);
					pstmt2.setString(1, bean.getName());
					pstmt2.setString(2, bean.getPasswd());
					pstmt2.setString(3, bean.getGender());
					pstmt2.setString(4, bean.getEmail());
					pstmt2.setString(5, bean.getTel());
					pstmt2.setString(6, bean.getId());
					// 실행
					pstmt2.executeUpdate();
					
					check = 1; // 패스워드 일치해서 수정성공
				} else {
					check = 0; // 패스워드 불일치
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {}
			}
			if (pstmt2 != null) {
				try {
					pstmt2.close();
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
		return check;
	} // updateMember()의 끝
	
	
	public int deleteMember(String id, String passwd) {
		Connection con = null;
		PreparedStatement pstmt = null;  // select용
		PreparedStatement pstmt2 = null; // delete용
		ResultSet rs = null;
		String sql = "";
		int check = 0;
		
		try {
			con = this.getConnection();
			
			sql = "select passwd from mymember1 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 실행
			rs = pstmt.executeQuery();
			// rs 데이터 있으면 아이디 있음
			//              패스워드비교 맞으면 update  main.jsp이동
			//                        틀리면 "패스워드틀림" 뒤로이동
			if (rs.next()) {
				// 아이디 있음
				if (passwd.equals(rs.getString("passwd"))) {
					// delete
					sql = "delete from mymember1 where id=?";
					pstmt2 = con.prepareStatement(sql);
					pstmt2.setString(1, id);
					// 실행
					pstmt2.executeUpdate();
					
					check = 1; // 패스워드 일치. 삭제성공.
				} else {
					check = 0; // 패스워드 불일치
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {}
			}
			if (pstmt2 != null) {
				try {
					pstmt2.close();
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
		return check;
	} // deleteMember()의 끝
	
	public void deleteMembers(String[] delIds) {
		// 매개변수로 삭제할 id 배열을 전달받는다.
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			String sql = "DELETE FROM mymember1 WHERE id=?";
			pstmt = con.prepareStatement(sql);
			
			final int BATCH_SIZE = 1000;
			int count = 0;
			
			for (String id : delIds) {
				pstmt.setString(1, id);
				pstmt.addBatch();
				
				count++;
				if (count % BATCH_SIZE == 0) {
					// 배치사이즈로 설정한 1000건씩 delete 한다.
					pstmt.executeBatch();
				}
			}
			pstmt.executeBatch(); // 남은 레코드를 delete 한다.
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
	} // deleteMembers(String[] delIds)
	
	
	public List<MyMember1> getMembers() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		List<MyMember1> list = new ArrayList<>();
		
		try {
			con = getConnection();
			
			sql = "select * from mymember1";
			pstmt = con.prepareStatement(sql);
			// 실행
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MyMember1 bean = new MyMember1();
				bean.setId(rs.getString("id"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setName(rs.getString("name"));
				bean.setReg_date(rs.getTimestamp("reg_date"));
				bean.setAge(rs.getInt("age"));
				bean.setGender(rs.getString("gender"));
				bean.setEmail(rs.getString("email"));
				bean.setTel(rs.getString("tel"));
				
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
	} // getMembers()의 끝

	// 아이디 중복체크
	public int idCheck(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int rowCount = 0;
		
		try {
			con = getConnection();
			// select id에 해당하는 데이터 가져오기
			sql = "select count(*) from mymember1 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 실행
			rs = pstmt.executeQuery();
			if(rs.next()){
				rowCount = rs.getInt(1);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
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
		return rowCount;
	} // idCheck()의 끝
	
} // MyMemberDao 클래스 끝







