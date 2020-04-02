<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>會員專區</title>
	<link rel="stylesheet" type="text/css" href="../css/index.css">
	<script type="text/javascript">
    function datacheck()
    {
	<%
	  String url="jdbc:mysql://localhost/mysql?useUnicode=true&characterEncoding=UTF-8";
      Connection con=DriverManager.getConnection(url,"root","1234");
	  con.createStatement().execute("use jsp_project");
	  String sql="SELECT * FROM product ";
	  ResultSet rs=con.createStatement().executeQuery(sql);
	  while(rs.next()){
	  
	%>
	
      if (product.product_name<%=rs.getString(1)%>.value=="")
      {
        window.alert("商品名不得為空白！");
        focusto(0);
        return false;
      }
       if (product.product_note<%=rs.getString(1)%>.value=="")
      {
        window.alert("商品資訊不得為空白！");
        focusto(1);
        return false;
      }
	  if(product.product_price<%=rs.getString(1)%>.value!=product.product_price<%=rs.getString(1)%>.value*1)
	  {
	    window.alert("價格請輸入數字！");
        focusto(2);
        return false;
	  }
	  if(product.product_left<%=rs.getString(1)%>.value!=product.product_left<%=rs.getString(1)%>.value*1)
	  {
		  window.alert("庫存請輸入數字!");
		  focusto(3);
		  return false;
	  }	
	  <%}%>  
	product.submit();
    }
    function focusto(x) 
	{ 
      user.forms[0].elements[x].focus();
    }
	
	</script>
	  
	
	<script type="text/javascript">

    function datacheck2()
    {
      if (product2.product_name.value=="")
      {
        window.alert("商品名不得為空白！");
        focusto(0);
        return false;
      }
       if (product2.product_note.value=="")
      {
        window.alert("商品資訊不得為空白！");
        focusto(1);
        return false;
      }
	  if(product2.product_price.value!=product2.product_price.value*1)
	  {
	    window.alert("價格請輸入數字！");
        focusto(2);
        return false;
	  }
	  if(product2.product_left.value!=product2.product_left.value*1)
	  {
		  window.alert("庫存請輸入數字!");
		  focusto(3);
		  return false;
	  }	  
	product2.submit();
    }
    function focusto(x) 
	{ 
      user.forms[0].elements[x].focus();
    }
	</script>
	

</head>

<body background="../img/125.jpg" style="background-repeat:no-repeat;background-attachment:fixed;background-position:center center;background-size: cover">

<header>
	<center><img src="../img/logo.jpg" class="hd_img"></center>
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

<%

