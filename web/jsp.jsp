<%-- 
    Document   : jsp
    Created on : 23/11/2023, 10:37:30 p. m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Sitio Web</title>
    <style>
        /* Estilos CSS del navbar */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            position: fixed;
            top: 0;
            width: 97%; /* Ancho al 100% del viewport */
            background-color: #333;
            color: #fff;
            padding: 10px;
            display: flex; /* Usar flexbox para alinear elementos */
            justify-content: space-between; /* Alinear elementos en los extremos */
            align-items: center; /* Centrar verticalmente los elementos */
        }
        header a {
            color: #fff;
            text-decoration: none;
            margin: 0 10px;
        }
        header h1 {
            margin: 0; /* Eliminar el margen del título */
        }
        .login-dropdown {
            position: relative;
            display: inline-block;
        }
        .login-dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            top: 40px; /* Ajustar la posición del menú desplegable */
        }
        .login-dropdown:hover .login-dropdown-content {
            display: block;
        }
        .login-dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        .login-dropdown-content a:hover {
            background-color: #f1f1f1;
        }
        /* Añadir espacio en la parte superior para evitar solapamiento con el contenido */
        body {
            padding-top: 50px; /* Ajusta esto según la altura de tu navbar */
        }
    </style>
</head>
<body>
    <header>
        <div style="text-align: right;"> <!-- Área para los enlaces en el lado derecho -->
            <div class="login-dropdown">
                <span>Iniciar Sesión</span>
                <div class="login-dropdown-content">
                    <a href="#">Usuario</a>
                    <a href="#">Administrador</a>
                </div>
            </div>
            <a href="#">Inicio</a>
            <a href="javascript:void(0);" onclick="toggleAbout()">Acerca de</a>
            <a href="#">Servicios</a>
            <a href="https://web.whatsapp.com/" target="_blank">Contacto</a>
            <select id="languageSelector" onchange="changeLanguage()">
                <option value="es">Español</option>
                <option value="en">English</option>
                <option value="pt">Português</option>
                <option value="ru">Русский</option>
                <option value="zh">中文</option>
            </select>
        </div>
        <h1>EnviTrianón</h1> <!-- Título a la izquierda -->

    </header>

    <div id="about" style="display: none;"> <!-- Contenedor de la descripción oculto por defecto -->
        <h2>Sobre Nosotros...</h2>
        <p>Minimercado Envitrianón es un acogedor establecimiento ubicado en Envigado, Antioquia. Nuestro minimercado es el lugar perfecto para los residentes de la zona que buscan productos frescos, alimentos básicos, y una atención amable y personalizada. En Envitrianón, nos enorgullece servir a la comunidad con una amplia variedad de productos de calidad, desde víveres hasta artículos esenciales. Nuestra misión es brindar comodidad y satisfacción a nuestros clientes, convirtiéndonos en un referente local para sus necesidades diarias. ¡Visítanos y descubre lo que hace especial a Minimercado Envitrianón!</p>
    </div>

    <script>
        function changeLanguage() {
            const languageSelector = document.getElementById('languageSelector');
            const selectedLanguage = languageSelector.value;
            if (selectedLanguage === 'es') {
                // Cambiar el idioma a español
                document.title = 'Mi Sitio Web';
                document.body.lang = 'es';
                // Aquí puedes agregar más cambios relacionados con el idioma español
            } else if (selectedLanguage === 'en') {
                // Cambiar el idioma a inglés
                document.title = 'My Website';
                document.body.lang = 'en';
                // Aquí puedes agregar más cambios relacionados con el idioma inglés
            } else if (selectedLanguage === 'pt') {
                // Cambiar el idioma a portugués
                document.title = 'Meu Site';
                document.body.lang = 'pt';
                // Aquí puedes agregar más cambios relacionados con el idioma portugués
            } else if (selectedLanguage === 'ru') {
                // Cambiar el idioma a ruso
                document.title = 'Мой сайт';
                document.body.lang = 'ru';
                // Aquí puedes agregar más cambios relacionados con el idioma ruso
            } else if (selectedLanguage === 'zh') {
                // Cambiar el idioma a chino
                document.title = '我的网站';
                document.body.lang = 'zh';
                // Aquí puedes agregar más cambios relacionados con el idioma chino
            }
        }

        function toggleAbout() {
            const aboutSection = document.getElementById('about');
            if (aboutSection.style.display === 'none' || aboutSection.style.display === '') {
                aboutSection.style.display = 'block'; // Mostrar la descripción (si está oculta)
            } else {
                aboutSection.style.display = 'none'; // Ocultar la descripción (si está visible)
            }
        }
    </script>


