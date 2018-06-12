package domotique;
// Objet cobaye

//typedef enum State State;

public class ObjectTest{
	// Structures
	private enum State {OFF, ON};
	private enum Color {RED, BLUE, GREEN, ORANGE, YELLOW, BLACK, WHITE};

	// Attributes
	private State stateValue;
	private double value;
	private Color color;
	private String info;

	// Constructor
	public ObjectTest(){
		this.setState(State.OFF);
		this.value = 0;
		this.color = Color.WHITE;
		this.info = "25°C";
	}


	// State option
	private void printState(){
		String state = (this.getState()==State.ON?"ON":"OFF");
		System.out.println("State : " + state);
	}	

	void toggleState(){
		this.setState(this.getState()==State.ON?State.OFF:State.ON);
	}

	public State getState(){
		return this.stateValue;
	}

	public void setState(State st){
		this.stateValue = st;
	}

	// Value option
	private void printValue(){
		System.out.println("Value : " + this.getValue());
	}

	public double getValue(){
		return this.value;
	}
	
	public void setValue(double val){
		if (val >= 0 && val <= 1){	//  0 <= val <= 1
			this.value = val;
		}
	}


	// Color option
	private void printColor(){
		System.out.println("Color : " + this.getColor());
	}

	public Color getColor(){
		return this.color;
	}
	
	public void setColor(Color col){
		this.color = col;
	}

	// Info getter
	public String getInfo(){
		return this.info;
	}

	// Main
	public static void main(String[] args){
		ObjectTest obj = new ObjectTest();
		// state test
		obj.setState(State.OFF);
		obj.printState();
		obj.toggleState();
		obj.printState();
		
		// value test
		obj.printValue();
		obj.setValue(0.3);
		obj.printValue();
		obj.setValue(3);
		obj.printValue();
		
		// color test
		obj.printColor();
		obj.setColor(Color.BLACK);
		obj.printColor();
		
		// info test
		System.out.println(obj.getInfo());
	}
}
