package Testing2;

public class Answer {
	int id;
	String content;
	Question question;
	Boolean isCorrect;
	@Override
	public String toString() {
		return "Answer [id=" + id + ", content=" + content + ", question=" + question + ", isCorrect=" + isCorrect
				+ "]";
	}
}