try{
     Class.forName("com.mysql.jdbc.Driver");
	 try{

		 if(con.isClosed())
			 out.print("連線建立失敗");
		 else
		  {
			  ResultSet rs2=con.createStatement().executeQuery(sql);
			  

			 %>
			    <form action="change_product2.jsp" method="post" name="product">
			 	<table align="center" width="70%" border="1">
				<tr>
				  <td colspan="8"><h2>修改已上架商品</h2></td>
				</tr>
				
                <tr align="center">
				  <td width="100">商品圖</td>
				  <td width="25">商品名</td>
				  <td width="50">商品資訊</td>
				  <td width="25">價格</td>
				  <td width="25">庫存</td>
				  <td width="100">商品右邊資訊</td>
				  <td width="100">商品下方資訊</td>
				  <td width="50">操作</td>
				</tr>
			 
			 
			 <%while(rs2.next())
			 {
				String A="A",B="B",C="C",D="D",E="E";
				String folder=rs2.getString(1);
				String folder2=rs2.getString(1);
				if(folder.length()==2)folder=folder.substring(0,folder.length()-1);
				else folder=folder.substring(0,folder.length()-2);
			    
				if(folder.equals(A)) folder="1000";
				else if(folder.equals(B)) folder="2000";
				else if(folder.equals(C)) folder="3000";
				else if(folder.equals(D)) folder="4000";
				else if(folder.equals(E)) folder="5000";

				%> 
				<tr>
				<td align="center"><img src="../<%=folder%>/<%=folder2%>.jpg" width="100" height="100"></td>
				<td><input type="text" name="product_name<%=rs2.getString(1)%>" value="<%=rs2.getString(2)%>"></td>
				<td><textarea rows=3 name="product_note<%=rs2.getString(1)%>" style=" resize:none;"><%=rs2.getString(3)%></textarea></td>
				<td><input type="text" name="product_price<%=rs2.getString(1)%>" value="<%=rs2.getString(4)%>"></td>
				<td ><input type="text" name="product_left<%=rs2.getString(1)%>" value="<%=rs2.getString(5)%>"></td>
				<td><textarea rows=3 name="product_rightnote<%=rs2.getString(1)%>" style=" resize:none;"><%=rs2.getString(6)%></textarea></td>
				<td><textarea rows=3 name="product_downnote<%=rs2.getString(1)%>" style=" resize:none;"><%=rs2.getString(7)%></textarea></td>
				<td>
			    <input type="hidden" name="product" value="<%=rs2.getString(1)%>">
			    <input type="button"  onclick="datacheck()" value="確定修改"></button><br>
			    </td>
				</tr>

            <%}%>
			 </table>
			 </form>
			 <%
			 sql="SELECT * FROM wait_product";
			 ResultSet rss=con.createStatement().executeQuery(sql);
			 %>
			 <form action="change_product2.jsp" method="post" name="product2">
			 <table align="center" width="70%" border="1">
				<tr>
				  <td colspan="8"><h2>修改未上架商品</h2></td>
				</tr>
				
                <tr align="center">
				  <td width="100">商品圖</td>
				  <td width="25">商品名</td>
				  <td width="50">商品資訊</td>
				  <td width="25">價格</td>
				  <td width="25">庫存</td>
				  <td width="100">商品右邊資訊</td>
				  <td width="100">商品下方資訊</td>
				  <td width="50">操作</td>
				</tr>

			 
			 <%while(rss.next())
			 {
				String A="A",B="B",C="C",D="D",E="E";
				String folder=rss.getString(1);
				String folder2=rss.getString(1);
				if(folder.length()==2)folder=folder.substring(0,folder.length()-1);
				else folder=folder.substring(0,folder.length()-2);
			    
				if(folder.equals(A)) folder="1000";
				else if(folder.equals(B)) folder="2000";
				else if(folder.equals(C)) folder="3000";
				else if(folder.equals(D)) folder="4000";
				else if(folder.equals(E)) folder="5000";

				%> 
				
			  	<tr>
				<td align="center"><img src="../<%=folder%>/<%=folder2%>.jpg" width="100" height="100"></td>
				<td><input type="text" name="product_name" value="<%=rss.getString(2)%>"></td>
				<td><textarea rows=3 name="product_note" style=" resize:none;"><%=rss.getString(3)%></textarea></td>
				<td><input type="text" name="product_price" value="<%=rss.getString(4)%>"></td>
				<td ><input type="text" name="product_left" value="<%=rss.getString(5)%>"></td>
				<td><textarea rows=3 name="product_rightnote" style=" resize:none;"><%=rss.getString(6)%></textarea></td>
				<td><textarea rows=3 name="product_downnote" style=" resize:none;"><%=rss.getString(7)%></textarea></td>
				<td>
				
			    <input type="hidden" name="product" value="<%=rss.getString(1)%>">
			    <input type="button" id="submitBtn" onclick="datacheck2()" value="確定修改"></button><br>
			    </td>
				</tr>

            <%}%>
			 </table>
			 </form>
			 
			 
			 
			 
			 
			 
			 
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


<div class="in_br"><span></span></div>
<footer>
	<div class="foot_left">
      <center><img src="../img/76.jpg" width="500" height="300"></center>
    </div>

    <div class="foot_right">
      <ul>
      	<li class="foot_word">網站名稱:play store</li>
      	<li class="foot_word">連絡電話:09-11111111</li>
      	<li class="foot_word">地址:桃園市中壢區中北路200號</li>
		<li class="foot_word">信箱:s10624302@.cycu.edu.tw</li>
		
      	<li></li>
      	<li></li>
      </ul>
    </div>
</footer>
</body>
</html>