<data-comment= Crear las tres bases de datos>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .card-img {
            width: 100%; /* Establece el ancho al 100% */
            height: auto; /* Ajusta la altura automáticamente */
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .card {
            width: 18rem;/* alinea las tarjetas al centro de la pantalla */
            margin: 10px;
        }
        .card-img {
            width: 100%;
            height: auto;
        }
    </style>
    <title>Tarjeta de Persona</title>
</head>
<body>
    <div class="container">
        <!-- Tarjeta 1: Producto -->
        <div class="card" style="width: 18rem; display: inline-block; margin: 10px;">
            <img src="https://www.infinitiaresearch.com/wp-content/uploads/2021/11/desarrollo-de-producto.png" class="card-img-top card-img" alt="Cliente">
            <div class="card-body">
                <h3 class="card-title">Producto</h3>
            </div>
            <ul class="list-group list-group-flush">
                <a href="link_a_la_base_de_datos_de_clientes" class="list-group-item list-group-item-action">Vender</a>
                <a href="link_a_la_base_de_datos_de_proveedores" class="list-group-item list-group-item-action">Consultar</a>
                <a href="link_a_la_base_de_datos_de_trabajadores" class="list-group-item list-group-item-action">Modificar</a>            </ul>
        </div>

        <!-- Tarjeta 2: Proveedor -->
        <div class="card" style="width: 16rem; display: inline-block; margin: 10px;">
            <img src="https://cdn.euroinnova.edu.es/img/subidasEditor/dise%C3%B1o%20sin%20t%C3%ADtulo%20-%202021-10-29t104425-1635933817.872" class="card-img-top card-img" alt="Proveedor">
            <div class="card-body">
                <h3 class="card-title">Proveedor</h3>
            </div>
            <ul class="list-group list-group-flush">
                <a href="link_a_la_base_de_datos_de_clientes" class="list-group-item list-group-item-action">Local</a>
                <a href="link_a_la_base_de_datos_de_proveedores" class="list-group-item list-group-item-action">Nacional</a>
                <a href="link_a_la_base_de_datos_de_trabajadores" class="list-group-item list-group-item-action">Internacional</a>
            </ul>
        </div>

        <!-- Tarjeta 3: Persona -->
        <div class="card" style="width: 18rem; display: inline-block; margin: 10px;">
            <img src="https://vetmarketportal.com.ar/uploads/noticias/5/20200723185329_cliente.jpeg" class="card-img-top card-img" alt="Trabajador">
            <div class="card-body">
                <h3 class="card-title">Persona</h3>
            </div>
            <ul class="list-group list-group-flush">
                <a href="link_a_la_base_de_datos_de_clientes" class="list-group-item list-group-item-action">Cliente</a>
                <a href="link_a_la_base_de_datos_de_proveedores" class="list-group-item list-group-item-action">Proveedor</a>
                <a href="link_a_la_base_de_datos_de_trabajadores" class="list-group-item list-group-item-action">Trabajador</a>
            </ul>
        </div>
    </div>
</body>

<!-- Pie de página -->
<footer style="background-color: #000; color: #fff; text-align: center; padding: 1px; font-size: 12px;">
    <p>Minimercado Envitrianón</p>
    <p>Calle 48 C sur Nro. 39ª – 166</p>
    <p>Envigado, Antioquia</p>
    <p>Teléfono: 3105482088</p>
    <p>Correo electrónico: <a href="mailto:envitrianon@gmail.com" style="font-size: 12px;">envitrianon@gmail.com</a></p>
</footer>

</html>
