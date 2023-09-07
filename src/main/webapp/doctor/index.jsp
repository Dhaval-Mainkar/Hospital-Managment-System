<%@page import="com.entity.Doctor"%>
<%@page import="com.DB.DVConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../components/allcss.jsp" %>
<style>
  .container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }

  .card {
    width: 300px;
  }

  .card-body {
    text-align: center;
  }

  .fa-calendar-check {
    color: green;
  }

  .fs-3 {
    font-size: 24px;
  }

  .fs-4 {
    font-size: 20px;
  }

  .text-center {
    text-align: center;
  }

  .text-success {
    color: green;
  }
</style>
</head>
<body>
<%
Doctor d=(Doctor)session.getAttribute("doctObj");
DoctorDao dao=new DoctorDao(DVConnect.getConn()); 
%>
	<%@include file="navbar.jsp"%>
  <div class="container">
    <div class="card paint-card">
      <div class="card-body text-center text-success">
        <i class="far fa-calendar-check fa-3x"></i><br>
        <p class="fs-4 text-center">
          Total Appointment <br><%=dao.countAppointmentByDocotrId(d.getId())%>
        </p>
      </div>
    </div>
  </div>
</body>
</html>
