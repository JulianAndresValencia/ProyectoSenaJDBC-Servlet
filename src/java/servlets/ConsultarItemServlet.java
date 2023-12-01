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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ConsultarItemServlet", urlPatterns = {"/ConsultarItem"})
public class ConsultarItemServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el parámetro "nombre" de la URL
        String nombreProducto = request.getParameter("nombre");

        // Establecer la conexión a la base de datos
        String usuario = "root";
        String password = "Atenas2022+";
        String url = "jdbc:mysql://localhost:3306/item";

        try (Connection conexion = DriverManager.getConnection(url, usuario, password)) {
            // Consultar la base de datos usando el parámetro
            String selectQuery = "SELECT * FROM item WHERE Nombre = ?";
            try (PreparedStatement preparedStatement = conexion.prepareStatement(selectQuery)) {
                preparedStatement.setString(1, nombreProducto);

                try (ResultSet rs = preparedStatement.executeQuery()) {
                    response.setContentType("text/html;charset=UTF-8");
                    try (PrintWriter out = response.getWriter()) {
                        out.println("<html><body>");

                        // Mostrar los resultados de la consulta
                        while (rs.next()) {
                            out.println("<p>ID: " + rs.getInt("id") + "</p>");
                            out.println("<p>Fecha de Entrada: " + rs.getString("FechaEntrada") + "</p>");
                            out.println("<p>Nombre: " + rs.getString("Nombre") + "</p>");
                            out.println("<p>Marca: " + rs.getString("Marca") + "</p>");
                            out.println("<p>Fecha de Vencimiento: " + rs.getString("FechaVencimiento") + "</p>");
                            out.println("<p>Cantidad: " + rs.getString("Cantidad") + "</p>");
                            out.println("<p>Tipo de Producto: " + rs.getString("TipoProducto") + "</p>");
                            out.println("<p>Descripción: " + rs.getString("Descripcion") + "</p>");
                            out.println("<p>Valor por Unidad: " + rs.getString("ValorUnidad") + "</p>");
                        }

                        out.println("</body></html>");
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConsultarItemServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
