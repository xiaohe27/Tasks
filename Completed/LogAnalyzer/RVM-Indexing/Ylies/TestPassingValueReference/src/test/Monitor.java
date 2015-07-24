package test;

public class Monitor {

	public State transition (State s, Event e) {
		if (s.equals(State.ONE)) {
			return State.TWO;
		}
		if (s.equals(State.TWO)) {
			return State.THREE;
		}
		if (s.equals(State.THREE)) {
			return State.FOUR;
		}
		else return State.ONE;
	}



}
