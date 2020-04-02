<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>會員專區</title>
	<link rel="stylesheet" type="text/css" href="../css/index.css">
	<script type="text/javascript">

    function datacheck()
    {
      if (user.register_name.value=="")
      {
        window.alert("會員姓名不得為空白！");
        focusto(0);
        return false;
      }
       if (user.register_password.value=="")
      {
        window.alert("會員密碼不得為空白！");
        focusto(1);
        return false;
      }
	  if(user.register_password.value!=user.register_checkpwd.value)
	  {
	    window.alert("確認密碼與密碼不同！");
        focusto(2);
        return false;
	  }
	  if(user.register_phone.value!=user.register_phone.value*1)
	  {
		  window.alert("電話請輸入數字!");
		  focusto(3);
		  return false;
	  }	  
	  if(user.register_email.value.indexOf('@')==-1)
	  {
		  window.alert("請輸入正確email!");
		  focusto(4);
		  return false;
	  }
	  if (user.register_phone.value=="")
      {
        window.alert("會員電話不得為空白！");
        focusto(5);
        return false;
      }
	  if (user.register_email.value=="")
      {
        window.alert("會員信箱不得為空白！");
        focusto(6);
        return false;
      }
	user.submit();
    }
    function focusto(x) 
	{ 
      user.forms[0].elements[x].focus();
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
	         con.createStatement().execute("use jsp_project");
			 String sql="SELECT * FROM member WHERE id='"+session.getAttribute("username")+"'";
			 ResultSet rs=con.createStatement().executeQuery(sql);
			 if(session.getAttribute("username")==null)
			 {
				out.println("<br><br><br><div style='text-align:center;'><h1>您尚未登入，<a href='vip_in.jsp' >按此</a>進入登入頁面</h1></div><br>");
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
				
			 
				 
				%> 
				<p>
				<br><center>
				<a href="user.jsp"><input type="button" value="個人資料修改" class="btn5"></a>
                <a href="trading_record.jsp"><input type="button" value="消費紀錄" class="btn5"></a>
				<a href="view_record.jsp"><input type="button" value="留言紀錄" class="btn5"></a>
				</center>
			   	<center><font size="6" color="#4876FF"><b>【個人資料修改】</font></center><br>
			   <form name="user" method="post" action="change_user.jsp" name="view">
			   <center><table style="border:5px #46a3ff dotted" cellpadding="10" border='0' align="center">
				
				<tr>
					<td>&nbsp姓名 :&nbsp;</td>
					<td>
					<input type="text" name="register_name" value=<%=rs.getString(1)%>><font color="red" size=2 >*必填&nbsp</font>
					</td>
				</tr>
				<tr>
					<td>&nbsp帳號 :&nbsp;</td>
					<td>
					<input type="text" name="register_username" value=<%=rs.getString(2)%> readonly="register_username"><font color="red" size=2 >*不可修改&nbsp</font>
					</td>
				</tr>
				<tr>
					<td>&nbsp密碼 :&nbsp;</td>
					<td>
					<input type="password" name="register_password" value=<%=rs.getString(3)%>><font color="red" size=2>*必填&nbsp</font>
					</td>
				</tr>
				<tr>
					<td>&nbsp確認密碼 :&nbsp;</td>
					<td>
					<input type="password" name="register_checkpwd"><font color="red" size=2>*必填&nbsp</font>
					</td>
				</tr>
				<tr>
					<td>&nbsp地址 :&nbsp;</td>
					<td>
					<input type="text" name="register_address" value=<%=rs.getString(4)%>><font color="blue" size=2>*選填&nbsp</font>
					</td>
				</tr>
				<tr>
					<td>&nbsp性別 :&nbsp;</td>
					<td>
					<input type="radio" name="register_sexual" value="man" <%if(rs.getString(5).equals("man")) out.print("checked");;%>>男&nbsp;
					<input type="radio" name="register_sexual" value="woman" <%if(rs.getString(5).equals("woman")) out.print("checked");%>>女
					</td>
				</tr>
				<tr>
					<td>&nbsp電話 :&nbsp;</td>
					<td>
					<input type="text" name="register_phone" value=<%=rs.getString(6)%>><font color="red" size=2>*必填&nbsp </font>
					</td>
				</tr>
				<tr>
					<td>&nbsp信箱 :&nbsp;</td>
					<td>
					<input type="text" name="register_email" value=<%=rs.getString(7)%>><font color="red" size=2>*必填&nbsp </font>
					</td>
				</tr>
				<tr>
					<td><input type="button" value="確認修改" class="cart-btn" onclick="datacheck()"></td>
					<td><input type="reset" value="重新填寫" class="cart-btn"></td>
				</tr>
			  </table></center><br>
		   </form></b>
		   <p>			  
				 
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