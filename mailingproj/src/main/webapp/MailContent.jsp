<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="mail.DBContent" %>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@page import="java.sql.Connection"%>
<%@page  import="java.sql.ResultSet"%>
<%@page import ="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
    <title>Mail Details</title>
    <style>
       body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    margin: 20px;
}

h1 {
    margin-bottom: 20px;
}

h2 {
    color: #007bff;
    margin-top: 0;
    margin-bottom: 10px;
}

p {
    margin: 5px 0;
}

hr {
    border: 0;
    border-top: 1px solid #ccc;
    margin: 20px 0;
}

.blog-container {
    max-width: 500px;
    margin: 100px auto; /* Updated margin to center horizontally */
    border: 1px solid #ddd;
    padding: 20px;
    border-radius: 5px;
    background-color: #f9f9f9;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.blog-container h2 {
    font-size: 24px;
    margin-bottom: 10px;
}

.blog-container p {
    font-size: 16px;
    margin-bottom: 15px;
}

.blog-container img {
    max-width: 100%;
    height: auto;
    display: block;
    margin-bottom: 15px;
}

.blog-container p.author {
    font-size: 14px;
    color: #888;
}

.blog-post {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 50px; /* Added margin-top to create space between container and blog */
}

        
    </style>
</head>
<body>
   <div class="main-content">
           
               <h2>Dear <%= session.getAttribute("username").toString() %> </h2>
       <% 
           try {
               String recipient = session.getAttribute("username").toString();
               int id = Integer.parseInt(request.getParameter("id"));
               
               Connection connection = DBContent.connectDB();
               Statement statement = connection.createStatement();
               ResultSet resultSet = statement.executeQuery("SELECT * FROM emails where id='"+id+"'");
               
               while (resultSet.next()) {
       %>
       <div class="blog-container">
           <h2>Subject: <%= resultSet.getString("subject") %></h2>
           <p>From: <%= resultSet.getString("sender") %></p>
           <p>Received Date: <%= resultSet.getTimestamp("sent_date") %></p>
           <hr>
           <p><%= resultSet.getString("body") %></p>
       </div>
       <%
               }
           } catch (Exception e) {
               e.printStackTrace();
           }
       %>

    </div>

    <!-- Add a button to go back to Jhome.jsp -->
    <div class="go-back-button">
        <form action="Jhome.jsp">
            <button type="submit">Go Back to Home</button>
        </form>
    </div>
</body>
</html>