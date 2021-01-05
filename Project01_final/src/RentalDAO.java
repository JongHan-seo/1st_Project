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
				System.out.println("���� ����!");
			else
				System.out.println("���� ����..");
		}
		// ��� ������ ���Ͽ� catch
		catch (Exception e) {
			System.out.println("getConn ����!");
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
			System.out.println("close ����");
		}
	}

	// ��Ż = rental���̺��� + book���̺� �뿩ǥ��Y
	public void insert() {
	      getConn();
	      try {
	         System.out.print("ȸ����ȣ : ");
	         int memno = sc.nextInt();
	         System.out.print("å��ȣ : ");
	         int bookno = sc.nextInt();

	         if (able(bookno).equals("Y"))
	            System.out.println("�̹� �뿩�� å ��ȣ�Դϴ�.");
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
	               System.out.println("��Ż ��� ����");
	            else
	               System.out.println("��Ż ��� ����");
	         }

	      } catch (Exception e) {
	         System.out.println("�뿩��Ȳ ���� ����");
	      } finally {
	         close();
	      }

	   }
	// �ݳ� = rental���̺� �ݳ�ǥ��Y + book���̺� �뿩ǥ��N
	public void update() {
		getConn();
		try {
			System.out.print("�ݳ��� å ��ȣ : ");
			int bookno = sc.nextInt();
			
			if (able(bookno).equals("N"))
				System.out.println("�߸� �Է��ϼ̽��ϴ�.");
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
					System.out.println("�ݳ� ����");
				else
					System.out.println("�ݳ� ����");
			}

		} catch (Exception e) {
			System.out.println("�ݳ� ����");
		} finally {
			close();
		}
	}

	// ��Ż ���ɿ��� �ľ�? -> select���� �̿��Ͽ� book���̺��� �뿩��������
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

	         System.out.println("�뿩��ȣ\tå��ȣ\tȸ����ȣ\t\t�뿩��\t\t\t�ݳ���\t\t�ݳ���Ȳ");
	         while (rs.next()) {
	            System.out.print(rs.getInt(1) + "\t");
	            System.out.print(rs.getInt(2) + "\t");
	            System.out.print(rs.getInt(3) + "\t");
	            System.out.print(rs.getString(4) + "\t");
	            System.out.print(rs.getString(5) + "\t");
	            System.out.print(rs.getString(6) + "\n");
	         }

	      } catch (Exception e) {
	         System.out.println("��� ����");
	      } finally {
	         close();
	      }

	   }

}
