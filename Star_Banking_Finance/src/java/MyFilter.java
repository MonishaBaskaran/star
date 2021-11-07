import java.io.IOException;  
import java.io.PrintWriter;  
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;  
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
  
public class MyFilter implements Filter{  
  
public void init(FilterConfig arg0) throws ServletException {}  
      
public void doFilter(ServletRequest req, ServletResponse resp,  
        FilterChain chain) throws IOException, ServletException {  
          
    try {
        PrintWriter out=resp.getWriter();
        ResultSet r =null;
        
        Connection con1 = Mysql.getconnection();
        Statement stat =con1.createStatement();
        int id = 0;
        
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        

        Cookie[] cookies = request.getCookies();
        if(cookies != null)
        {
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
        
        }  
        List<String> adminUrls = new ArrayList();
        adminUrls.add("/Star_Banking_Finance/adminDashboard.jsp");
        List<String> userUrls = new ArrayList();
        userUrls.add("/Star_Banking_Finance/customerDashboard.jsp");
        if(id!=0){
            String query = "select usertype from userCredentials where userID='"+id+"'";
            ResultSet rs= null;
            rs=stat.executeQuery(query);
            
            if(rs.next())
            {
               int type = rs.getInt("usertype");
               String url = request.getRequestURI();
               System.out.println(url);
               System.out.println(type);
                if(type==0 && adminUrls.indexOf(url) != -1){
                   chain.doFilter(req, resp);//sends request to next resource
                }else if(type ==1 && userUrls.indexOf(url) != -1){
                    chain.doFilter(req, resp);//sends request to next resource
                }else{
                    response.sendRedirect("index.html");
                }
            }
            
        }
        else{
           
            
           response.sendRedirect("index.html");
        }
    } catch (SQLException ex) {
        Logger.getLogger(MyFilter.class.getName()).log(Level.SEVERE, null, ex);
    }
          
}  
    public void destroy() {}  
  
}  





