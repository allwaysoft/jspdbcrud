<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/student?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai";
String userid = "root";
String password = "root";
try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<script src="jquery.min.js"></script>
<body>
	<h1>Retrieve data from database in jsp</h1>
	<table border="1">
		<tr>
			<td>first name</td>
			<td>last name</td>
			<td>City name</td>
			<td>Email</td>
			<td>Action</td>
		</tr>
		<%
			try {
			connection = DriverManager.getConnection(connectionUrl, userid, password);
			statement = connection.createStatement();
			String sql = "select * from users";
			resultSet = statement.executeQuery(sql);
			int i = 0;
			while (resultSet.next()) {
		%>
		<tr>
			<td><%=resultSet.getString("first_name")%></td>
			<td><%=resultSet.getString("last_name")%></td>
			<td><%=resultSet.getString("city_name")%></td>
			<td><%=resultSet.getString("email")%></td>
			<td><a href="delete.jsp?id=<%=resultSet.getString("id")%>"><button
						type="button" class="delete">Delete</button></a></td>
		</tr>
		<%
			i++;
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</table>
</body>
</html>