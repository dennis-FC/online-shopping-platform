<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@page contentType="text/html; charset=utf-8" language="java"%>
<%@page pageEncoding="utf-8"%>
<%@page import="java.sql.*, java.util.*"%>
<% //request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>新增留言</title>
<%!  
String newline(String str)
{
	int index=0;
	while((index=str.indexOf("\n"))!=-1)
	  str=str.substring(0,index)+"<br>"+str.substring(index+1);
	return (str);
}	
%>	
<script type="text/javascript">
function submitBtnClick()
{
	document.fileForm.submit();
}
</script>
	<meta charset="utf-8">
	<title>sword</title>
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
			 String product=request.getParameter("which_product");
			 String product2=product;
			 String sql="use jsp_project";
			 con.createStatement().execute(sql);
			 
			 String a=request.getParameter("subject");
			 String new_subject=new String(a.getBytes("ISO-8859-1"),"utf-8");
			 String new_name=request.getParameter("username");
			 String new_score=request.getParameter("score");
			 String new_content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"utf-8");
			 new_content=newline(new_content);
			 java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
			 String new_whichproduct=request.getParameter("which_product");
			 
			 
			 sql="insert view (view_memberid,view_subject,view_content,view_putdate,view_product,view_score)";
			 sql+="value('"+new_name+"',";
			 sql+="'"+new_subject+"',";
			 sql+="'"+new_content+"',";
			 sql+="'"+new_date+"',";
			 sql+="'"+new_whichproduct+"',";
			 sql+="'"+new_score+"')";
			 con.createStatement().execute(sql);
			 
			 
			 String change_name=product2.substring(0,product2.length()-1);
			 change_name=change_name+"1";
			 %>
			 
			 <form action="<%=change_name%>.jsp?page=1" method="post" >
			 <input type="hidden" name="which_product" value="<%=product%>">
			 <br><br><br><div style='text-align:center;'><h1>填寫留言成功<button id="submitBtn" onclick="submitBtnClick()">按我觀看留言</button></h1></div><br>
			 <%
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
			 %>
             </form>
			 <%

			 con.close();
			 
		    }
	     }
		 catch(SQLException sExec)
		 {
			 out.print("SQL 錯誤"+sExec.toString());
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
			 
			 
			 