<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Tradeo · Inicio</title>
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
  <a href="${pageContext.request.contextPath}/index" class="activo">Inicio</a>
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

<div class="inicio">
    <p class="inicio-eyebrow">Comunidad de coleccionistas</p>
    <h1 class="inicio-titulo">El espacio para tus figuras <span> blind box</span></h1>
    <p class="inicio-sub">Compra, vende e intercambia figuras con otros coleccionistas.</p>
    <div class="inicio-botones">
        <a href="${pageContext.request.contextPath}/explorar" class="btn-explorar">Explorar figuras</a>
        <a href="${pageContext.request.contextPath}/publicar" class="btn-publicar">Publicar la mía</a>
    </div>
</div>
<div class="figuras">
    <div class="figuras-cabecera">
        <h2>Publicaciones recientes</h2>
        <a href="${pageContext.request.contextPath}/explorar">Ver todas</a>
    </div>
    <div class="figuras-grid">
        <c:forEach var="figura" items="${figuras}">   
        <div class="tarjeta" onclick="window.location='${pageContext.request.contextPath}/detalle?id=${figura.idFigura}'">
            <div class="tarjeta-img">
                <span class="condicion">${figura.condicionTexto}</span>
                    <c:choose>
                        <c:when test="${not empty figura.imagenUrl}">
                            <img src="${figura.imagenUrl}" alt="${figura.nombreFigura}" style="width:100%;height:100%;object-fit:cover;">
            </c:when>
            <c:otherwise>
                S
            </c:otherwise>
                    </c:choose>
            </div>
            <div class="tarjeta-cuerpo">
                <p class="tarjeta-meta">${figura.nombreModelo} · ${figura.nombreMarca}</p>
                <p class="tarjeta-nombre">${figura.nombreSerie}</p>
                <c:if test="${not empty figura.nombreFigura}">
                    <p style="font-size:0.78rem;color:#7a3558;">${figura.nombreFigura}</p>
                </c:if>
                <p class="tarjeta-ciudad">${figura.ciudad}</p>
                <c:if test="${not empty figura.busca}">
                   <p class="tarjeta-busca"><strong>Busca:</strong> ${figura.busca}</p>
                   </c:if>
                <span class="etiqueta etiqueta-${figura.estado}">${figura.estado}</span>
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
</div>
<div class="footer">
  <p>Tradeo · Proyecto DAW</p>
</div>
<script src="${pageContext.request.contextPath}/js/datos.js"></script>
</body>
</html>