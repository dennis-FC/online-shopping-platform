<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>會員註冊</title>
	<link rel="stylesheet" type="text/css" href="../css/index.css">
	
    <base target="_self">
    <script type="text/javascript">
	 
	 
    function datacheck()
    {
      if (user.register_name.value=="")
      {
        window.alert("會員姓名不得為空白！");
        focusto(0);
        return false;
      }
      if (user.register_username.value=="")
      {
        window.alert("會員帳號不得為空白！");
        focusto(1);
        return false;
      }

      if (user.register_password.value=="")
      {
        window.alert("會員密碼不得為空白！");
        focusto(2);
        return false;
      }
	  if(user.register_password.value!=user.register_checkpwd.value)
	  {
	    window.alert("確認密碼與密碼不同！");
        focusto(3);
        return false;
	  }
	  if(user.register_phone.value!=user.register_phone.value*1)
	  {
		  window.alert("電話請輸入數字!");
		  focusto(4);
		  return false;
	  }	  
	  if(user.register_email.value.indexOf('@')==-1)
	  {
		  window.alert("請輸入正確email!");
		  focusto(5);
		  return false;
	  }
	  if (user.register_phone.value=="")
      {
        window.alert("會員電話不得為空白！");
        focusto(6);
        return false;
      }
	  if (user.register_email.value=="")
      {
        window.alert("會員信箱不得為空白！");
        focusto(7);
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

<body>
	<div>
		<p><form name="user" method="post" action="account.jsp">
			<br><center><font size="6" color="#4876FF"><b>【會員註冊】</font></center>
			<br><center><table style="border:5px #46a3ff dotted" cellpadding="10" border='0' align="center" ></center>
				<tr>
					<td>&nbsp姓名 :&nbsp;</td>
					<td>
					<input type="text" name="register_name"><font color="red" size=2>*必填&nbsp </font>
					</td>
				</tr>
				<tr>
					<td>&nbsp帳號 :&nbsp;</td>
					<td>
					<input type="text" name="register_username"><font color="red" size=2>*必填&nbsp </font>
					</td>
				</tr>
				<tr>
					<td>&nbsp密碼 :&nbsp;</td>
					<td>
					<input type="password" name="register_password"><font color="red" size=2>*必填&nbsp </font>
					</td>
				</tr>
				<tr>
					<td>&nbsp確認密碼 :&nbsp;</td>
					<td>
					<input type="password" name="register_checkpwd"><font color="red" size=2>*必填&nbsp </font>
					</td>
				</tr>
				<tr>
					<td>&nbsp地址 :&nbsp;</td>
					<td>
					<input type="text" name="register_address"><font color="blue" size=2>*選填&nbsp</font>
					</td>
				</tr>
				<tr>
					<td>&nbsp性別 :&nbsp;</td>
					<td>
					<input type="radio" name="register_sexual" value="man" checked>男&nbsp;
					<input type="radio" name="register_sexual" value="woman">女
					</td>
				</tr>
				<tr>
					<td>&nbsp電話 :&nbsp;</td>
					<td>
					<input type="text" name="register_phone"><font color="red" size=2>*必填&nbsp </font>
					</td>
				</tr>
				<tr>
					<td>&nbsp信箱 :&nbsp;</td>
					<td>
					<input type="email" name="register_email"><font color="red" size=2>*必填&nbsp </font>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="reset" value="重新填寫" class="btn2">
					<input type="button" value="確認送出" class="btn2" onclick="datacheck()"></td>

				</tr>
			</table><br>
		</form><p>
		
	</div></b>

</body>

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