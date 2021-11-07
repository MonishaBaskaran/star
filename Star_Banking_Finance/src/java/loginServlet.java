/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Monisha
 */
public class loginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        processRequest(request, response);
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
            PrintWriter out = null;
            Connection con1 = Mysql.getconnection();
            
            Statement stat =con1.createStatement();

            String email = request.getParameter("email");
            String password = request.getParameter("pwd");
            
            String query = "select userID,usertype,verificationStatus from userCredentials where email='"+email+"' AND password='"+password+"'";
            
            ResultSet res= stat.executeQuery(query);
            if(res.next())
            {
             int type = res.getInt("usertype");
             int userid = res.getInt("userID");
             
            SendEmailForVerification s = new SendEmailForVerification();
             
            String cookievalue = s.getRandom();
                
            Cookie cookie = new Cookie("TOKEN",cookievalue);
            response.addCookie(cookie);

            String insert = "insert into cookieDetails(userID,cookieVal) values(?,?)";

            java.sql.PreparedStatement pt = con1.prepareStatement(insert);

            pt.setInt(1, userid);
            pt.setString(2, cookievalue);

            pt.executeUpdate();
            
            if(type==1){
           
            int status = res.getInt("verificationStatus");
            
            if(status == 0){
                
                RequestDispatcher rd=request.getRequestDispatcher("/customerDashboard.jsp");  
                response.sendRedirect(request.getContextPath()+"/customerDashboard.jsp"); 
                
                
            }
            else
            {
                RequestDispatcher rd=request.getRequestDispatcher("index.html");  
                rd.forward(request,response); 
                
            }
            }
            else if(type==0)
            {
                RequestDispatcher rd=request.getRequestDispatcher("adminDashboard.jsp");  
                response.sendRedirect(request.getContextPath()+"/adminDashboard.jsp");  
            }
            else
            {
                RequestDispatcher rd=request.getRequestDispatcher("index.html");  
                rd.forward(request,response); 
            }
            
            }
            else
            {
            out.print("<p style=\"color:red\">Sorry username or password error</p>");  
            RequestDispatcher rd=request.getRequestDispatcher("index.html");  
            rd.include(request,response);  
            }
            }
        
        catch (SQLException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
