<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>加入購物車</title>
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
			 String sql="SELECT* FROM product WHERE product_id='"+request.getParameter("whichproduct_car")+"'";
			 ResultSet rs=con.createStatement().executeQuery(sql);
			 if(session.getAttribute("username")==null)
			 {
					out.println("<br><br><br><div style='text-align:center;'><h1>您尚未登入，<a href='vip_in.jsp'>按此</a>進入登入頁面</h1></div><br>");
					out.print("<center><font color='gray'><b><h3>廣告</h3></b></font></center>");
					Random ran=new Random();
					String adsql="SELECT* FROM ad";
					ResultSet adrs=con.createStatement().executeQuery(adsql);

					adrs.last();
					int total=adrs.getRow();
					int current_adid=ran.nextInt(total)+1;
					adsql="select * from ad where ADID= '" + current_adid+"'";
					ResultSet adrs2=con.createStatement().executeQuery(adsql);
					while (adrs2.next()) //只有一筆資料
					{
						out.println("<a href='http://"+adrs2.getString(3)+"'>");
						out.println("<center><img src='../img/"+adrs2.getString(2)+"' width='700' height='500'");
						out.println(" alt='"+adrs2.getString(4)+"'></center></a><br>");
					}
			 }			 
			 else if(rs.next())
			 {
				 String product=request.getParameter("whichproduct_car");
				 //out.println(product);
				 
				 String sql2="INSERT car(buyer_id,product_id,product_name,product_number,product_price,original_price,product_left)";
				        sql2+="VALUES('"+session.getAttribute("username")+"',";
						sql2+="'"+request.getParameter("whichproduct_car")+"',";
						sql2+="'"+rs.getString(2)+"',";
						sql2+="'1',";
						sql2+="'"+rs.getString(4)+"',";
						sql2+="'"+rs.getString(4)+"',";
						sql2+="'"+rs.getString(5)+"');";
						
				con.createStatement().execute(sql2);
				response.sendRedirect("car.jsp");

				%> 
				
                <%
			 }
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




<div class="in_br"><span></span></div>
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