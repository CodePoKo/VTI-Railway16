package Testing3;

public class Position {
	int id;
	
	PositionName name;
	public enum PositionName {
		Dev, Test, Scrum_Master, PM;
	}
	@Override
	public String toString() {
		return "Position [id=" + id + ", name=" + name + "]";
	}
}