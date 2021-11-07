/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.console;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
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
public class KycVerificationServlet extends HttpServlet {

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
            out.println("<title>Servlet KycVerificationServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet KycVerificationServlet at " + request.getContextPath() + "</h1>");
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
            System.out.println("Test");
            ResultSet r =null;
            Connection con1 = Mysql.getconnection();
            Statement stat =con1.createStatement();
            
            String name = request.getParameter("name");
            String aadhaarNo = request.getParameter("aadhaar");
            String mobile = request.getParameter("mobile");
            String dob = request.getParameter("dob");
            
            int id = 0;
          
            Cookie[] cookies = request.getCookies();
            for(Cookie cookie : cookies){
               //  System.out.println(cookie.getName());
                if(cookie.getName().equals("TOKEN")){
                    String cookieVal = cookie.getValue();
                
                    String q = "select userID from cookiedetails where cookieVal='"+cookieVal+"'";
                    r = stat.executeQuery(q);
                    
                    if(r.next())
                    {
                       
                       id = r.getInt("userID");
                    }
                    
                  }
            }
            System.out.println(id);
            String query = "select * from dummykycdetails where name='"+name+"' and aadhaarNo='"+aadhaarNo+"' and mobile='"+mobile+"' and dob='"+dob+"' ";
            
            ResultSet rs = stat.executeQuery(query);
            if(rs.next())
            {
                 System.out.println("test 111");
                String query1 = "update usercredentials set name =? ,aadhaarNo=? ,mobile=? ,dob=? ,kycVerificationStatus=? where userID=?";
                java.sql.PreparedStatement pt = con1.prepareStatement(query1);
                
                pt.setString(1,name);
                pt.setString(2,aadhaarNo);
                pt.setString(3,mobile);
                pt.setString(4,dob);
                pt.setInt(5,1);
                pt.setInt(6,id);
                
                pt.executeUpdate();
                
            }   
            else
            {
                PrintWriter out =null;
                out.print("error");
            }
                
                
                
            
        } catch (SQLException ex) {
            Logger.getLogger(KycVerificationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
