<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <title>Tradeo · Política de cookies</title>
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

<div class="publicar-wrap">

  <div class="publicar-cabecera">
    <h1 class="publicar-titulo">Política de cookies</h1>
    <p class="publicar-sub">Última actualización: Mayo 2026</p>
  </div>

  <div class="publicar-form" style="padding:2rem;">

    <h2 style="font-size:1rem;font-weight:700;margin-bottom:0.5rem;">¿Qué son las cookies?</h2>
    <p style="font-size:0.9rem;color:#7a3558;margin-bottom:1.5rem;">
      Las cookies son pequeños archivos de texto que se almacenan en tu dispositivo cuando visitas un sitio web. Se utilizan para recordar tus preferencias y mejorar tu experiencia de navegación.
    </p>

    <h2 style="font-size:1rem;font-weight:700;margin-bottom:0.5rem;">Cookies que utilizamos</h2>
    <div class="admin-tabla" style="margin-bottom:1.5rem;">
      <div class="admin-fila admin-cabecera">
        <span>Tipo</span>
        <span>Finalidad</span>
        <span>Duración</span>
      </div>
      <div class="admin-fila">
        <span>Sesión</span>
        <span>Mantener al usuario logueado</span>
        <span>Al cerrar el navegador</span>
      </div>
      <div class="admin-fila">
        <span>Preferencias</span>
        <span>Recordar ajustes del usuario</span>
        <span>30 días</span>
      </div>
    </div>

    <h2 style="font-size:1rem;font-weight:700;margin-bottom:0.5rem;">Base legal</h2>
    <p style="font-size:0.9rem;color:#7a3558;margin-bottom:1.5rem;">
      El uso de cookies de sesión está basado en el interés legítimo para el funcionamiento de la plataforma. Las cookies de preferencias requieren tu consentimiento conforme al Reglamento General de Protección de Datos (RGPD) de la Unión Europea.
    </p>

    <h2 style="font-size:1rem;font-weight:700;margin-bottom:0.5rem;">¿Cómo gestionar las cookies?</h2>
    <p style="font-size:0.9rem;color:#7a3558;margin-bottom:1.5rem;">
      Puedes configurar tu navegador para rechazar todas las cookies o para que te avise cuando se envía una cookie. Ten en cuenta que si rechazas las cookies de sesión no podrás iniciar sesión en Tradeo.
    </p>

    <h2 style="font-size:1rem;font-weight:700;margin-bottom:0.5rem;">Contacto</h2>
    <p style="font-size:0.9rem;color:#7a3558;margin-bottom:1.5rem;">
      Si tienes alguna pregunta sobre nuestra política de cookies puedes contactarnos a través del formulario de contacto de la plataforma.
    </p>

    <div style="text-align:center;margin-top:2rem;">
      <a href="${pageContext.request.contextPath}/index" class="btn-explorar">Volver al inicio</a>
    </div>

  </div>
</div>

<div class="footer">
  <p>Tradeo · Proyecto DAW· <a href="${pageContext.request.contextPath}/politicaCookies">Política de cookies</a></p>
</div>

</body>
</html>
