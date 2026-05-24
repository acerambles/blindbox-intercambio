<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Tradeo · Página no encontrada</title>
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

<div class="auth-wrap">
  <div style="text-align:center;">
    <h1 style="font-size:6rem;font-weight:800;color:#f9d0e5;letter-spacing:-0.05em;margin-bottom:0;">404</h1>
    <h2 style="font-size:1.5rem;font-weight:800;letter-spacing:-0.03em;margin-bottom:0.5rem;">Página no encontrada</h2>
    <p style="color:#c490aa;font-size:0.9rem;margin-bottom:2rem;">
      La página que buscas no existe o ha sido eliminada.
    </p>
    <a href="${pageContext.request.contextPath}/index" class="btn-explorar">Volver al inicio</a>
  </div>
</div>

<div class="footer">
  <p>Tradeo · Proyecto DAW</p>
</div>

</body>
</html>