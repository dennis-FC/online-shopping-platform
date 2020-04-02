<%@page contentType="test/html; charset=utf-8"%>
<%@page import="java.sql.*"%>
<%@page pageEncoding="utf-8"%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="use project";
con.createStatement().execute(sql);
%>