<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>修改商品</title>
	<link rel="stylesheet" type="text/css" href="../css/index.css">
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
	  if(user.product_price.value!=user.product_price.value*1)
	  {
	    window.alert("價格請輸入數字！");
        focusto(2);
        return false;
	  }
	  if(user.product_price.value=="")
	  {
	    window.alert("價格不得為空白！");
        focusto(3);
        return false;
	  }
	  if(user.product_left.value!=user.product_left.value*1)
	  {
		  window.alert("庫存請輸入數字!");
		  focusto(4);
		  return false;
	  }	  
	  if(user.product_left.value=="")
	  {
		  window.alert("庫存不得為空白!");
		  focusto(5);
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
<center><font size="6" color="#4876FF"><b>【修改商品】</b></font></center>	
<%

try{
	Class.forName("com.mysql.jdbc.Driver");
	try{
		String url="jdbc:mysql://localhost/mysql?useUnicode=true&characterEncoding=UTF-8";
		Connection con=DriverManager.getConnection(url,"root","1234");
		if(con.isClosed())
			out.println("連線建立失敗");
		else
		{
			String hide="";
			String which="";
			String sql="use jsp_project";
			con.createStatement().execute(sql);
			String choose=request.getParameter("choose");
			String choose2=request.getParameter("choose2");
			if(request.getParameter("on").equals("1")) 
			{
				sql="SELECT * FROM product WHERE product_id='"+choose+"'";	
				hide="ON";
				which=choose;
			}
			else
			{				
				sql="SELECT * FROM wait_product WHERE product_id='"+choose2+"'";
				hide="DOWN";
				which=choose2;
			}
			ResultSet rs=con.createStatement().executeQuery(sql);

			if(rs.next())
			%>
				
				<form name="user" method="post" action="change_productfn.jsp">
			    <br><center><table style="border:5px #46a3ff dotted" cellpadding="10" border='0' align="center" ></center>
				<tr>
					<td>&nbsp商品名稱 :&nbsp</td>
					<td>
					<input type="text"  name="product_name" value="<%=rs.getString(2)%>"><font color="red" size=2>*必填&nbsp &nbsp </font>
					</td>
				</tr>
				<tr>
					<td>&nbsp商品資訊 :&nbsp</td>
					<td>
					<textarea rows="5" name="product_note" ><%=rs.getString(3)%></textarea><font color="red" size=2>*必填&nbsp &nbsp </font>
					</td>
				</tr>
				<tr>
					<td>&nbsp價格:&nbsp</td>
					<td>
					<input type="text" name="product_price" value="<%=rs.getString(4)%>"><font color="red" size=2>*必填&nbsp &nbsp </font>
					</td>
				</tr>
				<tr>
					<td>&nbsp庫存 :&nbsp</td>
					<td>
					<input type="text" name="product_left" value="<%=rs.getString(5)%>"><font color="red" size=2>*必填&nbsp &nbsp </font>
					</td>
				</tr>
				<tr>
					<td>&nbsp商品右邊資訊 :&nbsp</td>
					<td>
					<textarea rows="5" name="product_rightnote" ><%=rs.getString(6)%></textarea>
					</td>
				</tr>
				<tr>
					<td>&nbsp商品下方資訊 :&nbsp</td>
					<td>
					<textarea rows="5" name="product_downnote" ><%=rs.getString(7)%></textarea>
					</td>
				</tr>
				<tr>
				    <input type="hidden" name="hide" value=<%=hide%> >
					<input type="hidden" name="which" value=<%=which%> >
					<td colspan="2" align="center"><input type="reset" value="重新填寫" class="btn2">
					<input type="button" value="確認送出" class="btn2" onclick="datacheck()"></td>

				</tr>
			   </table><br>
		       </form><p>
				

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