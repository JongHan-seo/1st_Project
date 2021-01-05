import java.awt.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Scanner;

public class MemberDAO {

	Scanner sc = new Scanner(System.in);
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	MemberDTO m_dto = new MemberDTO();

	public void getConn() {

		// 동적할당
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@DESKTOP-4QM3OI3:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";

			conn = DriverManager.getConnection(url, db_id, db_pw);

			if (conn != null) {
				System.out.println("접속성공");
			} else {
				System.out.println("접속실패");
			}
		} catch (Exception e) {
			System.out.println("getConn 오류");
		}
	}

	// 닫기
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 회원 등록
	public void insert() {
		getConn();

		try {

			System.out.println("회원이름");
			String mem_name = sc.next();
			System.out.println("생년월일ex)901231");
			String date = sc.next();
			System.out.println("핸드폰ex)01012345678");
			String mem_phone = sc.next();
			System.out.println("주소");
			String mem_addr = sc.next();

			String sql = "insert into member values(member_memno_seq.nextVal,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_name);
			psmt.setString(2, date);
			psmt.setString(3, mem_phone);
			psmt.setString(4, mem_addr);

			int cnt = 0;
			cnt = psmt.executeUpdate();
			if (cnt > 0) {
				System.out.println("회원등록되었습니다.");
			} else {
				System.out.println("회원등록에 실패했습니다.");
			}

		} catch (Exception e) {
			System.out.println("드라이버오류");
			e.printStackTrace();

		} finally {
			close();

		}
	}

	public java.util.List<MemberDTO> getMemberList() {
		java.util.List<MemberDTO> list = new ArrayList<MemberDTO>();
		getConn();
		try {

			String sql = "SELECT mem_no, mem_name, mem_date, mem_phone, mem_addr FROM member  ORDER BY mem_no asc";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int m_no = rs.getInt("mem_no");
				String m_name = rs.getString("mem_name");
				String m_date = rs.getString("mem_date");
				String m_phone = rs.getString("mem_phone");
				
				String m_addr = rs.getString("mem_addr");
				list.add(new MemberDTO(m_no, m_name, m_date, m_phone, m_addr));

			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("예외발생:getMemberList()=> " + e.getMessage());
		} finally {
			close();
		}

		return list;
	}

	public void memList() {
		java.util.List<MemberDTO> list = this.getMemberList();

		System.out.println("                             Member List");
		System.out.println("=======================================================================");
		if (list != null && list.size() > 0) {
			System.out.println("회원번호\t  이름 \t  생년월일\t\t      전화번호\t주소");
			System.out.println("=======================================================================");

			for (MemberDTO dto : list) {
				System.out.println(dto);
			}

		} else {
			System.out.println("저장된 데이터가 없습니다. ");
		}
		System.out.println("===================================================================총 "
				+ ((list == null) ? "0" : list.size()) + " 명=\n");
	}

	// 회원 이름으로 검색
	public void memberSearch() {
		getConn();
		try {

			System.out.print("검색할 회원 이름 : ");
			String searchMember = "%" + sc.next() + "%";
			System.out.println("회원번호\t회원이름\t생년월일\t연락처\t\t주소\t책번호\t책이름");

			String sql = "select distinct m.*, b.book_no, b.title from book b, rental r, member m"
					+ " where b.book_no = r.book_no and r.mem_no = m.mem_no"
					+ " and r.return_check = 'N' and m.mem_name like ?" + " union "
					+ "select distinct mem_no, mem_name, mem_date, mem_phone, mem_addr, null, null from member where mem_name like ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, searchMember);
			psmt.setString(2, searchMember);
			rs = psmt.executeQuery();

			int a = 0;
			while (rs.next()) {
				if (rs.getInt(6) != 0) {
					System.out.print(rs.getInt(1) + "\t");
					System.out.print(rs.getString(2) + "\t");
					System.out.print(rs.getString(3) + "\t");
					System.out.print(rs.getString(4).substring(0,3) + "-" + rs.getString(4).substring(3,7) + "-" + rs.getString(4).substring(7,11) +"\t");

					//System.out.print(rs.getString(4) + "\t");
					System.out.print(rs.getString(5) + "\t");
					System.out.print(rs.getInt(6) + "\t");
					System.out.print(rs.getString(7) + "\n");
					a = rs.getInt(1);
				} else if (rs.getInt(6) == 0 && a == rs.getInt(1)) {
					a = 0;
				} else {
					System.out.print(rs.getInt(1) + "\t");
					System.out.print(rs.getString(2) + "\t");
					System.out.print(rs.getString(3) + "\t");
					System.out.print(rs.getString(4).substring(0,3) + "-" + rs.getString(4).substring(3,7) + "-" + rs.getString(4).substring(7,11) +"\t");

					//System.out.print(rs.getString(4) + "\t");
					System.out.print(rs.getString(5) + "\n");
				}

			}

		} catch (Exception e) {
			System.out.println("검색 오류");
		} finally {
			close();
		}

	}

	public void update() {
		getConn();
		try {
			System.out.println("이름과 생년월일이 일치하면 회원정보를 수정할 수있습니다.");
			System.out.print("이름 : ");
			String name = sc.next();
			System.out.println("생년월일 ex)901231 : ");
			String date = sc.next();
			String sql = "select mem_no, mem_name, mem_date, mem_phone, mem_addr from member where mem_name = ? and mem_date = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, date);

			rs = psmt.executeQuery();

			rs.next();
			boolean ok = true;
			while (ok) {

				if ((name.equals(rs.getString(2))) && (date.equals(rs.getString(3)))) {

					System.out.println("========현재정보========");
					System.out.println("회원번호 : " + rs.getString(1));
					System.out.println("이      름 : " + rs.getString(2));
					System.out.println("생년월일 : " + rs.getString(3));
					System.out.println("전화번호 : " + (rs.getString(4).substring(0,3) + "-" + rs.getString(4).substring(3,7) + "-" + rs.getString(4).substring(7,11)));

					System.out.println("주      소 : " + rs.getString(5));
					String a = rs.getString(2);
					System.out.println();
					System.out.println("수정하시겠습니까? (y)입력 : ");
					String yn = sc.next();
					if (yn.equals("y")) {

						System.out.println("수정할 정보를 입력해 주세요.");
						System.out.println(a + "님의 회원정보 수정입니다.");
						System.out.print("새로운 핸드폰 번호 입력 : ");
						String nphone = sc.next();
						System.out.println("새로운 주소 입력 :");
						String naddr = sc.next();

						String sql2 = "update member set mem_phone = ?, mem_addr=? where mem_name =?";
						psmt = conn.prepareStatement(sql2);
						psmt.setString(1, nphone);
						psmt.setString(2, naddr);
						psmt.setString(3, a);
						int cnt =0;
						cnt = psmt.executeUpdate();
						
						if (cnt>0) {
							System.out.println("회원정보가 수정되었습니다.");
							ok = false;
						} else
							System.out.println("회원정보 수정에 실패했습니다.");
					
					} else {
						ok = false;
						System.out.println("다른 메뉴를 선택해 주세요.");
					}
				} else if (!rs.next()) {
					System.out.println("일치하는 정보가 없습니다.");

				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

	}

}
