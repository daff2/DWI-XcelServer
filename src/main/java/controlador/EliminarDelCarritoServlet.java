package controlador;

import java.io.IOException;
import java.util.List;
import java.util.Iterator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import modelo.Producto;


public class EliminarDelCarritoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idEliminar = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        List<Producto> carrito = (List<Producto>) session.getAttribute("carrito");

        if (carrito != null) {
            Iterator<Producto> it = carrito.iterator();
            while (it.hasNext()) {
                Producto p = it.next();
                if (p.getId() == idEliminar) {
                    it.remove();
                    break;
                }
            }
        }

        session.setAttribute("carrito", carrito);
        response.sendRedirect("carrito.jsp");
    }
}
