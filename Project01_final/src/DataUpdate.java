import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class DataUpdate {

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

   // �����ȣ, å��ȣ �Է½� �뿩 - ��Ż���̺� �ڷ� �ۼ� �뵵
   public void dataInsert(int a, int b) {
      getConn();
      try {
         int memno = a;
         int bookno = b;

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

   // å��ȣ �Է½� å �ݳ� - ��Ż���̺� �ڷ� �ۼ� �뵵
   public void dataUpdate(int c) {
      getConn();
      try {
         int bookno = c;

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
}