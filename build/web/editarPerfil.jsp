<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Tradeo · Editar perfil</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
    
<<div class="topnav">
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

<div class="publicar-wrap">

  <div class="publicar-cabecera">
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

    <h1 class="publicar-titulo">Editar perfil</h1>
    <p class="publicar-sub">Actualiza tu informacion personal</p>
  </div>

  <div class="publicar-form">

    <form method="post" action="${pageContext.request.contextPath}/editarPerfil">

    <div class="form-grupo">
      <label class="form-label">Nombre de usuario</label>
      <input type="text" name="username" class="form-input" value="${usuario.username}">
    </div>

    <div class="form-grupo">
      <label class="form-label">Nombre completo</label>
      <input type="text" name="nombre" class="form-input" value="${usuario.nombre}">
    </div>

    <div class="form-grupo">
      <label class="form-label">Correo electronico</label>
      <input type="email" name="email" class="form-input" value="${usuario.email}">
    </div>

    <div class="form-fila">
      <div class="form-grupo">
        <label class="form-label">Pais</label>
        <input type="text" name="pais" class="form-input" value="${usuario.pais}">
      </div>

      <div class="form-grupo">
        <label class="form-label">Ciudad</label>
        <input type="text" name="ciudad" class="form-input" value="${usuario.ciudad}">
      </div>
    </div>

    <div class="form-grupo">
      <label class="form-label">Mostrar nombre completo en el perfil</label>
      <div style="display:flex;align-items:center;gap:0.5rem;">
        <input type="checkbox" name="mostrarNombre" value="1" ${usuario.mostrarNombre == 1 ? 'checked' : ''}>
        <span style="font-size:0.85rem;color:#7a3558;">
          Mostrar mi nombre completo publicamente
        </span>
      </div>
    </div>

    <hr style="border:none;border-top:1px solid #f9d0e5;margin:1.5rem 0;">

    <div style="margin-bottom:1rem;">
      <h2 style="font-size:1rem;font-weight:700;margin-bottom:0.3rem;">Cambiar contrasena</h2>
      <p class="publicar-sub">Deja en blanco si no quieres cambiarla</p>
    </div>

    <div class="form-grupo">
      <label class="form-label">Nueva contrasena</label>
      <input type="password" class="form-input" placeholder="Minimo 8 caracteres">
    </div>

    <div class="form-grupo">
      <label class="form-label">Confirmar nueva contrasena</label>
      <input type="password" class="form-input" placeholder="Repite la nueva contrasena">
    </div>

    <div class="publicar-botones">
      <a href="${pageContext.request.contextPath}/perfil" class="btn-cancelar">Cancelar</a>
      <button type="submit" class="btn-login">Guardar cambios</button>
    </div>

  </div>
</div>

<div class="footer">
  <p>Tradeo · Proyecto DAW</p>
</div>

</body>
</html>