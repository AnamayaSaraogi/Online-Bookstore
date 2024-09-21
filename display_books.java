/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.assignment3;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.*;

/**
 *
 * @author anama
 */
@WebServlet(name = "display_books", urlPatterns = {"/display_books"})
public class display_books extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        
        String type = request.getParameter("choose");
        String input = request.getParameter("search");
        
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost/java","root","");
            
            String sql =null;
            
            if("name".equals(type))
            {
                sql = "SELECT * FROM Books WHERE book_name LIKE ?";
                
            }
            
            else if("ISBN".equals(type))
            {
                sql = "SELECT * FROM Books WHERE ISBN = ?";
            }
            
            else
            {
                sql = "SELECT * FROM Books WHERE author_name LIKE ?";
            }
            
            pst = conn.prepareStatement(sql);
            pst.setString(1, "%" + input + "%");  // Use LIKE for partial matching
            rs = pst.executeQuery();
                
            List<Book> books = new ArrayList<>();
            
            while (rs.next()){
                Book book = new Book();
                book.setBookName(rs.getString("book_name"));
                book.setISBN(rs.getString("ISBN"));
                book.setAuthorName(rs.getString("author_name"));
                book.setPrice(rs.getDouble("price"));
                books.add(book);
            }
            
            if(!books.isEmpty()){
                request.setAttribute("books",books);
                request.getRequestDispatcher("book_results.jsp").forward(request, response);
            }
            
            else{
                request.setAttribute("message","No books found matching your search criteria.");
                request.getRequestDispatcher("book_results.jsp").forward(request, response);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{ 
                if(rs != null)
                    rs.close();
            }catch(SQLException e)
            {}
            
            try{ 
                if(pst != null)
                    pst.close();
            }catch(SQLException e)
            {}
            
            try{ 
                if(conn != null)
                    conn.close();
            }catch(SQLException e)
            {}
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
