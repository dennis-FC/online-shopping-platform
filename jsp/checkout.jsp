<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>購物車結帳</title>
	<link rel="stylesheet" type="text/css" href="../css/index.css">
	<script type="text/javascript">
     function submitBtnClick()
     {	 
	  document.fileForm.submit();
     }
    </script>
	<script type="text/javascript">

    function datacheck()
    {
      if (pay_information.name.value=="")
      {
        window.alert("收件人不得為空白！");
        focusto(0);
        return false;
      }
       if (pay_information.add.value=="")
      {
        window.alert("收件地址不得為空白！");
        focusto(1);
        return false;
      }
	  if(pay_information.tel.value!=pay_information.tel.value*1)
	  {
		  window.alert("電話請輸入數字!");
		  focusto(2);
		  return false;
	  }	  
	  if(pay_information.email.value.indexOf('@')==-1)
	  {
		  window.alert("請輸入正確email!");
		  focusto(3);
		  return false;
	  }
	  if (pay_information.tel.value=="")
      {
        window.alert("會員電話不得為空白！");
        focusto(4);
        return false;
      }
	  if (pay_information.email.value=="")
      {
        window.alert("會員信箱不得為空白！");
        focusto(5);
        return false;
      }
	pay_information.submit();
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
         String url="jdbc:mysql://localhost/mysql?useUnicode=true&characterEncoding=UTF-8";
         Connection con=DriverManager.getConnection(url,"root","1234");
		 if(con.isClosed())
			 out.print("連線建立失敗");
		 else
		  {
	         con.createStatement().execute("use jsp_project");
			 String sql="SELECT * FROM car WHERE buyer_id='"+session.getAttribute("username")+"'";
			 ResultSet rs=con.createStatement().executeQuery(sql);
			 ResultSet rs2=con.createStatement().executeQuery(sql); 
			 ResultSet rs3=con.createStatement().executeQuery(sql); 
			 rs2.last();
			 int total_row=rs2.getRow();
			 int count=0;
			 if(session.getAttribute("username")==null)
					out.println("<br><br><br><div style='text-align:center;'><h1>您尚未登入，<a href='vip_in.jsp'>按此</a>進入登入頁面</h1></div>");
			 else 
			 { 
      		   if(total_row!=0){
		       count++;
			   %>
			   
			   	<br><center><font size="6" color="#104E8B"><b>商品選擇</font></center>
				
			   
			    <br><center><table style="border:5px #4876FF groove" cellpadding="10" border='0' align="center"></center>
                <tr align="center" height="5">
				<td width="50"><br><b><font size="5" color="#104E8B">No<hr color="#3A5FCD"></td>
				<td width="100"><br><b><font size="5" color="#104E8B">商品圖<hr color="#3A5FCD"></td>
				<td width="200"><br><b><font size="5" color="#104E8B">商品名<hr color="#3A5FCD"></td>
				<td width="50"><br><b><font size="5" color="#104E8B">單價<hr color="#3A5FCD"></td>
				<td width="50"><br><b><font size="5" color="#104E8B">數量<hr color="#3A5FCD"></td>
				<td width="50"><br><b><font size="5" color="#104E8B">價格<hr color="#3A5FCD"></td>


		        <%
				while(rs3.next())
				{
				  	String sql2="UPDATE car SET product_number='"+request.getParameter("product_number"+rs3.getString(1))+"', product_price='"+request.getParameter("product_price"+rs3.getString(1))+"' WHERE car_no='"+rs3.getString(1)+"'";          
				    con.createStatement().executeUpdate(sql2);
				}
				rs=con.createStatement().executeQuery(sql);
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
				<td align="center"><h3><%=rs.getString(4)%></h3></td>
				<td><%=rs.getString(7)%></td>
				<%
				//String sql2="UPDATE car SET product_number='"+request.getParameter("product_number"+rs.getString(1))+"', product_price='"+request.getParameter("product_price"+rs.getString(1))+"' WHERE car_no='"+rs.getString(1)+"'";          
				//con.createStatement().executeUpdate(sql2); 
				%>
				<td><%=rs.getString(5)%></td>
				<td>$<%=rs.getString(6)%></td>
				</tr>
				<tr>
				<td colspan="6">     
				<font color="#6495ED"><b>-------------------------------------------------------------------------------------------------------------------------------------------------------------------</td></font>
				</tr>
				
			  
			   <% count++;}%>
			    <tr>
				<td  colspan="6" align="right"><font color="#104E8B"><h2>共<%out.println(count-1);%>件商品，總金額為:<%=request.getParameter("totaltotal")%>元 &nbsp </h2></font></td>
				</tr>				
				</table>
				
				<br><br><tr>
				<td colspan="6" align="center"><font size="6" color="#104E8B"><b>資料確認</font></td>
				</tr>
				
				<form name="pay_information" method="post" action="order.jsp" >
				<br><table style="border:5px #4876FF groove" cellpadding="10" border='0' align="center">
				
				<tr> 
				   <td><h3>&nbsp &nbsp &nbsp &nbsp 選擇配送方式:</h3></td>
				   <td><h3><input type="radio" name="howto" value="宅配到府">宅配到府<input type="radio" name="howto" value="7-11取貨" checked>7-11取貨</h3></td>
				</tr>
				<% 
				int i=Integer.parseInt(request.getParameter("totaltotal"));
				if(i>=5000)
				{ %>
				<tr>
				   <td><h3>&nbsp &nbsp &nbsp &nbsp 選擇優惠:</h3></td>
				   <td><h3><input type="radio" name="coupon" value="威秀電影票乙張" >威秀電影票乙張<input type="radio" name="coupon" value="抽獎券乙張">抽獎券乙張</h3></td>
				</tr>
				<%
				}
				%>
				<tr>
				   <td><h3>&nbsp &nbsp &nbsp &nbsp 付款方式:</h3></td>
				   <td><h3><input type="radio" name="pay" value="信用卡線上刷卡">信用卡線上刷卡<input type="radio" name="pay" value="7-11取貨付現" checked>7-11取貨付現/到府取貨付現</h3></td>
				</tr>
				<tr>
				   <td><h3>&nbsp &nbsp &nbsp &nbsp 收件者:</h3></td>
				   <td><h3><input type="text" name="name" ></h3><font color="red" size=2>*必填&nbsp </font></td>
				</tr>
				<tr>
				   <td><h3>&nbsp &nbsp &nbsp &nbsp 收件地址:</h3></td>
				   <td><h3><input type="text" name="add" ><font color="red" font size="2">*如點選7-11取貨，請填7-11分店名&nbsp &nbsp &nbsp &nbsp </font><br><font color="red" size=2>*必填&nbsp </font></h3></td>
				</tr>
				<tr>
				   <td><h3>&nbsp &nbsp &nbsp &nbsp 電話:</h3></td>
				   <td><h3><input type="text" name="tel" ></h3><font color="red" size=2>*必填&nbsp </font></td>
				</tr>
				<tr>
				    <td><h3>&nbsp &nbsp &nbsp &nbsp Email:</h3></td>
					<td><h3><input type="email" name="email" ></h3><font color="red" size=2>*必填&nbsp </font></td>
				</tr>
				<tr>
					<td>
						<center><input type="button" value="回上一頁" style="width:120px;height:40px;font-size:20px;" onclick="location.href='car.jsp'"></center>
				    </td>
				    <input type="hidden" name="total" value="<%=i%>">
					<td  align="center"><input type="button"  style="width:180px;height:40px;font-size:20px;" value="確認，送出訂單" onclick="datacheck()"></td>

				</tr>
			    </table><br>
				</form></center>


                <%
			   }
			   
			 else out.println("<br><br><br><div style='text-align:center;'><h1>購物車中並無商品， <a href=index.jsp>點我</a>去購買商品!!</h1></div>");
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