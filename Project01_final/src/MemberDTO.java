import java.util.Formatter;

public class MemberDTO {

	private int id;
	private String name;
	private String date;
	private String phone;
	private String addr;
	private int num;
	
	public MemberDTO() {
		
	}

	public MemberDTO(int id,String name, String date, String phone, String addr) {
		super();
		this.id=id;
		this.name = name;
		this.date = date;
		this.phone = phone;
		this.addr = addr;

	}
	public MemberDTO(String name) {
		this.name =name;
		
	}
	public MemberDTO(String name, String addr) {
		this.name =name;
		this.addr = addr;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	@Override
	public String toString() {
		//출력 형태를 지정
		Formatter fm = new Formatter();
		String meminfo = fm.format("%5s\t  %-9s\t %-10s\t %-14s\t %-20s", id, name,date, phone,addr).toString();
		return meminfo;
	}
}
