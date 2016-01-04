package test;

import java.util.HashMap;
import java.util.Map;

public aspect Instrumentation {

	Monitor m = new Monitor();

	public Map<StringBuilder,State> indexes = new HashMap<StringBuilder, State>();
	public Map<String, StringBuilder> strings = new HashMap<String, StringBuilder>();

	pointcut eventByValue(String value): call (void test.Program.eventByValue(String)) && args(value);

	before(String value) : eventByValue (value) {
		System.out.println ("Event with parameter "+value+ " with passing by value.");
		if (strings.containsKey(value)) {
			monitorTransition(strings.get(value));
		}
		else {
			StringBuilder sb = new StringBuilder();
			sb.append(value);
			strings.put(value, sb);
			monitorTransition(sb);
		}
	}

	pointcut eventByRef(String value): call (void test.Program.eventByRef(String)) && args(value);

	before(String value) : eventByRef (value) {
		System.out.println ("Event with parameter "+value+ " with passing by reference.");
		monitorTransition((new StringBuilder().append(value)));
	}

	public void monitorTransition (StringBuilder index) {
		if (indexes.containsKey(index)) {
			State s = (State) indexes.get(index);
			indexes.put (index, m.transition(s, Event.EVENT1));
		}
		else {
			indexes.put (index, State.ONE);
		}
	}

	after() : execution (void Main.main(*)) {
		System.out.println(indexes);
	}

}
