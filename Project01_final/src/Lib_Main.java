import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class Lib_Main {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		MemberDAO m_dao = new MemberDAO();
		MemberDTO m_dto = new MemberDTO();
		BookDAO b_dao = new BookDAO();
		BookDTO b_dto = new BookDTO();
		RentalDAO r_dao = new RentalDAO();
		boolean ok = true;
		boolean isok = true;
		
		while(isok) {
			ok=true;
			System.out.println("메뉴 선택하기 [1]도서  [2]대여  [3]회원 ");
			int m_menu = sc.nextInt();
			
			switch(m_menu){
				case 1 :
					while(ok) {
					System.out.println("========================== 도서 ==========================");
					System.out.print("[1]도서검색 [2]도서등록 [3]도서수정 [4] 도서삭제 [5]도서전체조회 [6]홈으로 돌아가기");
					System.out.println("메뉴선택 : ");
					int b_menu = sc.nextInt();
					switch(b_menu) {
					case 1: 
						b_dao.bookSearch();
						break;
					case 2:
						b_dao.bookInsert();
						break;
					case 3:
						b_dao.bookUpdate();
						break;
					case 4:
						b_dao.bookDelete();	
						break;
					case 5:
						b_dao.show();
					case 6: 
						ok = false;
						
						break;
					default : 
						System.out.println("잘 못 선택하셨습니다.");
					}
					}
				case 3 : 
					while(ok) {
						System.out.println("========================== 회원 ==========================");
						System.out.print("[1]회원검색 [2]회원등록 [3]회원수정 [4]회원전체조회 [5]홈으로 돌아가기");
						System.out.println("메뉴선택 : ");
						int mem_menu = sc.nextInt();
						switch(mem_menu) {
						case 1 : 
							m_dao.memberSearch();
							break;
						case 2 :
							m_dao.insert();
							break;
						case 3:
							m_dao.update();
							
							break;
						case 4 :
							m_dao.memList();
							break;
						case 5:
							ok = false;
							break;
						default :
								System.out.println("잘 못 선택하셨습니다.");
						}}
				case 2 : 
					while(ok) {
						System.out.println("========================== 대여 ==========================");
						System.out.print("[1]대여하기 [2]대여목록 [3]반납하기 [4]홈으로 돌아가기");
						System.out.println("메뉴선택 : ");
						int r_menu = sc.nextInt();
						switch(r_menu) {
						case 1:
							r_dao.insert();
							break;
						case 2 :
							r_dao.show();
							break;
						case 3: 
							r_dao.update();
							break;
						case 4 :
							ok=false;
							break;
						

							
						default :
							System.out.println("잘 못 선택하셨습니다.");
							
						}}
						

						
					}
					
			}
		}
	}


