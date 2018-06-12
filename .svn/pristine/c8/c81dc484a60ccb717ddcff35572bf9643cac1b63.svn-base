package domotique;
import java.util.Scanner;
import java.util.ArrayList;
import java.lang.reflect.*;	// pour l'introspection

// pour xml :
import javax.xml.parsers.*; // DocumentBuilderFactory, DocumentBuilder
import org.w3c.dom.*;       // Document
import javax.xml.transform.*;   // Transformer, TransformerFactory
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;


/*
	TODO :
		ÉCRIRE LA DTD
		Convertir en classe abstraite
*/

public class ObjectManager {

	// Attributes
	private String className;
	private Method[] methods;

	// Constructor
	public ObjectManager(String fileName){
		this.className = fileName.substring(0, fileName.indexOf("."));

	}

	/** introspects the .class of the object and stores its declared methods
	 *  in the methods attribute
	 */
	public void findMethods(){
		Class object = null;
		try {	// ne compile pas sans le try-catch
			object = Class.forName(className);
			Method[] m = object.getDeclaredMethods();
			this.setMethods(m);
		} catch (ClassNotFoundException e){
			System.out.println("" + className + " not found");
		}
	}

	/** getter - object name
	 */
	public String getClassName(){
		return this.className;
	}
	
	/** getter - foud methods
	 */
	public ArrayList<Method> getMethods(){
		ArrayList<Method> list = new ArrayList<Method>();
		for (Method i : this.methods){
			list.add(i);
		}
		return list;
	}

	/** sets the method attribute. Can't be used by another class
	 */
	private void setMethods(Method[] m){
		this.methods = m;
	}

	/** removes the methods that we dont know and that will not be used on
	 *  the website (ex : private methods)
	 */
	public void removeUselessMethods(){
		// TODO
		}

	/** creates the XML : writes found methods and their parameters
	 */
	public void createXML() throws Exception {
		if (getMethods().size() != 0){	// don't create the .xml if no methods in the .class
			
			// Creation of a new DOM document
			DocumentBuilderFactory fabrique = DocumentBuilderFactory.newInstance();
			DocumentBuilder constructor = fabrique.newDocumentBuilder();
			Document document = constructor.newDocument();
			document.setXmlStandalone(true);


			Element root = document.createElement("root");	// ROOT
			// Adding methods + parameters :
			Boolean statePresent = false;	// bc several methods about State but only 1 in the xml
			Boolean valuePresent = false;
			Boolean colorPresent = false;
			Boolean infoPresent = false;
			for(Method m : this.getMethods()){
				String methodName = m.toString();
				Object o = Class.forName(this.getClassName()).newInstance(); // on instancie l'objet cobaye
				if (methodName.contains("State") && !statePresent){
					// add  <state>ON</state> :
					Element state = document.createElement("state");
					String objectState = o.getClass().getMethod("getState").invoke(o).toString();
					state.appendChild(document.createTextNode(objectState));
					root.appendChild(state);
					statePresent = true;
				} else if (methodName.contains("Value") && !valuePresent){			
					// add  <value>42</value> :
					Element value = document.createElement("value");
					String objectValue = o.getClass().getMethod("getValue").invoke(o).toString();
					value.appendChild(document.createTextNode(objectValue));
					root.appendChild(value);
					valuePresent = true;
				} else if (methodName.contains("Color") && !colorPresent){
					// add  <color>WHITE</color> :
					Element color = document.createElement("color");
					String objectColor = o.getClass().getMethod("getColor").invoke(o).toString();
					color.appendChild(document.createTextNode(objectColor));
					root.appendChild(color);
					colorPresent = true;				
				} else if (methodName.contains("Info") && !infoPresent){
					// add  <info>blablabla</info> :
					Element info = document.createElement("info");
					// get the method and invoke it
					String objectInfo = o.getClass().getMethod("getInfo").invoke(o).toString();
					info.appendChild(document.createTextNode(objectInfo));
					root.appendChild(info);
					infoPresent = true;				
				}
			}
	
			document.appendChild(root);	// root est la racine
			// Créer le .xml et y écrire le contenu
			
			// Put the document in a String :
			DOMSource domSource = new DOMSource(document);
			StringWriter writer = new StringWriter();
			StreamResult result = new StreamResult(writer);
			TransformerFactory tf = TransformerFactory.newInstance();
			Transformer transformer = tf.newTransformer();
			transformer.setOutputProperty(OutputKeys.INDENT, "yes");
			transformer.transform(domSource, result);
		
			// Write the string in the xml :
			File f = new File (this.getClassName() + ".xml");
			try {
				FileWriter fw = new FileWriter(f);
				fw.write(writer.toString());
				fw.close();
			} catch (IOException exception) {
				System.out.println("ERREUR : impossible de créer le fichiier");
			}
		} // Fin if

	}

	public static void main(String[] args) throws Exception {
		String className = "";
		File f;
		Boolean argsTried = false;
		Boolean nameAsked = false;
		do {
			if (argsTried || nameAsked)
				System.out.println("The file " + className + " doesn't exist");
			if (args.length != 0 && !argsTried){
				className = args[0];
			 	argsTried = true;
				System.out.println("args : "+args);
			} else {
				Scanner sc = new Scanner(System.in);
				System.out.print("\nName of the .class : ");
				className = sc.nextLine();
				nameAsked = true;
			}
			f = new File(className);
		} while (!f.exists() || f.isDirectory());
		ObjectManager o = new ObjectManager(className);
		o.findMethods();	
	
		// found methods
		/*
		System.out.println("Methods : ");
		for (Method m : o.getMethods()){
			System.out.println("\t" + m.toString());
		}*/
		System.out.print("Generating .xml... ");
		o.createXML();
		System.out.println("ok");

	}
}	
