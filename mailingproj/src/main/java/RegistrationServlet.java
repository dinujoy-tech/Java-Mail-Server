import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrationServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/mailinfo";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // JDBC variables
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Step 1: Register the JDBC driver (if you haven't done this already)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Step 2: Open a connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Step 3: Create and execute the SQL statement
            String sql = "INSERT INTO userinfo (fname, lname, username, password) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, fname);
            pstmt.setString(2, lname);
            pstmt.setString(3, username);
            pstmt.setString(4, password);
            pstmt.executeUpdate();

            // Step 4: Handle the response
            response.sendRedirect("login.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            
            // You can add additional error handling here, such as showing an error message on the register.jsp page.
            response.sendRedirect("register.jsp");
        } finally {
            // Step 5: Close the resources
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
