package pharma;

public class Category {
	public int id;
	public String name;
	
	public Category(int id, String name) {
		this.id = id;
		this.name = name;
	}
	
	public String toString() {
		return "Category_id=" + id + " Name=" + name;
	}
}
