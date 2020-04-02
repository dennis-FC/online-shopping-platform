<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>新增商品</title>
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
			  int no=0;
	         con.createStatement().execute("use jsp_project");
			 String sql="SELECT* FROM product_num WHERE product LIKE'"+request.getParameter("product_topic")+"%'";
			 ResultSet rs=con.createStatement().executeQuery(sql);
			 if(rs.next())
				 no=Integer.parseInt(rs.getString(2))+1;
			 String product_id=request.getParameter("product_topic")+String.valueOf(no);

			 
			 
				 
				 String new_product_name=new String(request.getParameter("product_name").getBytes("ISO-8859-1"),"utf-8");
				 String new_product_note=new String(request.getParameter("product_note").getBytes("ISO-8859-1"),"utf-8");
				 String new_product_price=request.getParameter("product_price");
				 String new_product_left=request.getParameter("product_left");
				 String new_product_rightnote=new String(request.getParameter("product_rightnote").getBytes("ISO-8859-1"),"utf-8");
				 String new_product_downnote=new String(request.getParameter("product_downnote").getBytes("ISO-8859-1"),"utf-8");
				 

				 
				        sql="INSERT wait_product(product_id,product_name,product_note,product_price,product_left,product_rightnote,product_downnote)";
				        sql+="VALUES('"+product_id+"',";
						sql+="'"+new_product_name+"',";
						sql+="'"+new_product_note+"',";
						sql+="'"+new_product_price+"',";
						sql+="'"+new_product_left+"',";
						sql+="'"+new_product_rightnote+"',";
						sql+="'"+new_product_downnote+"');";
						
				con.createStatement().execute(sql);
				
				sql="UPDATE product_num SET num='"+no+"' WHERE product='"+request.getParameter("product_topic")+"'";
				con.createStatement().execute(sql);
				
				
				out.println("<br><br><br><div style='text-align:center;'><h1>新增商品至待上架區成功!! <a href='administrator.jsp'>點我回管理員專區</a></h1></div>");


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