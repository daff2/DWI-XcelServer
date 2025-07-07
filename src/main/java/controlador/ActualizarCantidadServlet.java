package controlador;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import modelo.Producto;


public class ActualizarCantidadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idActualizar = Integer.parseInt(request.getParameter("id"));
        int nuevaCantidad = Integer.parseInt(request.getParameter("cantidad"));

        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        List<Producto> carrito = (List<Producto>) session.getAttribute("carrito");

        if (carrito != null) {
            for (Producto producto : carrito) {
                if (producto.getId() == idActualizar) {
                    producto.setCantidad(nuevaCantidad);
                    break;
                }
            }
        }

        session.setAttribute("carrito", carrito);
        response.sendRedirect("carrito.jsp");
    }
}
