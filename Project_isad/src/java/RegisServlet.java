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
import javax.sql.DataSource;

/**
 *
 * @author admin
 */
@WebServlet(urlPatterns = {"/regisServlet"})
public class RegisServlet extends HttpServlet {

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
            String in_firstname = request.getParameter("firstname");
            String in_lastname = request.getParameter("lastname");
            String in_tel = request.getParameter("tel");
            String in_email = request.getParameter("email");
            String in_address = request.getParameter("address");

           

            PreparedStatement stmt;
            PreparedStatement stmt2;
            PreparedStatement stmt3;
            String sql = "INSERT INTO user_login VALUES(?,?,?)";
            String sql2 = "INSERT INTO customer VALUES(?,?,?,?,?,?)";
            String sql3 = "SELECT COUNT(username) FROM customer";
            
            try {
//                Statement stmt = conn.createStatement();
                stmt = conn.prepareStatement(sql);
                stmt2 = conn.prepareStatement(sql2);
                
                stmt3 = conn.prepareStatement(sql3);
                ResultSet rs = stmt3.executeQuery();
                
                String count_id = "";
                if (rs.next()) {
                    count_id = rs.getString("COUNT(username)");
                }
                
                stmt.setString(1, in_username);
                stmt.setString(2, in_password);
                stmt.setString(3, "customer");
                
                
                int num1 = Integer.parseInt(count_id);
                num1 = num1 + 1;
                stmt2.setInt(1, num1);
                stmt2.setString(2, in_firstname +" "+in_lastname);
                stmt2.setString(3, in_email);
                stmt2.setString(4, in_tel);
                stmt2.setString(5, in_address);
                stmt2.setString(6, in_username);

                

//                PreparedStatement stmt = conn.prepareStatement(sql);
//                ResultSet rs = stmt.executeQuery();
                int numRow = stmt.executeUpdate();

                int numRow2 = stmt2.executeUpdate();
//                stmt.executeUpdate();

               // out.println("Regis Suscess");
               response.sendRedirect("index.jsp");
                
            } catch (SQLException ex) {

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
            Logger.getLogger(RegisServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(RegisServlet.class.getName()).log(Level.SEVERE, null, ex);
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
