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
			System.out.println("�޴� �����ϱ� [1]����  [2]�뿩  [3]ȸ�� ");
			int m_menu = sc.nextInt();
			
			switch(m_menu){
				case 1 :
					while(ok) {
					System.out.println("========================== ���� ==========================");
					System.out.print("[1]�����˻� [2]������� [3]�������� [4] �������� [5]������ü��ȸ [6]Ȩ���� ���ư���");
					System.out.println("�޴����� : ");
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
						System.out.println("�� �� �����ϼ̽��ϴ�.");
					}
					}
				case 3 : 
					while(ok) {
						System.out.println("========================== ȸ�� ==========================");
						System.out.print("[1]ȸ���˻� [2]ȸ����� [3]ȸ������ [4]ȸ����ü��ȸ [5]Ȩ���� ���ư���");
						System.out.println("�޴����� : ");
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
								System.out.println("�� �� �����ϼ̽��ϴ�.");
						}}
				case 2 : 
					while(ok) {
						System.out.println("========================== �뿩 ==========================");
						System.out.print("[1]�뿩�ϱ� [2]�뿩��� [3]�ݳ��ϱ� [4]Ȩ���� ���ư���");
						System.out.println("�޴����� : ");
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
							System.out.println("�� �� �����ϼ̽��ϴ�.");
							
						}}
						

						
					}
					
			}
		}
	}


