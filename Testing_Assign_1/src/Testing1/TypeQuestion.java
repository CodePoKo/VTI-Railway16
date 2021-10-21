package Testing1;

public class TypeQuestion {
	int id;
	TypeName name;
	public enum TypeName {
		Essay, Multiple_Choice;
	}
	@Override
	public String toString() {
		return "TypeQuestion [id=" + id + ", name=" + name + "]";
	}
}
