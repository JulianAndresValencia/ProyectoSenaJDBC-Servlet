/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet(name = "InsertarItemServlet", urlPatterns = {"/InsertarItem"})
public class NewServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Obtener parámetros del formulario
            String fechaEntrada = request.getParameter("fechaEntrada");
            String nombre = request.getParameter("nombre");
            String marca = request.getParameter("marca");
            String fechaVencimiento = request.getParameter("fechaVencimiento");
            String cantidad = request.getParameter("cantidad");
            String tipoProducto = request.getParameter("tipoProducto");
            String descripcion = request.getParameter("descripcion");
            String valorUnidad = request.getParameter("valorUnidad");

            // Establecer la conexión a la base de datos
            String usuario = "root";
            String password = "Atenas2022+";
            String url = "jdbc:mysql://localhost:3306/item";
            Connection conexion = DriverManager.getConnection(url, usuario, password);

            // Insertar datos en la tabla 'item'
            String insertQuery = "INSERT INTO item(FechaEntrada, Nombre, Marca, FechaVencimiento, Cantidad, TipoProducto, Descripcion, ValorUnidad) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = conexion.prepareStatement(insertQuery)) {
                preparedStatement.setString(1, fechaEntrada);
                preparedStatement.setString(2, nombre);
                preparedStatement.setString(3, marca);
                preparedStatement.setString(4, fechaVencimiento);
                preparedStatement.setString(5, cantidad);
                preparedStatement.setString(6, tipoProducto);
                preparedStatement.setString(7, descripcion);
                preparedStatement.setString(8, valorUnidad);

                int filasInsertadas = preparedStatement.executeUpdate();

                // Verificar cuántas filas fueron insertadas
                out.println("<html><body>");
                out.println("<h2>Resultado:</h2>");
                out.println("<p>Filas insertadas: " + filasInsertadas + "</p>");
                out.println("</body></html>");
            }

            // Cerrar la conexión
            conexion.close();
        } catch (SQLException ex) {
            Logger.getLogger(NewServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

