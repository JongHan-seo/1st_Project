import java.util.Formatter;

public class BookDTO {
	private int book_id;
	private String title;
	private String author;
	private String made;
	private String location;
	
	// 디폴트생성자
	public BookDTO() {
		
	}
	
	// 책제목 담을 생성자
	public BookDTO(String title) {
		this.title = title;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getMade() {
		return made;
	}

	public void setMade(String made) {
		this.made = made;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		Formatter fm = new Formatter();
		String book_info = fm.format("%5s\t  %-9s\t %-10s\t %-14s\t %-20s",book_id,title,author,made,location).toString();
		return book_info;
				
	}
	
	
	

}
