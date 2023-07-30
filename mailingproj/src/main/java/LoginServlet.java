

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mail.DBContent;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try {
            HttpSession session = request.getSession();
            Connection connection = DBContent.connectDB();
            String query = "SELECT * FROM userinfo WHERE username = ? AND password = ?";
            
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, username);
                statement.setString(2, password);
                
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        session.setAttribute("username", username);
                        response.sendRedirect("Jhome.jsp");
                    } else {
                        response.sendRedirect("login.jsp");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database-related exceptions, log, and display appropriate error messages
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle other exceptions, log, and display appropriate error messages
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }
    }

	}


