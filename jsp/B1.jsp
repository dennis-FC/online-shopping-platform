<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
     function submitBtnClick()
     {
	  document.fileForm.submit();
     }
	 
	 function zero(value)
	{
		if(value='1')
		{
		 	window.alert("沒有庫存");
            focusto(0);
            return false;
		}
       
	}
	function check()
	{
		if (view.subject.value=="")
      {
        window.alert("留言主題不得為空白！");
        focusto(1);
        return false;
      }
	  if (view.content.value=="")
      {
        window.alert("留言內容不得為空白！");
        focusto(2);
        return false;
      }
	  view.submit();
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
			 String sql2="use jsp_project";
			 String product=request.getParameter("which_product");
             con.createStatement().execute(sql);
			 out.println(product);
			 
			 sql="SELECT* FROM product WHERE product_id ='"+product+"'";
			 sql2="SELECT* FROM product WHERE product_id ='"+product+"'";
			 ResultSet rs=con.createStatement().executeQuery(sql);
			 ResultSet rs2=con.createStatement().executeQuery(sql2);
			 %>
             <div>
	         <center><img src="../2000/9.jpg" class="ban_60_img"></center><br>
             </div>

			 <div class="in">
             <div class="in_space_11"><p></p></div><p>
			 <%
			 if(rs.next()){%>
             <div class="in_left">
             <center><img src="../2000/<%=product%>.jpg" class="imghover"><br>
             <span><span class="x"><span style="color:blue;"><%=rs.getString(2)%></span></center>
             </div>
             <div class="in_space_12"><p></p></div>

			 <div class="in_right">
			 <center><span class="w"><span style="color:blue;"><%=rs.getString(2)%></span><br></center>
			 <span class="u"><%=rs.getString(6)%></span><br>
			 <span class="w">售價:<%=rs.getString(4)%></span><br>
			 <span class="w">庫存:<%=rs.getString(5)%>套</span><br>
			 <form action="addto_car.jsp" method="post">
			 <input type="hidden" name="whichproduct_car" value="<%=rs.getString(1)%>">
			 <%
			 if(Integer.parseInt(rs.getString(5))==0)
				 out.println("<input type=button onclick=zero(1) style=background-color:#FFFF78 value=目前沒有庫存>");
			 else
				 out.println("<button id=submitBtn onclick=submitBtnClick() style=background-color:#FFFF78 >加入購物車</button><br>");
			 %>
			 </form>
			 </div>

			 <div class="in_space_13"><p></p></div>
			 </div>

			 <div class="in_br"><span></span></div>

			 <div class="contect">
			 <span class="u"><%=rs.getString(7)%></span><br>
              </div>
			  <center>     
			  <img src="../2000/1/<%=product%>-1.jpg" class="imghover"></a><p><br>
			  <img src="../2000/1/<%=product%>-2.jpg" class="imghover"></a><p><br>
			  <img src="../2000/1/<%=product%>-3.jpg" class="imghover"></a><p>
			  </center>
		      <div class="in_br"><span></span></div>
			  
			  <div class="contect2">
			  <%
			  out.println("<br><center><font size='6' color='#4169E1'><b>《留言板》</font></center>");
			  out.println("<center>");
			  sql="SELECT * FROM view WHERE view_product='"+product+"'" ;
			  rs=con.createStatement().executeQuery(sql);
			  rs.last();
			  int total_content=rs.getRow();
			  out.println("<font size='4'>共"+total_content+"筆留言</font><p>");
			  int page_num=(int)Math.ceil((double)total_content/5.0);
			  if(page_num==0) page_num=1;
			  out.println("<font size='4'>請選擇頁數</font>");
			  
			  
			  for(int i=1;i<=page_num;i++)
			  {
		        out.println("<form action=A1.jsp?page="+i+" method=post style=display:inline>");
			    out.println("<input type=hidden name=which_product value="+product+">");
			    out.println("<button id=submitBtn onclick=submitBtnClick()>"+i+"</button>");
			    out.print("</form>");
				
			  } 
			  

			  String page_string=request.getParameter("page");
			  if(page_string==null) page_string="1";
			  Integer current_page=Integer.valueOf(page_string);
			  out.println("<font size='4'>共"+page_num+"頁，目前在第"+page_string+"頁</font>");
			  out.println("<p>");
			  
			  int start_record=(current_page-1)*5;
			  sql="SELECT * FROM view WHERE view_product='"+product+"' ORDER BY view_no DESC LIMIT ";
			  sql+=start_record+",5";
			  rs=con.createStatement().executeQuery(sql);
			  out.println("</center>");
			  
			  out.println("<hr>");
			  while(rs.next())
			  {
				  out.println("<font size='5' color='#104E8B'>留言主題:"+rs.getString(3)+"<br></font>");
				  out.println("<font size='4'>會員帳號:"+rs.getString(2)+"<br></font>");
				  out.println("<font size='4'>評價:<font color='#ea0000'>"+rs.getString(7)+"</font>分<br></font>");
				  out.println("<font size='4'>留言內容:"+rs.getString(4)+"<br></font>");
				  out.println("<font size='4'>留言時間:"+rs.getString(5)+"<br></font><hr>");
			  }

			  %>
			  <%
			  	if(session.getAttribute("username")==null)
					out.println("<h3>您尚未登入!!因此不得留言，<a href='vip_in.jsp'>按此</a>進入登入頁面</h3><br>");
				else
				{%>
			        <%if(rs2.next()){%>
					
					<form method="post" action="add.jsp" name="view">
					<font size="4">留言主題:<input type="text" name="subject"><br>
					會員帳號:<input type="text" name="username" value=<%=session.getAttribute("username")%> readonly="username"><br>
					商品評價:<select name="score" size="1">
					<option selected>10
					<option>9
					<option>8
					<option>7
					<option>6
					<option>5
					<option>4
					<option>3
					<option>2
					<option>1
					</select>分<br>
					留言內容:<br>
					<textarea rows=5 name="content"></textarea><br>
					<input type="button" name="Submit" value="送出" onclick="check()">
					<input type="reset" name="Reset" value="重新填寫"></font>
					<input type="hidden" name="which_product" value="<%=rs2.getString(1)%>">
					</form><br>
					<%}%>
					
					
				<%}	%>

			   	
				
			  
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

%></b>
</div>
</div>
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