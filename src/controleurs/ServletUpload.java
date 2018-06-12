package controleurs;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import facades.ObjetInterface;
import facades.UserInterface;

/**
 * Servlet implementation class ServletUpload
 */
@WebServlet("/ServletUpload")
@MultipartConfig
public class ServletUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB(name="ObjetFacade")
    ObjetInterface objetFacade;
	
	@EJB(name="UserFacade")
    UserInterface userFacade;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

    private void newObject(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String name = (String)(request.getParameter("objectName"));
    	String description = (String)(request.getParameter("objectDescriptionn"));
    	String login = (String)(request.getSession().getAttribute("login"));
    	
    	//récupréation de la zone principale de l'utilisateur
    	int zoneId = userFacade.zonesUser(login);
    	
    	//création de l'objet
    	objetFacade.newObjet(name, description, login, zoneId);
    	
    	request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation = (String)(request.getParameter("op"));
		switch(operation){
		case "newObject":
			newObject(request, response);
		break;
		}
	}

}
