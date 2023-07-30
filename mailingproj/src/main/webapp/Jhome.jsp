<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@page import="java.sql.Connection"%>
<%@page  import="java.sql.ResultSet"%>
<%@page import ="java.sql.Statement"%>
<%@page import="mail.DBContent" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Mail Website Dashboard</title>
    <style>
           
        /* Styling for the buttons */
        .button {
            background-color: #007bff; /* Change to your desired color */
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .button:last-child {
            margin-right: 0; /* Remove margin for the last button */
        }

        .button:hover {
            background-color: #0056b3; /* Change to your desired color */
        }

        /* Styling for the Compose button */
        .compose-button {
            background-color: #0056b3; /* Change to your desired color */
        }

        /* Styling for the Logout button */
        .logout-button {
            background-color: #f44336; /* Change to your desired color */
        }

        /* Flexbox for sidebar layout */
        .sidebar {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: flex-start;
            flex: 1;
            background-color: #4285F4; /* Change to your desired color */
            color: #fff;
            padding: 20px;
        }

        /* Positioning the Logout button */
        .logout-button-container {
            display: flex;
            justify-content: flex-end;
            width: 100%;
        }

        /* Update the background color of the sidebar */
        .sidebar {
            flex: 1;
            background-color: #4285F4; /* Change to your desired color */
            color: #fff;
            padding: 20px;
        }

        /* Update the background color of the compose link when hovered */
        .sidebar li a.compose-link:hover {
            background-color: #3367D6; /* Change to your desired color */
        }

        /* Update the background color of the inbox link when hovered */
        .sidebar li a:hover {
            background-color: #0056b3; /* Change to your desired color */
        }

        /* Update the background color of the main content area */
        .main-content {
            flex: 3;
            padding: 20px;
            background-color: #fff; /* Change to your desired color */
        }

        /* Update the background color of the mail container */
        .mail-container {
            max-width: 500px;
            margin: 100px auto;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
            background-color: #f0f0f0; /* Change to your desired color */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Update the background color of the compose popup window */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 400px;
            background-color: #fff; /* Change to your desired color */
            padding: 20px;
            border: 1px solid #ccc;
            box-shadow: 0px 0px 10px #aaa;
            z-index: 9999;
        }

        /* Update the background color of the form elements */
        input[type="text"],
        textarea {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            background-color: #f9f9f9; /* Change to your desired color */
        }

        /* Update the background color of the Send button */
        input[type="submit"] {
            background-color: #4CAF50; /* Change to your desired color */
            color: white;
            padding: 8px 15px;
            border: none;
            cursor: pointer;
        }

        /* Update the background color of the Cancel button */
        button[type="button"] {
            background-color: #f44336; /* Change to your desired color */
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div class="dashboard">
       <div class="sidebar">
            <h2>Your Mails</h2>
            <!-- Compose Button -->
            <a href="#" class="button compose-button" onclick="openComposeWindow()">Compose</a>
            <!-- Add space here -->
            <div style="margin-bottom: 10px;"></div>
            <!-- Inbox Button -->
            <a href="Jhome.jsp" class="button">Inbox</a>
            <!-- Logout Button -->
            <div class="logout-button-container">
                <form action="LogoutServlet" method="post">
                    <button type="submit" class="button logout-button">Logout</button>
                </form>
            </div>
        </div>

        <div class="main-content">
            
            <h2>Welcome <%= session.getAttribute("username").toString() %> </h2>
            <% 
try {
    //String recipient = session.getAttribute("username").toString(); // Replace with the actual recipient's email
    String recipient =session.getAttribute("username").toString();
    
	       
    Connection connection =    DBContent.connectDB();         // Step 2: Execute database query
	       Statement statement = connection.createStatement();
	       ResultSet resultSet = statement.executeQuery("SELECT * FROM emails where recipient='"+recipient+"'"); 
	       
	       // Step 3: Retrieve and process the data
	      
	       while (resultSet.next()) {
	    	   int id=resultSet.getInt("id");
%>
<div class="mail-container"  onclick="openEmailPage('MailContent.jsp?id=<%=id %>')">
                <h2>Subject: <%= resultSet.getString("subject") %></h2>
                <p>From: <%= resultSet.getString("sender") %></p>
                
                
            </div>
<%
    }
	     
} catch (Exception e) {
    e.printStackTrace();
}
%>

        </div>
    </div>
    <div id="composePopup" class="popup">
        <h2>New Email</h2>
        <form action="send" method="post">
            <label for="to">To:</label>
            <input type="text" name="to" id="to" required>
            <br>
            <label for="subject">Subject:</label>
            <input type="text" name="subject" id="subject">
            <br>
            <label for="body">Body:</label>
            <textarea name="body" id="body" rows="5"></textarea>
            <br>
            <input type="submit" value="Send">
            <button type="button" onclick="closeComposeWindow()">Cancel</button>
        </form>
    </div>

    <script>
        function openComposeWindow() {
            document.getElementById("composePopup").style.display = "block";
        }

        function closeComposeWindow() {
            document.getElementById("composePopup").style.display = "none";
        }
        function openEmailPage(url) {
            window.location.href = url;
        }
        
    </script>
</body>
</html>
