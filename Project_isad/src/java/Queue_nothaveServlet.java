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
@WebServlet(urlPatterns = {"/Queue_nothaveServlet"})
public class Queue_nothaveServlet extends HttpServlet {

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

            String car_regis = request.getParameter("car_regis");
            String car_color = request.getParameter("car_color");
            String car_gen = request.getParameter("car_gen");
            String car_brand = request.getParameter("car_brand");

            PreparedStatement stmt;
            PreparedStatement stmt2;
            PreparedStatement stmt3;

            String sql = "INSERT INTO car_info(car_regis_no, car_color, car_gen, car_band, cus_id,car_id) VALUES(?,?,?,?,?,?)";
            String sql2 = "SELECT * FROM customer";
            String sql3 = "SELECT COUNT(car_id) FROM car_info";
            

            HttpSession session = request.getSession();

            try {

                stmt = conn.prepareStatement(sql);
                stmt2 = conn.prepareStatement(sql2);
                stmt3 = conn.prepareStatement(sql3);

                ResultSet rs = stmt2.executeQuery();
                ResultSet rs2 = stmt3.executeQuery();

                String user = (String) request.getSession().getAttribute("user");

                stmt.setString(1, car_regis);
                stmt.setString(2, car_color);
                stmt.setString(3, car_gen);
                stmt.setString(4, car_brand);
                
                
                if(rs2.next()){
                   String c_car_id = rs2.getString("COUNT(car_id)");
                   int cc_car_id = Integer.parseInt(c_car_id) + 1;
                   stmt.setInt(6, cc_car_id);
                   out.println("jj");
                   out.println(cc_car_id);
               }
                
                

                while (rs.next()) {
                    int cus_id = rs.getInt("cus_id");
                    if (user.equals(rs.getString("username"))) {

                        stmt.setInt(5, cus_id);
                        session.setAttribute("car_id", car_regis);
//                        out.println(cus_id);
                        response.sendRedirect("queue_problem.jsp?car_id="+car_regis);

                    }
                }
                
               
                

                int numRow = stmt.executeUpdate();
                int numRow2 = stmt2.executeUpdate();

                out.println(car_regis);
                out.println(car_color);
                out.println(car_gen);
                out.println(car_brand);
                out.println(user);

//                RequestDispatcher dd = request.getRequestDispatcher("queue_problem.jsp");
//                dd.forward(request, response);
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
            Logger.getLogger(Queue_nothaveServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Queue_nothaveServlet.class.getName()).log(Level.SEVERE, null, ex);
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
