
package controlador;

import DAO.ProductoDAO;
import modelo.Producto;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ProductoServlet")
public class ProductoServlet extends HttpServlet {

    private ProductoDAO dao;   

    @Override
    public void init() throws ServletException {
        dao = new ProductoDAO();
    }

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    System.out.println(" ProductoServlet ejecutándose...");

    try {
        List<Producto> productos = new ProductoDAO().obtenerTodos();

        System.out.println(" Productos recuperados: " + (productos != null ? productos.size() : "null"));

        if (productos != null) {
            for (Producto p : productos) {
                System.out.println("️ Producto: " + p.getNombre() + " | $" + p.getPrecio());
            }
        }

        request.setAttribute("productos", productos);
        request.getRequestDispatcher("productos.jsp").forward(request, response);

    } catch (Exception e) {
        System.err.println(" Error en ProductoServlet:");
        e.printStackTrace();
        response.setContentType("text/html");
        response.getWriter().println("<h1>Error</h1><pre>" + e.getMessage() + "</pre>");
    }
 }
}