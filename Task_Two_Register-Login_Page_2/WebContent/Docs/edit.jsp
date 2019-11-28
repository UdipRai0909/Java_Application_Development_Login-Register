<%--
    Document   : edit
    Created on : Nov 27, 2019, 7:08:12 PM
    Author     : tufanb
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit User</title>
</head>
<body>
	<%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ismt", "tbhattarai", "password");
            int id = Integer.valueOf(request.getParameter("id"));
            PreparedStatement pstmt = conn.prepareStatement("select first_name,last_name,address,username from user where id=?");
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {%>
	<form action="register_control.jsp" method="POST">
		<table>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstname"
					value="<%=rs.getString("first_name")%>" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastname"
					value="<%=rs.getString("last_name")%>" /></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input type="text" name="address"
					value="<%=rs.getString("address")%>" /></td>
			</tr>
			<tr>
				<td>Username</td>
				<td><input type="text" name="username"
					value="<%=rs.getString("username")%>" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="text" name="id" value="<%=id%>" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Register" /></td>
				<td><input type="reset" value="Reset" /></td>
			</tr>
			<tr>
				<td colspan="2"><a href="index.jsp">Go to Login</a></td>
			</tr>
		</table>
	</form>


	<%}%>
</body>
</html>
