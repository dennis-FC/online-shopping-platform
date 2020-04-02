<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Play Store 遊戲銷售-首頁</title>
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


<div class="marquee-background">
	<marquee behavior=scroll scrollamount="6"><font color="#CD0000" size="4em">Play Store遊戲銷售 全新開幕!!!&nbsp &nbsp &nbsp 滿5000元送抽獎券or電影票!!!
	&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Play Store遊戲銷售 全新開幕!!!&nbsp &nbsp &nbsp 滿5000元送抽獎券or電影票!!!
	&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Play Store遊戲銷售 全新開幕!!!&nbsp &nbsp &nbsp 滿5000元送抽獎券or電影票!!!</font></marquee>
</div> 

<div id="home" class="slideshow-container ">
        <script type='text/javascript' src='js/banner.js'></script>
        <div class="mySlides fade">
            <img src="../img/9.jpg" style="width:100%">
        </div>
        <div class="mySlides fade">
            <img src="../img/186.jpg" style="width:100%">
        </div>
        <div class="mySlides fade">
            <img src="../img/5.png" style="width:100%">
        </div>
    </div>
    <div style="text-align:center ">
        <span class="dot"></span>
        <span class="dot"></span>
        <span class="dot"></span>
    </div>
    <script>
    var slideIndex = 0;
    showSlides();

    function showSlides() {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) { slideIndex = 1 }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
        setTimeout(showSlides, 3000); // Change image every 2 seconds
    }
    </script>
    <!-- //banner -->
<p><p>
<div class="in">

<div class="in_space_1"><p></p></div>

	<div class="in_1">
		<br><center><a href="sword.jsp"><img src="../1000/A1.jpg" width="300" height="175"></a><br>
  <span class="x"><span style="color:blue;">仙劍奇俠傳</span></center>
	</div>

<div class="in_space_2"><p></p></div>

  <div class="in_2">
    <br><center><a href="castle.jsp"><img src="../2000/9.jpg" width="300" height="175"></a><br>
      <span class="x"><span style="color:blue;">惡靈古堡</span></center>
  </div>

<div class="in_space_3"><p></p></div>

  <div class="in_3">
    <br><center><a href="ass.jsp"><img src="../3000/8.png" width="300" height="175"></a><br>
      <span class="x"><span style="color:blue;">刺客教條</span></center>
  </div>

<div class="in_space_4"><p></p></div>
</div>

<div class="in_br"><span></span></div>

<div class="in">
  <div class="in_space_1"><p></p></div>

  <div class="in_1">
    <center><a href="dead.jsp"><img src="../4000/D1.jpg" width="300" height="175"></a><br>
      <span class="x"><span style="color:blue;">陰屍路</span></center>
  </div>

  <div class="in_space_2"><p></p></div>

  <div class="in_2">
    <center><a href="soilder.jsp"><img src="../5000/6.jpg" width="300" height="175"></a><br>
      <span class="x"><span style="color:blue;">古墓奇兵</span></center>
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
		    <%  		
        try {	        
            Class.forName("com.mysql.jdbc.Driver");	  
            try {           
                String url="jdbc:mysql://localhost/";
                Connection con=DriverManager.getConnection(url,"root","1234");   				
		        if(con.isClosed())
                    out.println("連線建立失敗");
                else
                    {	
                    con.createStatement().execute("use jsp_project");
                     String sql="SELECT* FROM counter ";
                    ResultSet rs=con.createStatement().executeQuery(sql);
                        if(rs.next())
                         {
							int count=Integer.parseInt(rs.getString(1));
                            if(session.isNew())
                            {
                             
                             count++;
                  
                             sql="UPDATE counter SET count='"+count+"'";
                             con.createStatement().executeUpdate(sql);
           
                             out.println("<br>累積瀏覽次數:"+count);
                            }
                            else
                            {
                                out.println("<br>累積瀏覽次數:"+count);

                            }                        
                         }	
                    
                    con.close();
                    }
                }              
            catch (SQLException sExec) {
                    out.println("SQL錯誤"+sExec.toString());
                }
            }
        catch (ClassNotFoundException err) {
            out.println("class錯誤"+err.toString());
        }
       %>

      </ul>
	</div>
 	<div class="foot_center">
      <p>Copyright© Play Store 遊戲銷售,2019
    </div>
</footer>


</body>
</html>