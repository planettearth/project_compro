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
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author admin
 */
@WebServlet(urlPatterns = {"/ReviewServlet"})
public class ReviewServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            String user = (String) session.getAttribute("user");
            String comment = request.getParameter("comment");
            String rate = request.getParameter("estrellas");
            String cus_id = (String) session.getAttribute("cus_id");

            out.println(user);
            out.println(comment);
            out.println(rate);
            out.println(cus_id);

            PreparedStatement stmt;
            PreparedStatement stmt2;
            PreparedStatement stmt3;

            try {
                String sql = "INSERT INTO review VALUES(?,?,?,?)";
                String sql2 = "SELECT COUNT(review_id) FROM review where cus_id =" + cus_id;
                stmt = conn.prepareStatement(sql);
                stmt2 = conn.prepareStatement(sql2);
                int num = Integer.parseInt(cus_id);
                out.println("OO");
                ResultSet rs2 = stmt2.executeQuery();
                int review_id = 0;
                if (rs2.next()) {
                    review_id = Integer.parseInt(rs2.getString("COUNT(review_id)"));
                }
                out.println("PP");
                review_id = review_id + 1;
                stmt.setInt(1, num);
                stmt.setInt(2, review_id);
                stmt.setString(3, comment);
                stmt.setString(4, rate);
                out.println(review_id);
                


                int numRow = stmt.executeUpdate();
               response.sendRedirect("thank_review.jsp");

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
        processRequest(request, response);
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
        processRequest(request, response);
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
