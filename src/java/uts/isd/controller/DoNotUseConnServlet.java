/*

* A Servlet instance will be created once the project is deployed.

* The init() method will create an instance of DBConnector to be used for the session.

* database conenction will be closed automatically once the servelt is destroyed

 * The servlet provide the application with a connection pool.

 * One instance of the db connection to be used across the session.

*/

package uts.isd.controller;

 

 
import uts.isd.model.dao.DB;
import uts.isd.model.dao.DBConnector;

import java.sql.Connection;

import java.util.logging.Level;

import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import uts.isd.model.dao.*;


import java.io.IOException;

import java.sql.SQLException;

import java.util.List;


import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import Model.User;


/**

* ControllerServlet.java

* This servlet acts as a page controller for the application, handling all

* requests from the user.

* @author www.codejava.net

*/

public class DoNotUseConnServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;


    public void init() {

        String jdbcURL = getServletContext().getInitParameter("jdbcURL");

        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");

        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");


        userDAO = new UserDAO(jdbcURL, jdbcUsername, jdbcPassword);


    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {

        doGet(request, response);

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {
System.err.println("request.getServletPath() -" + request.getServletPath());
System.err.println("getRequestURI()) -" + request.getRequestURI());
        String[] segments = request.getRequestURI().split("/");

        String action = segments[segments.length-1];
        
        System.out.println(action);


        try {

           

                if ("new".equals(action)) {
                showNewForm(request, response);
            } else if ("update".equals(action)) {
                showEditForm(request, response);
            } else if ("save".equals(action)) {
                updateUser(request, response);
            } else if ("insert".equals(action)) {
                insertUser(request, response);
            } else if ("delete".equals(action)) {
                deleteUser(request, response);
            } else {
                listUser(request, response);
            }


                      

/**           

            switch (action) {

//            case "/new":

//                showNewForm(request, response);

//                break;

            case "/insert":

                insertUser(request, response);

                break;

            case "/delete":

                deleteUser(request, response);

                break;

//            case "/edit":

//                showEditForm(request, response);

//                break;

            case "/update":

                updateUser(request, response);

                break;

            default:

                listUser(request, response);

                break;

            }

**/           

            

        } catch (SQLException ex) {

            throw new ServletException(ex);

        }

    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

 

        List<User> listUser = userDAO.listAllUsers();

        request.getSession().setAttribute("listUser", listUser);

        RequestDispatcher dispatcher = request.getRequestDispatcher("./UserList.jsp");

        dispatcher.forward(request, response);

    }

 


    private void showNewForm(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("../UserForm.jsp?action=new");

        dispatcher.forward(request, response);

    }


    private void showEditForm(HttpServletRequest request, HttpServletResponse response)

            throws SQLException, ServletException, IOException {

        String Username = request.getParameter("Username");

        User existingUser = userDAO.getUser(Username);

        RequestDispatcher dispatcher = request.getRequestDispatcher("../UserForm.jsp?action=edit");

        request.setAttribute("user", existingUser);

        dispatcher.forward(request, response);

    }


    private void insertUser(HttpServletRequest request, HttpServletResponse response)

            throws SQLException, IOException {

        String FullName = request.getParameter("FullName");

        String PhoneNumber = request.getParameter("PhoneNumber");

        String Username = request.getParameter("Username");

        String Password = request.getParameter("Password");

        String Status = request.getParameter("Status");

        String Role = request.getParameter("Role");


        User newUser = new User(FullName, PhoneNumber, Username, Password, Status, Role);

        userDAO.insertUser(newUser);

        response.sendRedirect("list");

    }


    private void updateUser(HttpServletRequest request, HttpServletResponse response)

            throws SQLException, IOException {

        String FullName = request.getParameter("FullName");

        String PhoneNumber = request.getParameter("PhoneNumber");

        String Password = request.getParameter("Password");

      String Status = request.getParameter("Status");

      String Role = request.getParameter("Role");


        User user = new User(FullName, PhoneNumber, Password, Status, Role);

        userDAO.updateUser(user);

        response.sendRedirect("list");

    }


    private void deleteUser(HttpServletRequest request, HttpServletResponse response)

            throws SQLException, IOException {

      String Username = request.getParameter("Username");


        User user = new User(Username);

        userDAO.deleteUser(user);

        response.sendRedirect("list");


    }

}