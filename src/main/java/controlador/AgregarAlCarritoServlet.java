package controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import modelo.Producto;


public class AgregarAlCarritoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        double precio = Double.parseDouble(request.getParameter("precio"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));

        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        List<Producto> carrito = (List<Producto>) session.getAttribute("carrito");

        if (carrito == null) {
            carrito = new ArrayList<>();
        }

        boolean existe = false;
        for (Producto p : carrito) {
            if (p.getId() == id) {
                p.setCantidad(p.getCantidad() + cantidad);
                existe = true;
                break;
            }
        }

        if (!existe) {
            Producto producto = new Producto(id, nombre, precio, cantidad);
            carrito.add(producto);
        }

        session.setAttribute("carrito", carrito);
        response.sendRedirect("carrito.jsp");
    }
}
