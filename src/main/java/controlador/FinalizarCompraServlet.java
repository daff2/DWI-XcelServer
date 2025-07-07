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


public class FinalizarCompraServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        List<Producto> carrito = (List<Producto>) session.getAttribute("carrito");

        if (carrito != null && !carrito.isEmpty()) {
            // Aquí iría el DAO para guardar la compra en la base de datos

            // Limpia el carrito
            session.removeAttribute("carrito");

            // Redirecciona a página de confirmación
            response.sendRedirect("compraExitosa.jsp");
        } else {
            // Si el carrito está vacío, volver al carrito
            response.sendRedirect("carrito.jsp");
        }
    }
}
