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
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Monisha
 */
public class LoanRequestServlet extends HttpServlet {

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
            out.println("<title>Servlet LoanRequestServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoanRequestServlet at " + request.getContextPath() + "</h1>");
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
            Connection con1 = Mysql.getconnection();
            
            ResultSet r =null;
            
            Statement stat =con1.createStatement();
            
            int userid=0;
            
            String goldtype = request.getParameter("goldtype");
            String weight = request.getParameter("weight");
            String place = request.getParameter("place");
            String jewellerNameAddress = request.getParameter("jewellerNameAddress");
            
            Cookie[] cookies = request.getCookies();
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("TOKEN")){
                    String cookieVal = cookie.getValue();
                
                    String q = "select userID from cookiedetails where cookieVal='"+cookieVal+"'";
                    r = stat.executeQuery(q);
                    
                    if(r.next())
                    {
                       
                       userid = r.getInt("userID");
                    }
                    
                  }
            
            }
            String query = "insert into userloanrequestdetails(kn,goldtype,weight,place,jewellerNameAddress) values(?,?,?,?,?)";
            
            java.sql.PreparedStatement pt = con1.prepareStatement(query);
                
                pt.setInt(1,userid);
                pt.setString(2,goldtype);
                pt.setString(3,weight);
                pt.setString(4,place);
                pt.setString(5,jewellerNameAddress);
                
                pt.executeUpdate();
                
        } 
        catch (SQLException ex) {
            Logger.getLogger(LoanRequestServlet.class.getName()).log(Level.SEVERE, null, ex);
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
