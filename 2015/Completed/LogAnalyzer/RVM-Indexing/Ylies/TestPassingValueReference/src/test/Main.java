package test;

public class Main {

	public static void main(String[] args) {

		Program p = new Program();
		
		p.eventByValue("string 1 (value)");
		p.eventByValue("string 1 (value)");
		
		p.eventByRef("string 1 (ref)");
		p.eventByRef("string 1 (ref)");
	}

}
