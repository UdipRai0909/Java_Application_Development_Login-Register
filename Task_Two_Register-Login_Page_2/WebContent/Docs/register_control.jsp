<%-- 
    Document   : register_control
    Created on : Nov 25, 2019, 9:25:26 PM
    Author     : tufanb
--%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ismt", "tbhattarai", "password");
    String firstName = request.getParameter("firstname");
    String lastName = request.getParameter("lastname");
    String address = request.getParameter("address");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
   
    try {
        if (request.getParameter("	id")!=null) {
            //For User Update since the id is present.
            int id = Integer.parseInt(request.getParameter("id"));
            PreparedStatement pstmt = conn.prepareStatement("update user set first_name=?,last_name=?,username=?,address=? where id=?");
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, username);
            pstmt.setString(4, address);
            pstmt.setInt(5, id);
            int rowsUpdated= pstmt.executeUpdate();
            if(rowsUpdated>0){
              response.sendRedirect("welcome.jsp?msg=User Updated!");  
            }
        } else {
            //for new user since the id is not sent. 
            String confPassword = request.getParameter("confpassword");
            if (!password.equals(confPassword)) {
                response.sendRedirect("register.jsp?msg=<span style='color:red'>Your password and confirmed password did not match!</span>");
            } else {
                try {
                    PreparedStatement pstmt = conn.prepareStatement("insert into user(first_name,last_name,address,username,password)values(?,?,?,?,MD5(?))");
                    pstmt.setString(1, firstName);
                    pstmt.setString(2, lastName);
                    pstmt.setString(3, address);
                    pstmt.setString(4, username);
                    pstmt.setString(5, password);
                    int inserted = pstmt.executeUpdate();
                    String msg = "";
                    if (inserted > 0) {
                        msg = "User has been created.You can <a href='index.jsp'>login</a> now!";
                        response.sendRedirect("register.jsp?msg=" + msg);
                    } else {
                        msg = "User could not be created.Please try again with changes.";
                        response.sendRedirect("register.jsp?msg=" + msg);
                    }
                } catch (SQLException e) {
                    out.println(e);
                }
            }

        }
    } catch (Exception e) {
        out.println(e);
    }


%>
