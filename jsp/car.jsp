<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    
	<meta charset="UTF-8">
	<title>購物車</title>
	<link rel="stylesheet" type="text/css" href="../css/index.css">
	<script type="text/javascript">
     function submitBtnClick()
     {	 
	  document.fileForm.submit();
     }
	 </script>
	<%
	String url="jdbc:mysql://localhost/";
	Connection con=DriverManager.getConnection(url,"root","1234");
	con.createStatement().execute("use jsp_project");
	String sql="SELECT * FROM car WHERE buyer_id='"+session.getAttribute("username")+"'";
	ResultSet rs=con.createStatement().executeQuery(sql);
	while(rs.next()){
	%>
	<script type="text/javascript">
	 function add<%=rs.getString(1)%>()
	 {   
		 var num1=parseInt(document.getElementById('num<%=rs.getString(1)%>').value);
		 var num2=parseInt(document.getElementById('price<%=rs.getString(1)%>').value);
		 var value=num1*num2;
		 document.getElementById('price<%=rs.getString(1)%>1').value=value;
		 <% ResultSet rss=con.createStatement().executeQuery(sql);%>
		 var total=
		 <% while(rss.next()){%>
         parseInt(document.getElementById('price<%=rss.getString(1)%>1').value)+
	     <%}%>0;
		 document.getElementById('total').value=total;

		 
	 }	 
    </script>
    <%}%>
					 
	<%ResultSet rsss=con.createStatement().executeQuery(sql);%>
	
	<script type="text/javascript">
	function checkout()
	{
		
		<%while(rsss.next()){%>
		document.getElementById('product_number<%=rsss.getString(1)%>').value=document.getElementById('num<%=rsss.getString(1)%>').value;
		document.getElementById('product_price<%=rsss.getString(1)%>').value=document.getElementById('price<%=rsss.getString(1)%>1').value;

		<%}%>
		document.getElementById('total2').value=document.getElementById('total').value;
		document.fileForm.submit();
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
        url="jdbc:mysql://localhost/";
        con=DriverManager.getConnection(url,"root","1234");
		if(con.isClosed())
			out.print("連線建立失敗");
		else
		{
	        con.createStatement().execute("use jsp_project");
			sql="SELECT * FROM car WHERE buyer_id='"+session.getAttribute("username")+"'";
			rs=con.createStatement().executeQuery(sql);
			ResultSet rs2=con.createStatement().executeQuery(sql);
			rs2.last();
			int total_row=rs2.getRow();
			int count=0;
			if(session.getAttribute("username")==null)
			{
				out.println("<br><br><br><div style='text-align:center;'><h1>您尚未登入，<a href='vip_in.jsp'>按此</a>進入登入頁面</h1></div><br>");
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
			else 
			{ 
      		   if(total_row!=0){
		       count++;
			   %>
				<br><center><font size="6" color="#4876FF"><b>【購物車】</font></center>
			    <br><center><table style="border:5px #4876FF groove" cellpadding="10" border='0' align="center"></center>
                <tr align="center" height="5">
				<td width="50"><br><b><font size="5" color="#104E8B">No<hr color="#3A5FCD"></td>
				<td width="100"><br><b><font size="5" color="#104E8B">商品圖<hr color="#3A5FCD"></td>
				<td width="200"><br><b><font size="5" color="#104E8B">商品名<hr color="#3A5FCD"></td>
				<td width="50"><br><b><font size="5" color="#104E8B">單價<hr color="#3A5FCD"></td>
				<td width="50"><br><b><font size="5" color="#104E8B">庫存<hr color="#3A5FCD"></td>
				<td width="50"><br><b><font size="5" color="#104E8B">數量<hr color="#3A5FCD"></td>
				<td width="50"><br><b><font size="5" color="#104E8B">價格<hr color="#3A5FCD"></td>
				<td width="50"><br><b><font size="5" color="#104E8B">移除<hr color="#3A5FCD"></td>

		   
		        <%
		       while(rs.next())
			   { 
		        
				String A="A",B="B",C="C",D="D",E="E";
				String folder=rs.getString(3);
				String folder2=rs.getString(3);
			    folder=folder.substring(0,folder.length()-1);
				if(folder.equals(A)) folder="1000";
				else if(folder.equals(B)) folder="2000";
				else if(folder.equals(C)) folder="3000";
				else if(folder.equals(D)) folder="4000";
				else if(folder.equals(E)) folder="5000";
				

 
				%> 

				
		
				<tr align="center">
				<td><%=count%></td>
				<td align="center"><img src="../<%=folder%>/<%=folder2%>.jpg" width="100" height="100"></td>
				<td align=center><h3><%=rs.getString(4)%></h3></td>
				<td>$<input type="text" id="price<%=rs.getString(1)%>" value="<%=rs.getString(6)%>" size="2"readonly></td>
				<td><%=rs.getString(8)%></td>
				<td ><input type="number" id="num<%=rs.getString(1)%>" name="points" min="1" max="<%=rs.getString(8)%>" value="<%=rs.getString(5)%>" onchange="add<%=rs.getString(1)%>()" onkeydown="if(event.keyCode==13)add()"></td>
				<td>$<input type="text" id="price<%=rs.getString(1)%>1" name="price" value="<%=rs.getString(6)%>" size="2"  onchange="total()"  size="5" readonly ></td>
				<td>
				<form action="remove_choose_car.jsp" method="post">
			    <input type="hidden" name="car_no" value="<%=rs.getString(1)%>">
			    <button id="submitBtn" onclick="submitBtnClick()"><img src="../img/icon_remove.png"></button><br>
			    </form></td>
				</tr>
				<tr>
				<td colspan="8">     
				<font color="#6495ED"><b>----------------------------------------------------------------------------------------------------------------------------------------------------------------</td></font>
				</tr>
			  
			   <% count++;}
			   String sql2="SELECT SUM(product_price) FROM car WHERE buyer_id='"+session.getAttribute("username")+"'";
			   ResultSet rs3=con.createStatement().executeQuery(sql2);
			   String total="";
			   if(rs3.next()) total=rs3.getString(1);
			   
			   
				   
			   
			   
			   
			   %>
			    <tr align="right">
				<td colspan="8">
				<font size="5" color="#104E8B"><b>商品總金額為:<input type="text" id="total" value=<%=total%> size="5" readonly> &nbsp &nbsp
				</td>
				</tr>
				
			    <tr align="center">
			      <td colspan="3">
				    <input type="button" value="繼續購物" style="width:120px;height:40px;font-size:20px;" onclick="location.href='index.jsp'">
				  </td>
				  
				  <td colspan="5">
					<form action="checkout.jsp" method="post" name="check">
				    <%ResultSet rsfinal=con.createStatement().executeQuery(sql);
				    while(rsfinal.next()){ %>
				  
                    <input type="hidden" name='product_number<%=rsfinal.getString(1)%>' id='product_number<%=rsfinal.getString(1)%>' value='<%=rsfinal.getString(5)%>'>
				    <input type="hidden" name='product_price<%=rsfinal.getString(1)%>' id='product_price<%=rsfinal.getString(1)%>' value='<%=rsfinal.getString(6)%>'>
				   
					<%}%>
					<input type="hidden" name='totaltotal' id='total2' value='0'>
				    <button id="submitBtn" onclick="checkout()" style="width:120px;height:40px;font-size:20px;">結帳</button><br>
				   
				    </form>
				  </td>
				  
			    </tr>

			   </table><br>
			   
                <%
			   }
			   
			else 
			{
				 out.println("<br><br><div style='text-align:center;'><h1>購物車中並無商品， <a href=index.jsp>點我</a>去購買商品!!</h1></div><br><br>");
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


</html>
