<%-- 
    Document   : delete
    Created on : Nov 27, 2019, 8:29:37 PM
    Author     : tufanb
--%>
<%@page import="java.sql.*"%>
<%
int id= Integer.parseInt(request.getParameter("id"));
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/ismt","tbhattarai","password");
    PreparedStatement pstmt = conn.prepareStatement("delete from user where id=?");
    pstmt.setInt(1, id);
    int rowsUpdated=pstmt.executeUpdate();
    if(rowsUpdated>0){
      response.sendRedirect("welcome.jsp?msg=User Deleted!");    
    }else{
      response.sendRedirect("welcome.jsp?msg=User Could not be Deleted!");    

    }
}catch(Exception ex){
out.println(ex);
}
%>