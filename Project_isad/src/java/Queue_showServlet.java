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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author anuchitamatchima
 */
@WebServlet(urlPatterns = {"/Queue_showServlet"})
public class Queue_showServlet extends HttpServlet {
    
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
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String date = request.getParameter("car_date");
            String time = request.getParameter("time");
            String problem = request.getParameter("problem");
            PreparedStatement stmt;
            PreparedStatement stmt2;
            //out.print(date + time + problem);
            String sql = "INSERT INTO queue(time, checks, car_date, car_regis_no) VALUES(?,?,?,?)";
            String sql2 = "INSERT INTO repair(problem, car_regis_no) VALUES(?, ?)";

            HttpSession session = request.getSession();
            try {
                
                stmt = conn.prepareStatement(sql);
                stmt2 = conn.prepareStatement(sql2);
                
                stmt.setString(1, time);
                stmt.setInt(2, 0);
                stmt.setString(3, date);
                stmt.setString(4, (String) request.getParameter("car_id"));
                
                stmt2.setString(1, problem);
                stmt2.setString(2, (String) request.getParameter("car_id"));
                
                int numRow = stmt.executeUpdate();
                
                int numRow2 = stmt2.executeUpdate();
                out.println("test");
                out.println(numRow2);
                PreparedStatement stmt3 = conn.prepareStatement("select queue_id from queue where car_regis_no = ? order by queue_id desc");
                stmt3.setString(1, request.getParameter("car_id"));
                ResultSet rs3 = stmt3.executeQuery();
                rs3.next();
                out.print(rs3.getString(1));
                session.setAttribute("queue", rs3.getString("queue_id"));
                session.setAttribute("q_date", date);
                session.setAttribute("q_time", time);
                RequestDispatcher dd = request.getRequestDispatcher("queue_show.jsp");
                dd.forward(request, response);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }}

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
            Logger.getLogger(Queue_showServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Queue_showServlet.class.getName()).log(Level.SEVERE, null, ex);
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
