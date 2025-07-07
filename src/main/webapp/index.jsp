<%-- 
    Document   : index
    Created on : 24 abr. 2025, 17:12:14
    Author     : PorrasPoma
--%>
<%
    String usuario = (String) session.getAttribute("usuario");
    String rol = (String) session.getAttribute("rol");
%>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos | XCEL_SERVER</title>
    <link rel="stylesheet" href="css/estilosGenerales.css">
    <link rel="stylesheet" href="css/estilosProductos.css"> 
</head>
<body> 
    <header>
        <nav> 
        <ul class="nav-center">
            <% if (usuario == null) { %> 
                <li><a href="productos.jsp">PRODUCTOS</a></li>
                <li><a href="nosotros.jsp">NOSOTROS</a></li>
                <li><a href="carrito.jsp">CARRITO</a></li>
                <li><a href="contacto.jsp">CONTACTO</a></li>
            <% } else { %>
                <% if ("CLIENTE".equals(rol)) { %> 
                    <li><a href="productos.jsp">PRODUCTOS</a></li>
                    <li><a href="nosotros.jsp">NOSOTROS</a></li>
                    <li><a href="carrito.jsp">CARRITO</a></li>                           
                <li><a href="mispedidos.jsp">MIS PEDIDOS</a></li>
                    <li><a href="contacto.jsp">CONTACTO</a></li>
                <% } else if ("EMPLEADO".equals(rol)) { %>
                    <li><a href="nosotros.jsp">NOSOTROS</a></li>
                    <li><a href="pedidos.jsp">PEDIDOS</a></li>
                    <li><a href="reporte.jsp">REPORTE</a></li>
                <% } else if ("ADMINISTRADOR".equals(rol)) { %>
                    <li><a href="nosotros.jsp">NOSOTROS</a></li>
                    <li><a href="pedidos.jsp">PEDIDOS</a></li>
                    <li><a href="reporte.jsp">REPORTE</a></li>
                   <li><a href="usuarios.jsp">USUARIOS</a></li>
                    <li><a href="almacen.jsp">ALMACÉN</a></li>
                <% } %>
                <li><a href="ajustes.jsp">AJUSTES</a></li>
            <% } %>
        </ul>
            <ul class="nav-right">
                    <% if (usuario == null) { %>
                    <li><a href="login.jsp">INICIAR SESIÓN</a></li>
                        <% } else { %>
                    <li><a href="LogoutServlet">CERRAR SESIÓN</a></li>
                        <% } %>
            </ul>
        </nav>
    </header>

    <!-- Sección de productos y búsqueda -->
    <main class="contenido-central">
    <section id="productos-busqueda" class="seccion-productos">
        
        <section id="productos-busqueda">
        <!-- Formulario de búsqueda -->
        <div id="buscar-productos">
            <h2>BUSCAR PRODUCTO</h2>
            <form action="ProductosServlet" method="get" class="form-busqueda">
                <input type="hidden" name="action" value="buscarProductos">
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="buscarNombre" placeholder="Buscar por nombre" />
                </div>
                <div class="form-group">
                    <label for="categoria">Categoría:</label>
                    <select id="categoria" name="buscarCategoria">
                        <option value="">Todas</option>
                    </select>
                </div>
                <button type="submit" class="btn-agregar">Buscar</button>
            </form>
        </div>

        <!-- Sección de productos -->
        <div id="lista-productos">
            <h2>PRODUCTOS</h2>
            <div class="productos-grid">
                <!-- Producto -->
                <div class="producto-item">                        
                    <form action="CarritoServlet" method="post">
                        <input type="hidden" name="action" value="agregar">
                        <input type="hidden" name="id" value="123">
                        <input type="hidden" name="nombre" value="Producto A">
                        <input type="hidden" name="precio" value="20.00">
                        <input type="hidden" name="imagen" value="imagen_a.jpg">
                        <input type="hidden" name="cantidad" class="cantidad-hidden" value="1">
                        <button type="submit" class="btn-agregar">Agregar al carrito</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    </section>
    </main>
    
    <button onclick="window.location.href='contacto.jsp'" class="btn-ayuda">¿Necesitas ayuda?</button>

    <footer>
        <p>&copy; 2025 XCEL_SERVER. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
