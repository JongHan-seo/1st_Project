import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class RentalDAO {

	Scanner sc = new Scanner(System.in);
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

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

	// 렌탈 = rental테이블등록 + book테이블 대여표시Y
	public void insert() {
	      getConn();
	      try {
	         System.out.print("회원번호 : ");
	         int memno = sc.nextInt();
	         System.out.print("책번호 : ");
	         int bookno = sc.nextInt();

	         if (able(bookno).equals("Y"))
	            System.out.println("이미 대여된 책 번호입니다.");
	         else {

	            String sql1 = "insert into rental(rental_no, book_no, mem_no) values(rental_rentalno_seq.NEXTVAL, ?, ?)";
	            psmt = conn.prepareStatement(sql1);
	            psmt.setInt(1, bookno);
	            psmt.setInt(2, memno);
	            int cnt1 = 0;
	            cnt1 = psmt.executeUpdate();

	            String sql2 = "update book set rental_yn = 'Y' where book_no = ?";
	            psmt = conn.prepareStatement(sql2);
	            psmt.setInt(1, bookno);
	            int cnt2 = 0;
	            cnt2 = psmt.executeUpdate();

	            if (cnt1 != 0 && cnt2 != 0)
	               System.out.println("렌탈 등록 성공");
	            else
	               System.out.println("렌탈 등록 실패");
	         }

	      } catch (Exception e) {
	         System.out.println("대여상황 변경 오류");
	      } finally {
	         close();
	      }

	   }
	// 반납 = rental테이블 반납표시Y + book테이블 대여표시N
	public void update() {
		getConn();
		try {
			System.out.print("반납할 책 번호 : ");
			int bookno = sc.nextInt();
			
			if (able(bookno).equals("N"))
				System.out.println("잘못 입력하셨습니다.");
			else {
				String sql1 = "update rental set return_check = 'Y' where book_no = ?";
				psmt = conn.prepareStatement(sql1);
				psmt.setInt(1, bookno);
				int cnt1 = 0;
				cnt1 = psmt.executeUpdate();

				String sql2 = "update book set rental_yn = 'N' where book_no = ?";
				psmt = conn.prepareStatement(sql2);
				psmt.setInt(1, bookno);
				int cnt2 = 0;
				cnt2 = psmt.executeUpdate();

				if (cnt1 != 0 && cnt2 != 0)
					System.out.println("반납 성공");
				else
					System.out.println("반납 실패");
			}

		} catch (Exception e) {
			System.out.println("반납 오류");
		} finally {
			close();
		}
	}

	// 렌탈 가능여부 파악? -> select절을 이용하여 book테이블에서 대여가능한지
	public String able(int bookno) {
		String result = null;
		try {
			String sql3 = "select rental_yn from book where book_no = ?";
			psmt = conn.prepareStatement(sql3);
			psmt.setInt(1, bookno);
			rs = psmt.executeQuery();
			rs.next();
			result = rs.getString(1);
		} catch (Exception e) {
		}
		return result;
	}
	public void show() {
	      getConn();
	      try {
	         String sql = "select * from rental";
	         psmt = conn.prepareStatement(sql);
	         rs = psmt.executeQuery();

	         System.out.println("대여번호\t책번호\t회원번호\t\t대여일\t\t\t반납일\t\t반납현황");
	         while (rs.next()) {
	            System.out.print(rs.getInt(1) + "\t");
	            System.out.print(rs.getInt(2) + "\t");
	            System.out.print(rs.getInt(3) + "\t");
	            System.out.print(rs.getString(4) + "\t");
	            System.out.print(rs.getString(5) + "\t");
	            System.out.print(rs.getString(6) + "\n");
	         }

	      } catch (Exception e) {
	         System.out.println("출력 오류");
	      } finally {
	         close();
	      }

	   }

}
