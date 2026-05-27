<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Tradeo · Perfil</title>
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
  <a href="${pageContext.request.contextPath}/publicar" class="activo">Publicar</a>
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

<!--Perfil-->
<div class="perfil-wrap">

    <!--Cabecera perfil-->
    <div class="perfil-cabecera">
        <div class="perfil-avatar">${fn:substring(usuario.username, 0, 1)}</div>
        <div class="perfil-info">
            <h1 class="perfil-nombre">${usuario.username}</h1>
            <c:if test="${usuario.mostrarNombre == 1}">
                <p class="perfil-nombre-completo">${usuario.nombre}</p>
            </c:if>
            <p class="perfil-meta">${usuario.ciudad}</p>
            <div class="perfil-stats">
                <div class="stat">
                    <span class="stat-num">${fn:length(figuras)}</span>
                    <span class="stat-label">Publicaciones</span>
                </div>
                <div class="stat">
                    <span class="stat-num">0</span>
                    <span class="stat-label">Intercambios</span>
                </div>
                <div class="stat">
                    <span class="stat-num">0</span>
                    <span class="stat-label">Wishlist</span>
                </div>
            </div>
        </div>
                    <a href="${pageContext.request.contextPath}/editarPerfil" class="btn-editar">Editar perfil</a>
    </div>

    <!--Tabs-->
    <div class="perfil-tabs">
        <button class="tab tab-activo" onclick="cambiarTab('publicaciones', this)">Publicaciones</button>
        <button class="tab" onclick="cambiarTab('coleccion', this)">Coleccion</button>
        <button class="tab" onclick="cambiarTab('wishlist', this)">Wishlist</button>
    </div>

    <!--Tab publicaciones-->
    <div id="tab-publicaciones" class="tab-contenido">
        <c:choose>
            <c:when test="${not empty figuras}">
                <div class="figuras-grid">
                    <c:forEach var="figura" items="${figuras}">
                        <div class="tarjeta" onclick="window.location='${pageContext.request.contextPath}/detalle?id=${figura.idFigura}'">
                            <div class="tarjeta-img">
                                <span class="condicion">${figura.condicionTexto}</span>
                                <c:choose>
                                    <c:when test="${not empty figura.imagenUrl}">
                                        <img src="${figura.imagenUrl}" alt="${figura.nombreFigura}" style="width:100%;height:100%;object-fit:cover;">
                                    </c:when>
                                        <c:otherwise>S</c:otherwise>
                                </c:choose>
                            </div>
                <div class="tarjeta-cuerpo">
                    <p class="tarjeta-meta">${figura.nombreModelo} · ${figura.nombreMarca}</p>
                    <p class="tarjeta-nombre">${figura.nombreSerie}</p>
                    <c:if test="${not empty figura.nombreFigura}">
                        <p style="font-size:0.78rem;color:#7a3558;">${figura.nombreFigura}</p>
                    </c:if>
                    <span class="etiqueta etiqueta-${figura.estado}">${figura.estado}</span>
                    <p class="tarjeta-ciudad">${figura.ciudad}</p>
                    <div class="tarjeta-foot">
                        <c:choose>
                            <c:when test="${figura.precio > 0}">
                                <p class="tarjeta-precio">${figura.precio} €</p>
                            </c:when>
                            <c:otherwise>
                                <p class="tarjeta-precio">—</p>
                            </c:otherwise>
                        </c:choose>
                </div>
            </div>
        </div>
                    </c:forEach>
    </div>
            </c:when>
            <c:otherwise>
                <p style="color:#c490aa;font-size:0.9rem;text-align:center;padding:2rem;">
                    Todavia no has publicado ninguna figura.
                    <a href="${pageContext.request.contextPath}/publicar" style="color:#db2777;">Publica tu primera figura</a>
                </p>
            </c:otherwise>
        </c:choose>
    </div>

    <!--Tab colección-->
    <div id="tab-coleccion" class="tab-contenido" style="display: none;">
        <div class="figuras-grid">
            <div class="tarjeta">
                <div class="tarjeta-img">
                    <span class="condicion">En colección</span>
                    L
                </div>
                <div class="tarjeta-cuerpo">
                    <p class="tarjeta-meta">Labubu · Pop Mart</p>
                    <p class="tarjeta-nombre">Forest Concert Series</p>
                    <p class="tarjeta-ciudad">Madrid</p>
                    <span class="etiqueta etiqueta-serie">En colección</span>
                </div>
            </div>
        </div>
    </div>

    <!--Tab wishlist-->
    <div id="tab-wishlist" class="tab-contenido" style="display: none;">
        <div class="wishlist-lista">

            <div class="wish-item">
                <div class="wish-thumb">D</div>
                <div class="wish-info">
                    <p class="wish-nombre">Dimoo · Space Travel Series</p>
                    <p class="wish-meta">Pop Mart · Añadido hace 3 días</p>
                </div>
                <button class="btn-eliminar">Eliminar</button>
            </div>

            <div class="wish-item">
                <div class="wish-thumb">H</div>
                <div class="wish-info">
                    <p class="wish-nombre">Hirono · Shelter Series</p>
                    <p class="wish-meta">Pop Mart · Añadido hace 1 semana</p>
                </div>
                <button class="btn-eliminar">Eliminar</button>
            </div>

            <div class="wish-item">
                <div class="wish-thumb">P</div>
                <div class="wish-info">
                    <p class="wish-nombre">Pucky · Home Time Series</p>
                    <p class="wish-meta">Pop Mart · Añadido hace 2 semanas</p>
                </div>
                <button class="btn-eliminar">Eliminar</button>
            </div>
        </div>
    </div>
</div>

<div class="footer">
  <p>Tradeo · Proyecto DAW· <a href="${pageContext.request.contextPath}/politicaCookies">Política de cookies</a></p>
</div>

<script>
function cambiarTab(tab, btn) {
  document.querySelectorAll('.tab-contenido').forEach(function(t) {
    t.style.display = 'none';
  });
  document.getElementById('tab-' + tab).style.display = 'block';
  document.querySelectorAll('.tab').forEach(function(b) {
    b.classList.remove('tab-activo');
  });
  btn.classList.add('tab-activo');
}
</script>

</body>
</html>