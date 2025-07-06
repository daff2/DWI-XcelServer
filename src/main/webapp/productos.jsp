<%@ page import="java.util.List" %> <%@ page import="modelo.Producto" %> <% if (request.getAttribute("productos") == null) { response.sendRedirect("ProductoServlet"); return; } %>
<% List<Producto> productos = (List<Producto>) request.getAttribute("productos"); if (productos != null) { for (Producto producto : productos) { %>
<div class="product-card"><div class="product-image"><img src="<%= producto.getImagen() %>" alt="<%= producto.getNombre() %>"></div><div class="product-info"><div class="product-name"><%= producto.getNombre() %></div><div class="product-category"><%= producto.getCategoriaNombre() %></div><div class="product-description"><%= producto.getDescripcion() %></div><div class="product-price">$<%= producto.getPrecio() %></div><div class="product-stock">En stock: <%= producto.getStock() %> unidades</div><div class="product-actions"><div class="quantity-selector"><button onclick="changeQuantity(this, -1)">-</button><input type="number" value="1" min="1" max="<%= producto.getStock() %>"><button onclick="changeQuantity(this, 1)">+</button></div><button onclick="addToCart(this)">Agregar al carrito</button></div></div></div><%}} else {%><p>No hay productos disponibles.</p><%}%><!DOCTYPE html><html lang="es"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Productos | XCEL_SERVER</title><link rel="stylesheet" href="css/index.css"></head><body><header><nav><div class="logo">XCEL_SERVER</div><ul class="nav-center"><li><a href="productos.jsp">PRODUCTOS</a></li><li><a href="nosotros.jsp">NOSOTROS</a></li><li><a href="carrito.jsp">CARRITO</a></li><li><a href="contacto.jsp">CONTACTO</a></li></ul><ul class="nav-right"><li><a href="login.jsp">INICIAR SESION</a></li></ul></nav></header>
<main>
    <section class="hero">
        <h1>Tecnologia en un click </h1>
        <p>Encuentra los mejores productos tecnologicos</p>
    </section>

    <section class="search-section">
        <!-- tu buscador aquí -->
    </section>

    <section class="products-section">
        <h2>PRODUCTOS DESTACADOS</h2>
        <div class="products-grid" id="productsGrid">
         <%
        if (productos != null && !productos.isEmpty()) {
            for (Producto producto : productos) {
    %>
            <div class="product-card">
                <div class="product-image">
                    <img src="<%= producto.getImagen() %>" alt="<%= producto.getNombre() %>">
                </div>
                <div class="product-info">
                    <div class="product-name"><%= producto.getNombre() %></div>
                    <div class="product-category"><%= producto.getCategoriaNombre() %></div>
                    <div class="product-description"><%= producto.getDescripcion() %></div>
                    <div class="product-price">$<%= producto.getPrecio() %></div>
                    <div class="product-stock">En stock: <%= producto.getStock() %> unidades</div>
                    <div class="product-actions">
                        <div class="quantity-selector">
                            <button class="quantity-btn" onclick="changeQuantity(this, -1)">-</button>
                            <input type="number" class="quantity-input" value="1" min="1" max="<%= producto.getStock() %>">
                            <button class="quantity-btn" onclick="changeQuantity(this, 1)">+</button>
                        </div>
                        <button class="btn-add-cart" onclick="addToCart(this)">Agregar al carrito</button>
                    </div>
                </div>
            </div>
        <%
                }
            } else {
        %>
            <p>No hay productos disponibles.</p>
        <%
            }
        %>
        </div>
    </section>
</main>
<button class="help-button" onclick="window.location.href='contacto.jsp'" title="¿Necesitas ayuda?">
  ¿Necesitas ayuda?
</button>

<footer>
    <p>&copy; 2025 XCEL_SERVER. Todos los derechos reservados.</p>
</footer>

<script>

      // Función para cambiar cantidad
    function changeQuantity(button, change) {
        const input = button.parentElement.querySelector('.quantity-input');
        const currentValue = parseInt(input.value);
        const max = parseInt(input.getAttribute('max'));
        const min = parseInt(input.getAttribute('min'));

        const newValue = currentValue + change;

        if (newValue >= min && newValue <= max) {
            input.value = newValue;
        }
    }

    // Función para agregar al carrito
    function addToCart(button) {
        const productCard = button.closest('.product-card');
        const productName = productCard.querySelector('.product-name').textContent;
        const quantity = productCard.querySelector('.quantity-input').value;

        // Animación del botón
        button.style.transform = 'scale(0.95)';
        button.textContent = '? Agregado!';
        button.style.background = 'linear-gradient(135deg, #48bb78 0%, #38a169 100%)';

        setTimeout(() => {
            button.style.transform = 'scale(1)';
            button.textContent = ' Agregar al carrito';
            button.style.background = 'linear-gradient(135deg, #48bb78 0%, #38a169 100%)';
        }, 1500);

        // Aquí iría la lógica para agregar al carrito
        console.log(`Producto agregado: ${productName}, Cantidad: ${quantity}`);

        // Mostrar notificación
        showNotification(`${productName} agregado al carrito (${quantity} unidad${quantity > 1 ? 'es' : ''})`);
    }

    // Función para mostrar notificaciones
    function showNotification(message) {
        const notification = document.createElement('div');
        notification.style.cssText = `
            position: fixed;
            top: 20px;
            right:20px;
            background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
            color: white;
            padding: 1rem 2rem;
            border-radius: 10px;
            box-shadow: 0 8px 25px rgba(72, 187, 120, 0.3);
            z-index: 10000;
            animation: slideIn 0.3s ease;
        `;
        notification.textContent = message;

        document.body.appendChild(notification);

        setTimeout(() => {
            notification.remove();
        }, 3000);
    }

    // Función de búsqueda
    document.getElementById('searchForm').addEventListener('submit', function(e) {
        e.preventDefault();

        const loading = document.getElementById('loading');
        const productsGrid = document.getElementById('productsGrid');

        // Mostrar loading
        loading.style.display = 'block';
        productsGrid.style.opacity = '0.5';

        // Simular búsqueda
        setTimeout(() => {
            loading.style.display = 'none';
            productsGrid.style.opacity = '1';

            const searchTerm = document.getElementById('nombre').value.toLowerCase();
            const category = document.getElementById('categoria').value;

          let message = 'Búsqueda realizada: "' + searchTerm + '"';
          if (category) {
           message += ' en ' + category;
            }
          showNotification(message);


    // Añadir animación CSS
    const style = document.createElement('style');
    style.textContent = `
        @keyframes slideIn {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
    `;
    
</script>

</body></html>

