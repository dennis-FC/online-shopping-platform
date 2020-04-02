<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>個人資料修改</title>
	<link rel="stylesheet" type="text/css" href="../css/index.css">
</head>

<body background="../img/125.jpg" style="background-repeat:no-repeat;background-attachment:fixed;background-position:center center;background-size: cover">

<header>
	<center><a href="index.jsp"><img src="../img/logo.jpg" class="hd_img"></a></center>
</header>

<nav>
            <ul class="flex-nav">
                <li><a href="index.jsp">首頁HOME</a></li>
                <li><a href="vip.jsp">團隊簡介</a></li>
                <li><a href="ranking.jsp">排行榜</a></li>
                <li><a href="car.jsp">購物車</a></li>
				<%
				
				   if(session.getAttribute("username")!=null)
				   {
					   if(session.getAttribute("username").equals("yy"))
					   {
						   out.println("<li><a href='administrator_out.jsp'>管理員登出</a></li>");
						   out.println("<li><a href='administrator.jsp'>管理員專區</a></li>");

					   }
					   else
					   {
						   out.println("<li><a href='vip_out.jsp'>會員登出</a></li>");
						   out.println("<li><a href='user.jsp'>會員專區</a></li>");
					   }
				   }
				   else
				   {
						out.println("<li><a href='vip_in.jsp'>會員登入</a></li>");
						out.println("<li><a href='user.jsp'>會員專區</a></li>");
						out.println("<li><a href='administrator_in.jsp'>管理員登入</a></li>");
				   }   
				%>
				<li><a href="search.jsp">商品搜尋</a></li>
            </ul>
</nav>

<div class="content2">
	<div>
<%
String name=new String(request.getParameter("register_name").getBytes("ISO-8859-1"),"utf-8");
String id=request.getParameter("register_username");
String password=request.getParameter("register_password");
String address=new String(request.getParameter("register_address").getBytes("ISO-8859-1"),"utf-8");
String gender=request.getParameter("register_sexual");
String phone=request.getParameter("register_phone");
String email=request.getParameter("register_email");
try{
	Class.forName("com.mysql.jdbc.Driver");
	try{
		String url="jdbc:mysql://localhost/mysql?useUnicode=true&characterEncoding=UTF-8";
		Connection con=DriverManager.getConnection(url,"root","1234");
		if(con.isClosed())
			out.println("連線建立失敗");
		else
		{
			String sql="use jsp_project";
			con.createStatement().execute(sql);
			
			sql="UPDATE member SET name='"+name+"',pwd='"+password+"',address='"+address+"',gender='"+gender+"',tel='"+phone+"',email='"+email+"' WHERE id='"+id+"'";
			int no=con.createStatement().executeUpdate(sql);
			if(no>0)
				out.println("<br><br><br><div style='text-align:center;'><h1>修改成功!! <a href='index.jsp'>點我</a>回首頁</h1></div>");
			
			

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
</div>

<footer>
	<div class="foot_left">
      <center><img src="../img/76.jpg" width="400" height="300"></center>
    </div>

    <div class="foot_right">
      <ul>
      	<b><font color="white">Play Store 遊戲銷售</b><br>
      	<br><a href="tel:09-11111111" style="text-decoration:none;color:white;">連絡電話: 09-11111111</a>
        <br><a href="https://is.gd/On7jTs" style="text-decoration:none;color:white;">地址: 桃園市中壢區中北路200號</a>
		<br><a href="mailto:PlayStore@email.com" style="text-decoration:none;color:white;">信箱: PlayStore@email.com</a>
      </ul>
	</div>
 	<div class="foot_center">
      <p>Copyright© Play Store 遊戲銷售,2019
    </div>
</footer>

</body>
</html>