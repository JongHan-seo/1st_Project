import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Formatter;
import java.util.Scanner;

public class BookDAO {

	// conn, close, insert, update, delete
	Scanner sc = new Scanner(System.in);
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	RentalDAO b_dao = new RentalDAO();

	public void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@DESKTOP-4QM3OI3:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";

			conn = DriverManager.getConnection(url, db_id, db_pw);

			if (conn != null)
				System.out.println("접속 성공!");
			else
				System.out.println("접속 실패..");
		}
		// 모든 에러에 대하여 catch
		catch (Exception e) {
			System.out.println("getConn 오류!");
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			System.out.println("close 오류");
		}
	}

	// 책정보 입력
	public void bookInsert() {
		getConn();
		try {
			System.out.print("책 제목  : ");
			String title = sc.next();
			System.out.print("저     자 : ");
			String author = sc.next();
			System.out.print("출 판사  : ");
			String made = sc.next();
			System.out.print("위   치 :  ");
			String loc = sc.next();
			System.out.print("대여가능여부 : ");
			String rn_ry = sc.next();

			String sql = "insert into book values(book_bookno_seq.nextval,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, title);
			psmt.setString(2, author);
			psmt.setString(3, made);
			psmt.setString(4, loc);
			psmt.setString(5, rn_ry);

			int cnt = 0;
			cnt = psmt.executeUpdate();
			if (cnt > 0) {
				System.out.println("책이 등록되었습니다.");
			} else {
				System.out.println("책 등록에 실패했습니다.");
			}

		} catch (Exception e) {
			System.out.println("드라이버오류");
			e.printStackTrace();
		} finally {
			close();
		}
	}

	// 책정보 수정
	public void bookUpdate() {
		getConn();
		try {
			int cnt = 0;
			System.out.print("변경할 책의 번호를 입력하세요 : ");
			int updatenum = sc.nextInt();
			System.out.print("책의 이름 : ");
			String updateTitle = sc.next();
			System.out.print("책의 저자 : ");
			String updateAuthor = sc.next();
			System.out.print("출판사 : ");
			String updateMade = sc.next();
			System.out.print("책의 위치 : ");
			String updateLoc = sc.next();

			String sql = "update book set title = ?, author = ?, made = ?, location = ? where book_no = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, updateTitle);
			psmt.setString(2, updateAuthor);
			psmt.setString(3, updateMade);
			psmt.setString(4, updateLoc);
			psmt.setInt(5, updatenum);
			cnt = psmt.executeUpdate();

			if (cnt != 0)
				System.out.println("변경 성공");
			else
				System.out.println("변경 실패");

		} catch (Exception e) {
			System.out.println("update 오류");
		} finally {
			close();
		}
	}

	// 책 제거
	public void bookDelete() {
		getConn();
		try {
			System.out.print("삭제할 책의 번호를 입력하세요 : ");
			int deletebook = sc.nextInt();
			int cnt = 0;
			String sql = "delete from book where book_no = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, deletebook);
			cnt = psmt.executeUpdate();

			if (cnt != 0)
				System.out.println("삭제 성공");
			else
				System.out.println("삭제 실패");

		} catch (Exception e) {
			System.out.println("delete 오류");
		}finally {
			close();
		}
		
	}
	//책전체조회
	public void show() {
	      getConn();
	      try {
	         String sql = "select * from book";
	         psmt = conn.prepareStatement(sql);
	         rs = psmt.executeQuery();

	         System.out.println("책번호\t\t책제목\t\t작가\t\t출판사\t\t진열위치\t\t렌탈가능여부");
	         while (rs.next()) {
	            System.out.print(rs.getInt(1) + "\t");
	            System.out.print(rs.getString(2) + "\t");
	               System.out.print(rs.getString(3) + "\t");
	               if(rs.getString(3).length() < 6)
	                  System.out.print("\t");
	               System.out.print(rs.getString(4) + "\t");
	               if(rs.getString(4).length() < 6)
	                  System.out.print("\t");
	               System.out.print(rs.getString(5) + "\t");
	               if(rs.getString(5).length() <= 7)
	                  System.out.print("\t");
	               System.out.print(rs.getString(6) + "\n");


	         }

	      } catch (Exception e) {
	         System.out.println("출력 오류");
	      } finally {
	         close();
	      }

	   }



	// 책 이름 검색 <--
	public void bookSearch() {
		getConn();
		try {

			// 책이 렌탈중일때
			System.out.print("검색할 책 이름 : ");
			String searchTitle = "%" + sc.next() + "%";
			System.out.println("책번호\t    title\t\t렌탈중\t회원번호\t회원이름");

			// LIKE '%검색어%' 활용 + 렌탈중인 책 + 대여중이 아닌 책
			String sql = "select distinct b.book_no, b.title, b.rental_yn, r.mem_no, m.mem_name from book b, rental r, member m"
					+ " where b.book_no = r.book_no and r.mem_no = m.mem_no"
					+ " and r.return_check = 'N' and b.title like ?" + " union "
					+ "select book_no, title, rental_yn, null, null from book where rental_yn = 'N' and title like ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, searchTitle);
			psmt.setString(2, searchTitle);
			rs = psmt.executeQuery();

			while (rs.next()) {
				if (rs.getString(3).equals("Y")) {
					String a =rs.getString(2);
					//Formatter fm = new Formatter();
					//String list = fm.format("%5s\t  %-20s\t %-5s\t %-10s\t %-10s", rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)).toString();
//					
//					System.out.println(list);
				//	System.out.print(rs.getInt(1) +"\t" + rs.getString(2)+"\t"+rs.getString(3)+"\t"+rs.getString(4)+"\t"+rs.getString(5)+"\t");
					//System.out.println();
					System.out.print(rs.getString(1) + "\t");
					System.out.print(rs.getString(2) + "\t");
					System.out.print(rs.getString(3) + "\t");
					System.out.print(rs.getString(4) + "\t");
					System.out.print(rs.getString(5) + "\n");
				} else {
					//Formatter fm = new Formatter();
//					System.out.print(rs.getInt(1) +"\t" + rs.getString(2)+"\t");
					//String list = fm.format("%10s\t", rs.getString(3)).toString();
					
					//System.out.println(list);
//					String list = fm.format("%6.6s\t %-15.3s\t %-10.3s\t", rs.getInt(1),rs.getString(2),rs.getString(3)).toString();
//					System.ouystem.out.println(list);
//					System.out.printf("%6s\t",rs.getInt(1));
//					System.out.printf("%-10.30s\t",rs.getString(2) );
//					System.out.printf("%10s\t",rs.getString(3));//					
//					System.out.print(rs.getString(1) + "\t");
//					System.out.print(rs.getString(2) + "\t");
//					System.out.print(rs.getString(3) + "\n");
//					System.out.println();
					 System.out.print(rs.getInt(1) + "\t");
			            System.out.print(rs.getString(2) + "\t");
			               System.out.print(rs.getString(3) + "\t");
			           System.out.println();
				}
			}

		} catch (Exception e) {
			System.out.println("검색 오류");
		} finally {
			close();
		}

	}
}
