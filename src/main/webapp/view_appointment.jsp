<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DVConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/allcss.jsp"%>
<style type="text/css">
  body {
    background: url("img/hospital.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    height: 100vh;
    margin: 0;
    padding: 0;
  }

  .navbar {
    width: 100%;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 999;
  }

  .paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
    max-width: 800px; /* Adjust the maximum width of the card */
    margin: auto;
    padding: 20px;
    margin-top: 80px; /* Adjust the margin-top value to create space between navbar and table */
  }
</style>
</head>
<body>
  <div class="navbar">
    <%@include file="components/navbar.jsp"%>
  </div>

  <div class="container-fluid d-flex align-items-center justify-content-center vh-100">
    <div class="card paint-card">
      <div class="card-body">
        <p class="fs-4 fw-bold text-center text-success">Appointment List</p>
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Full Name</th>
                <th scope="col">Gender</th>
                <th scope="col">Age</th>
                <th scope="col">Appointment Date</th>
                <th scope="col">Diseases</th>
                <th scope="col">Doctor Name</th>
                <th scope="col">Status</th>
              </tr>
            </thead>
            <tbody>
              <%
              User user = (User) session.getAttribute("userObj");
              AppointmentDAO dao = new AppointmentDAO(DVConnect.getConn());
              DoctorDao dao2 = new DoctorDao(DVConnect.getConn());
              List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
              for (Appointment ap : list) {
                Doctor d = dao2.getDoctorById(ap.getDoctorId());
              %>
              <tr>
                <th><%=ap.getFullName()%></th>
                <td><%=ap.getGender()%></td>
                <td><%=ap.getAge()%></td>
                <td><%=ap.getAppoinDate()%></td>
                <td><%=ap.getDiseases()%></td>
                <td><%=d.getFullName()%></td>
                <td>
                  <%
                  if ("Pending".equals(ap.getStatus())) {
                  %>
                  <a href="#" class="btn btn-sm btn-warning">Pending</a>
                  <%
                  } else {
                  %>
                  <%=ap.getStatus()%>
                  <%
                  }
                  %>
                </td>
              </tr>
              <%
              }
              %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
