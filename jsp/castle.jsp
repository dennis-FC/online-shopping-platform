<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>惡靈古堡</title>
	<link rel="stylesheet" type="text/css" href="../css/index.css">
	<script type="text/javascript">
	function zero(value)
	{
		if(value='1')
		{
		 	window.alert("沒有庫存");
            focusto(0);
            return false;
		}
       
	}
	
	function focusto(x) 
	{ 
      pay_information.forms[0].elements[x].focus();
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
<%
try{
     Class.forName("com.mysql.jdbc.Driver");
	 try{
         String url="jdbc:mysql://localhost/";
         Connection con=DriverManager.getConnection(url,"root","1234");
		 if(con.isClosed())
			 out.print("連線建立失敗");
		 else
		   {
			 String sql="use jsp_project";
             con.createStatement().execute(sql);
			 
			 sql="SELECT * FROM product WHERE product_id LIKE 'B%'";
			 ResultSet rs=con.createStatement().executeQuery(sql);
			 %>
			 <div>
	         <center><img src="../2000/9.jpg" class="ban_60_img"></center>
             </div>

             <div>
	         <center><img src="../img/155.jpg" class="ban_img"></center>
             </div>
             <br><br>
			 <%
			 while(rs.next()){%>
			 
			 <div class="product_logo">
			 <div class="product_space_1"><p></p></div>

	         <div class="product_1">
		     <center><img src="../2000/<%=rs.getString(1)%>.jpg" class="imghover"><br>
			 <form action="B1.jsp" method="post">
			 <input type="hidden" name="which_product" value="<%=rs.getString(1)%>">
			 <button id="submitBtn" onclick="submitBtnClick()">了解詳情</button>
			 </form>
	         </div>

	         <div class="product_space_2"><p></p></div>

             <div class="product_2">
             <center><span><font color="blue"><span class="x"><%=rs.getString(2)%></font></span><br>
    	     <span class="h"><%=rs.getString(3)%></span><br>

			 </center>
             </div>

             <div class="product_space_3"><p></p></div>

             <div class="product_3">
             <center><span class="x">價格:<%=rs.getString(4)%></span></center><br>
			 <center><span class="w">庫存:<%=rs.getString(5)%>套</span></center><br>
	         <form action="addto_car.jsp" method="post">
			 <input type="hidden" name="whichproduct_car" value="<%=rs.getString(1)%>">
			 <%
			 if(Integer.parseInt(rs.getString(5))==0)
				 out.println("<center><input type=button onclick=zero(1) style=background-color:#FFFF78 value=目前沒有庫存></center>");
			 else
				 out.println("<center><button id=submitBtn onclick=submitBtnClick() style=background-color:#FFFF78 >加入購物車</button><br></center>");
			 %>
			 </form>
             </div>

			 <div class="product_space_4"><p></p></div>
			 </div>

			 <div class="product_br"><span></span></div>  
			 

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