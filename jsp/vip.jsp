<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>團隊簡介</title>
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
<body>
<br><center><font size="6" color="#4876FF"><b>【團隊簡介】</font></center>
  <main id="main" class="container">

  <div id="about" class="full">
    <div class="about-photo">
      <a href=""><img src="../img/10444272.jpg" alt="會員大頭貼"></a>
    </div>
    <div class="about-msg">
      <table class="about-table">
        <tr>
          <td>姓名 :</td>
          <td>張瑋軒&nbsp;&nbsp;<a href="">Facebook</a></td>
        </tr>
        <tr>
          <td>班級 :</td>
          <td>資管四乙</td>
        </tr>
        <tr>
          <td>信箱 :</td>
          <td>s10444272@.cycu.edu.tw</td>
        </tr>
      </table>
    </div>
  </div>
  <div id="about" class="full">
    <div class="about-photo">
      <a href=""><img src="../img/10441421.jpg" alt="會員大頭貼"></a>
    </div>
    <div class="about-msg">
      <table class="about-table">
        <tr>
          <td>姓名 :</td>
          <td>范姜永岩&nbsp;&nbsp;<a href="https://www.facebook.com/dennis.fanchang">Facebook</a></td>
        </tr>
        <tr>
          <td>班級 :</td>
          <td>企管四丁</td>
        </tr>
        <tr>
          <td>信箱 :</td>
          <td>s10441421@.cycu.edu.tw</td>
        </tr>
      </table>
    </div>
  </div>
  <div id="about" class="full">
    <div class="about-photo">
      <a href=""><img src="../img/10441408.jpg" alt="會員大頭貼"></a>
    </div>
    <div class="about-msg">
      <table class="about-table">
        <tr>
          <td>姓名 :</td>
          <td>蔡薈芳&nbsp;&nbsp;<a href="https://www.facebook.com/profile.php?id=100004187827964">Facebook</a></td>
        </tr>
        <tr>
          <td>班級 :</td>
          <td>企管四丁</td>
        </tr>
        <tr>
          <td>信箱 :</td>
          <td>s10441408@.cycu.edu.tw</td>
        </tr>
      </table>
    </div>
  </div>
  <div id="about" class="full">
    <div class="about-photo">
      <a href=""><img src="../img/10624302.jpg" alt="會員大頭貼"></a>
    </div>
    <div class="about-msg">
      <table class="about-table">
        <tr>
          <td>姓名 :</td>
          <td>秦珈嚴&nbsp;&nbsp;<a href="https://www.facebook.com/profile.php?id=100002043908348">Facebook</a></td>
        </tr>
        <tr>
          <td>班級 :</td>
          <td>資管二乙</td>
        </tr>
        <tr>
          <td>信箱 :</td>
          <td>s10624302@.cycu.edu.tw</td>
        </tr>
      </table>
    </div>
  </div>
  

  
</main>
</body>
</div></b>

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