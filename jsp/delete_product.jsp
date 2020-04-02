<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>刪除商品</title>
	<link rel="stylesheet" type="text/css" href="../css/index.css">
    <script type="text/javascript">
     function submitBtnClick()
     {	 
	  document.fileForm.submit();
     }
	 </script>
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
<br><center>
		<a href="new_product.jsp"><input type="button" value="新增商品" class="btn3"></a>
        <a href="change_product.jsp"><input type="button" value="修改商品" class="btn3"></a>
		<a href="delete_product.jsp"><input type="button" value="刪除商品" 	class="btn3"></a>
		<a href="on_product.jsp"><input type="button" value="上架商品" class="btn3"></a>
		<a href="down_product.jsp"><input type="button" value="下架商品" class="btn3"></a>
		<a href="order_manager.jsp"><input type="button" value="瀏覽訂單" class="btn3"></a>
		<a href="member_manager.jsp"><input type="button" value="會員名單" class="btn3"></a>
		<a href="member_view.jsp"><input type="button" value="留言紀錄" class="btn3"></a>
	</center>
	
	
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
			 String sql="SELECT* FROM wait_product ";
			 ResultSet rs=con.createStatement().executeQuery(sql);
			 %>
			    <center><font size="6" color="#4876FF"><b>【刪除待上架商品】</font></center>	
			 	<br><center><table style="border:5px #4876FF groove" cellpadding="10" border='0' align="center"></center>
                <tr align="center">
				  <td width="100"><br><b><font size="5" color="#104E8B">商品圖<hr color="#3A5FCD"></td>
				  <td width="200"><br><b><font size="5" color="#104E8B">商品名<hr color="#3A5FCD"></td>
				  <td width="200"><br><b><font size="5" color="#104E8B">商品描述<hr color="#3A5FCD"></td>
				  <td width="50"><br><b><font size="5" color="#104E8B">單價<hr color="#3A5FCD"></td>
				  <td width="50"><br><b><font size="5" color="#104E8B">庫存<hr color="#3A5FCD"></td>
				  <td width="50"><br><b><font size="5" color="#104E8B">刪除<hr color="#3A5FCD"></td>
				</tr>

			<%
			 while(rs.next())
			 {
				String A="A",B="B",C="C",D="D",E="E";
				String folder=rs.getString(1);
				String folder2=rs.getString(1);
				if(folder.length()==2)folder=folder.substring(0,folder.length()-1);
				else folder=folder.substring(0,folder.length()-2);
			    
				if(folder.equals(A)) folder="1000";
				else if(folder.equals(B)) folder="2000";
				else if(folder.equals(C)) folder="3000";
				else if(folder.equals(D)) folder="4000";
				else if(folder.equals(E)) folder="5000";
				%>
				
				<tr align="center">
				   <td><img src="../<%=folder%>/<%=folder2%>.jpg" width="100" height="100"></td>
				   <td><%=rs.getString(2)%></td>
				   <td><%=rs.getString(3)%></td>
				   <td><%=rs.getString(4)%></td>
				   <td><%=rs.getString(5)%></td>
				   <td>
				       <form action="delete_product2.jsp" method="post">
			           <input type="hidden" name="product_id" value="<%=rs.getString(1)%>">
			           <button id="submitBtn" onclick="submitBtnClick()"><img src="../img/icon_remove.png"></button><br>
			           </form></td>
				</tr>	   
				<tr>
				<td colspan="6">     
				<font color="#6495ED"><b>----------------------------------------------------------------------------------------------------------------------------------------------</b></td>
				</tr>

			 <%}%>
			 
			 </table></b><br>
			 <%
			 
			 
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