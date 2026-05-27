<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Tradeo · Detalle</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
    
<div class="topnav">
  <a href="${pageContext.request.contextPath}/index" class="logo">Trade<span>o</span></a>
  <div class="nav-enlaces">
  <a href="${pageContext.request.contextPath}/index">Inicio</a>
  <a href="${pageContext.request.contextPath}/explorar">Explorar</a>
    <c:if test="${not empty sessionScope.idUsuario}">
  <a href="${pageContext.request.contextPath}/publicar">Publicar</a>
    </c:if>
</div>
<div class="nav-acciones">
    <c:choose>
        <c:when test="${not empty sessionScope.idUsuario}">
    <a href="${pageContext.request.contextPath}/perfil">${sessionScope.username}</a>
    <a href="${pageContext.request.contextPath}/logout" class="btn-registro">Cerrar sesion</a>
        </c:when>
        <c:otherwise>
    <a href="${pageContext.request.contextPath}/login">Entrar</a>
    <a href="${pageContext.request.contextPath}/registro" class="btn-registro">Registrarse</a>
        </c:otherwise>
    </c:choose>
</div>
</div>

<!--Boton volver-->
<div class="volver">
    <a href="${pageContext.request.contextPath}/explorar" class="btn-volver">← Volver</a>
</div>

<!--Detalle-->
<div class="detalle">

    <!--Columna izquierda-->
    <div class="detalle-izquierda">
        <div class="detalle-img">
            <c:choose>
                <c:when test="${not empty figura.imagenUrl}">
                    <img src="${figura.imagenUrl}" alt="${figura.nombreFigura}" style="width:100%;height:100%;object-fit:cover;border-radius:16px;">
                </c:when>
                <c:otherwise>
                    S
                </c:otherwise>
            </c:choose>
        </div>
        <div class="detalle-miniaturas">
            <c:choose>
                <c:when test="${not empty figura.imagenUrl}">
                    <div class="miniatura activa-min">
                        <img src="${figura.imagenUrl}" alt="${figura.nombreFigura}" 
                            style="width:100%;height:100%;object-fit:cover;border-radius:10px;">
                        </div>
                </c:when>
                <c:otherwise>
                    <div class="miniatura activa-min">S</div>
                    <div class="miniatura">S</div>
                    <div class="miniatura">S</div>
                </c:otherwise>
            </c:choose>
        </div>

        <h3 class="comentarios-titulo">Comentarios</h3>

        <c:forEach var="mensaje" items="${mensajes}">
        <div class="comentario">
            <div class="comentario-avatar">${fn:substring(mensaje.username, 0, 1)}
            </div>
            <div class="comentario-cuerpo">
                <div class="comentario-cabecera">
                    <span class="comentario-nombre">${mensaje.username}</span>
                    <c:if test="${mensaje.idRemitente == figura.idUsuario}">
                    <span class="comentario-vendedor">Vendedor</span>
                    </c:if>
                    <span class="comentario-tiempo">${mensaje.fecha}</span>
                </div>
                <div class="comentario-texto">${mensaje.contenido}</div>
            </div>
        </div>
        </c:forEach>

        <c:choose>
            <c:when test="${not empty sessionScope.idUsuario}">
        <div class="comentario-nuevo">
            <div class="comentario-avatar">${fn:substring(sessionScope.username, 0, 1)}</div>
            <form method="post" action="${pageContext.request.contextPath}/mensaje" 
            style="display:flex;gap:0.6rem;flex:1;">
            <input type="hidden" name="idFigura" value="${figura.idFigura}"> 
            <input type="text" name="contenido" class="comentario-input" 
            placeholder="Escribe un comentario...">
            <button type="submit" class="comentario-btn">Enviar</button>
            </form>
        </div>
            </c:when>
            <c:otherwise>
              <p style="font-size:0.85rem;color:#c490aa;margin-top:1rem;">
                <a href="${pageContext.request.contextPath}/login">Inicia sesion</a> para dejar un comentario. 
              </p>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Columna derecha-->
     <div class="detalle-derecha">

        <div class="panel">
            <span class="etiqueta etiqueta-${figura.estado}">${figura.estado}</span>
            <h1 class="detalle-titulo">${figura.nombreSerie}</h1>
            <p class="detalle-subtitulo">${figura.nombreModelo} · ${figura.nombreMarca}</p>
            <c:if test="${not empty figura.nombreFigura}">
                <p style="font-size:0.85rem;color:#7a3558;margin-bottom:1rem;">${figura.nombreFigura}</p>
            </c:if>
            <p class="detalle-precio">
                <c:choose>
                    <c:when test="${figura.precio > 0}">
                        ${figura.precio} €
                    </c:when>
                    <c:otherwise>
                        Intercambio
                    </c:otherwise>
                </c:choose>
            </p>
            <c:choose>
                <c:when test="${not empty sessionScope.idUsuario}">
                    <button class="btn-contactar"
                            onclick="document.querySelector('.comentario-input').focus()">
                      Contactar al vendedor
                    </button>
                    <button class="btn-wishlist">Añadir a wishlist</button>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login" class="btn-contactar"
                    style="display:block;text-align:center;text-decoration:none;">
                    Inicia sesion para contactar
                    </a>
                    <a href="${pageContext.request.contextPath}/login" 
                    class="btn-wishlist" 
                    style="display:block;text-align:center;text-decoration:none;">
                    Añadir a wishlist
                </a>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="panel">
            <h3 class="panel-titulo">Detalles</h3>
            <div class="detalle-fila">
                <span class="detalle-clave">Marca</span>
                <span class="detalle-valor">${figura.nombreMarca}</span>
            </div>
            <div class="detalle-fila">
                <span class="detalle-clave">Modelo</span>
                <span class="detalle-valor">${figura.nombreModelo}</span>
            </div>
            <div class="detalle-fila">
                <span class="detalle-clave">Serie</span>
                <span class="detalle-valor">${figura.nombreSerie}</span>
            </div>
            <div class="detalle-fila">
                <span class="detalle-clave">Figura</span>
                <span class="detalle-valor">
                   <c:choose>
                    <c:when test="${not empty figura.nombreFigura}">
                        ${figura.nombreFigura}
                    </c:when>
                    <c:otherwise>
                        No especificado
                    </c:otherwise>
                   </c:choose> 
                </span>
            </div>
            <div class="detalle-fila">
                <span class="detalle-clave">Estado</span>
                <span class="detalle-valor">${figura.condicionTexto}</span>
            </div>
            <c:if test="${not empty figura.busca}">
            <div class="detalle-fila">
                <span class="detalle-clave">Busca</span>
                <span class="detalle-valor">${figura.busca}</span>
            </div>
            </c:if>
            <c:if test="${not empty figura.descripcion}">
            <div class="detalle-fila">
                <span class="detalle-clave">Descripción</span>
                <span class="detalle-valor">${figura.descripcion}</span>
            </div>
            </c:if>
        </div>
        <div class="panel">
            <h3 class="panel-titulo">Vendedor</h3>
            <div class="vendedor">
                <div class="comentario-avatar">${fn:substring(vendedor.username, 0, 1)}</div>
            <div>
        <p class="vendedor-nombre">${vendedor.username}</p>
        <p class="vendedor-info">${figura.ciudad}</p>
            </div>
    </div>
 </div>
</div>
</div>
<div class="footer">
  <p>Tradeo · Proyecto DAW</p>
</div>

</body>
</html>