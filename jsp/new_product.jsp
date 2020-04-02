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
	   <script type="text/javascript">
	 
	 
    function datacheck()
    {
      if (user.product_name.value=="")
      {
        window.alert("商品名稱不得為空白！");
        focusto(0);
        return false;
      }
      if (user.product_note.value=="")
      {
        window.alert("商品資訊不得為空白！");
        focusto(1);
        return false;
      }

      if (user.product_price.value!=user.product_price.value*1)
      {
        window.alert("商品價格請輸入數字！");
        focusto(2);
        return false;
      }
	  if (user.product_price.value=="")
      {
        window.alert("商品價格不得為空白！");
        focusto(3);
        return false;
      }

	  if(user.product_left.value!=user.product_left.value*1)
	  {
	    window.alert("商品庫存請輸入數字！");
        focusto(4);
        return false;
	  }
	  
	  if(user.product_left.value=="")
	  {
	    window.alert("商品庫存不得為空白！");
        focusto(4);
        return false;
	  }

      user.submit();
    }
    function focusto(x) 
	{ 
      user.forms[0].elements[x].focus();
    }
</script>	
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


	

	<div>
		<p><form name="user" method="post" action="new_product2.jsp">
			<center><font size="6" color="#4876FF"><b>【新增商品至待上架區】</font></center>
			<br><center><table style="border:5px #4876FF groove" cellpadding="10" border='0' align="center" ></center>
		
				<tr>
					<td>&nbsp商品主題 :&nbsp;</td>
					<td>
					<input type="radio" name="product_topic" value="A" checked>仙劍奇俠傳<br>
					<input type="radio" name="product_topic" value="B">惡靈古堡<br>
					<input type="radio" name="product_topic" value="C">刺客教條<br>
					<input type="radio" name="product_topic" value="D">陰屍路<br>
					<input type="radio" name="product_topic" value="E">古墓奇兵<br>
					</td>
				</tr>
				<tr>
					<td>&nbsp商品名稱 :&nbsp;</td>
					<td>
					<input type="text" name="product_name"><font color="red" size=2>*必填&nbsp &nbsp </font>
					</td>
				</tr>
				<tr>
					<td>&nbsp商品資訊 :&nbsp;</td>
					<td>
					<textarea rows=5 name="product_note"></textarea><font color="red" size=2>*必填&nbsp &nbsp </font>
					</td>
				</tr>
				<tr>
					<td>&nbsp商品價格 :&nbsp;</td>
					<td>
					<input type="text" name="product_price"><font color="red" size=2>*必填&nbsp &nbsp </font>
					</td>
				</tr>
				<tr>
					<td>&nbsp商品庫存 :&nbsp;</td>
					<td>
					<input type="text" name="product_left"><font color="red" size=2>*必填&nbsp &nbsp </font>
					</td>
				</tr>
				<tr>
					<td>&nbsp商品內部右邊資訊 :&nbsp;</td>
					<td>
					<textarea rows=5 name="product_rightnote"></textarea>
					</td>
				</tr>
				<tr>
					<td>&nbsp商品內部下方資訊 :&nbsp;</td>
					<td>
					<textarea rows=5 name="product_downnote"></textarea> &nbsp
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="reset" value="重新填寫" class="btn2">
					<input type="button" value="確認送出" class="btn2" onclick="datacheck()">
					</td>

				</tr>
			</table></b><br>
		</form><p>


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