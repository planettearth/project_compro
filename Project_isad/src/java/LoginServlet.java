/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.websocket.Session;

/**
 *
 * @author admin
 */
@WebServlet(urlPatterns = {"/loginServlet"})
public class LoginServlet extends HttpServlet {

    @Resource(name = "test2")
    private DataSource test2;

    private Connection conn;

    @Override
    public void init() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println(e);
        }

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?zeroDateTimeBehavior=convertToNull", "root", "root");
        } catch (SQLException sqle) {
            System.out.println("" + sqle);
        }
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            String in_username = request.getParameter("username");
            String in_password = request.getParameter("password");

            String sql = "SELECT * FROM user_login";

            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            String cus_id = "";

            while (rs.next()) {

                String user = rs.getString("username");
                String role = rs.getString("roles");
                String pass = rs.getString("password");
                HttpSession session = request.getSession();
//                out.print("opor");
//                String sql1 = "SELECT cus_id FROM customer WHERE = '" + user + "'";
//                out.print(sql1);
//                PreparedStatement stmt2 = conn.prepareStatement(sql1);
//                out.print("opor2.5");
//                ResultSet rs2 = stmt2.executeQuery();
//                out.print("opor3");

//                if(rs2.next()){
//                    cus_id = rs2.getString("cus_id");
//                }

                if (role.equals("customer") && user.equals(in_username) && pass.equals(in_password)) {
                    response.sendRedirect("LoginServlet2");
                    session.setAttribute("user", user);

                    session.setAttribute("roles", rs.getString("roles"));
                } else if (role.equals("manager") && user.equals(in_username) && pass.equals(in_password)) {

                    response.sendRedirect("LoginServlet2");
                    session.setAttribute("user", user);
                    session.setAttribute("roles", rs.getString("roles"));
                    
                } else if (role.equals("information") && user.equals(in_username) && pass.equals(in_password)) {
                    response.sendRedirect("LoginServlet2");
                    session.setAttribute("user", user);
                    session.setAttribute("roles", rs.getString("roles"));
                    
                } else if (role.equals("account") && user.equals(in_username) && pass.equals(in_password)) {
                    response.sendRedirect("LoginServlet2");
                    session.setAttribute("user", user);
                    session.setAttribute("roles", rs.getString("roles"));
                    
                } else if (role.equals("mechanic") && user.equals(in_username) && pass.equals(in_password)) {
                    response.sendRedirect("LoginServlet2");
                    session.setAttribute("user", user);
                    session.setAttribute("roles", rs.getString("roles"));
                }

            }

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
