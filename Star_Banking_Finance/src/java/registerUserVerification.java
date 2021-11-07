/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Monisha
 */
public class registerUserVerification extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void createUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            Connection con1 = Mysql.getconnection();
           
            String rollno = request.getParameter("roll");
            
            String email = request.getParameter("email");
            String password = request.getParameter("pwd");
            int roll = Integer.parseInt(rollno);
           // int usertype = 1; // 1 for bank customer and 0 for bank employee
            
           String query = "insert into userCredentials(roll,email,password) values(?,?)";
           
           java.sql.PreparedStatement pt = con1.prepareStatement(query);
           pt.setInt(1, roll);
           pt.setString(2, email);
           pt.setString(3, password);
           
           
           pt.executeUpdate();
      		//create instance object of the SendEmail Class
           SendEmailForVerification sm = new SendEmailForVerification();
      		//get the 6-digit code
           String code = sm.getRandom();
           
      		//craete new user using all information
           registeredUser user = new registeredUser(email,password,code);
           
           //call the send email method
           boolean test = sm.sendEmail(user);
           
      		//check if the email send successfully
           if(test){
               HttpSession session  = request.getSession();
               session.setAttribute("authcode", user);
               response.sendRedirect(request.getContextPath()+"/codeVerify.jsp");
           }else{
      		  out.println("Failed to send verification email");
      	   }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            createUser(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(registerUserVerification.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
