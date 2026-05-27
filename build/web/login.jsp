<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Tradeo · Iniciar sersión</title>
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

<!-- Login-->
 <div class="auth-wrap">
    <div class="auth-card">

        <div class="auth-logo">Trade<span>o</span></div>
        <p class="auth-sub">Inicia sesión en tu cuenta</p>

        <c:if test="${not empty error}">
           <p style="color:#db2777;font-size:0.85rem;text-align:center;margin-bottom:1rem;">
                ${error}
            </p> 
        </c:if>

        <c:if test="${not empty exito}">
            <p style="color:#059669;font-size:0.85rem;text-align:center;margin-bottom:1rem;">
                ${exito}
            </p>
        </c:if>

        <form method="post" action="${pageContext.request.contextPath}/login">
        <div class="form-grupo">
            <label class="form-label">Email o nombre de usuario</label>
            <input type="text" name="login" class="form-input" placeholder="tu@ejemplo.com o usuario">
        </div>
        <div class="form-grupo">
            <label class="form-label">Contraseña</label>
            <input type="password" name="password" class="form-input" placeholder="********">
        </div>
        <button type="submit" class="btn-login">Iniciar sesión</button>
        </form>

        <div class="auth-separador">o</div>

        <p class="auth-pie">
            ¿No tienes cuenta? <a href="${pageContext.request.contextPath}/registro">Registrate</a>
        </p>
    </div>
 </div>
<div class="footer">
  <p>Tradeo · Proyecto DAW· <a href="${pageContext.request.contextPath}/politicaCookies">Política de cookies</a></p>
</div>

</body>
</html>