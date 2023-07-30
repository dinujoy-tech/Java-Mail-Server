

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mail.DBContent;



/**
 * Servlet implementation class sendmail
 */
public class sendmail extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String sender = session.getAttribute("username").toString();
        String recipient = request.getParameter("to");
        String subject = request.getParameter("subject");
        String body = request.getParameter("body");
        Timestamp sentDate = new Timestamp(System.currentTimeMillis());
       boolean isRead = false;
        try  {
        	Connection connection = DBContent.connectDB();
            String query = "INSERT INTO emails (sender, recipient, subject, body, sent_date, is_read) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, sender);
            statement.setString(2, recipient);
            statement.setString(3, subject);
            statement.setString(4, body);
            statement.setTimestamp(5, sentDate);
            statement.setBoolean(6, isRead);

            statement.executeUpdate();
            response.sendRedirect("Jhome.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the database insertion error appropriately
        }
	}

}
