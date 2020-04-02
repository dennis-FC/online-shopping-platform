<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>刪除購物車商品</title>
	<link rel="stylesheet" type="text/css" href="../css/index.css">

</head>

<div class="content2">
<%
try{
     Class.forName("com.mysql.jdbc.Driver");
	 try{
         String url="jdbc:mysql://localhost/mysql?useUnicode=true&characterEncoding=UTF-8";
         Connection con=DriverManager.getConnection(url,"root","1234");
		 if(con.isClosed())
			 out.print("連線建立失敗");
		 else
		  {
	         con.createStatement().execute("use jsp_project");

			 String sql="DELETE FROM car WHERE car_no='"+request.getParameter("car_no")+"'";
	
			 con.createStatement().execute(sql);
			 response.sendRedirect("car.jsp");

		   }
		   
		   con.close();
		}
	    catch(SQLException sExec)
	    {
           out.println("SQL錯誤"+sExec.toString());
	    }	 
}
catch(ClassNotFoundException err)
{
   out.println("class錯誤"+err.toString());
}   

%>
</div>


</body>
</html>