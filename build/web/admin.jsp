<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Tradeo · Administración</title>
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

<div class="publicar-wrap">

  <div class="publicar-cabecera">
    <h1 class="publicar-titulo">Panel de administración</h1>
    <p class="publicar-sub">Gestiona el contenido y los usuarios de Tradeo</p>
  </div>

  <!-- Stats -->
  <div class="admin-stats">
    <div class="admin-stat">
      <span class="stat-num">${totalUsuarios}</span>
      <span class="stat-label">Usuarios</span>
    </div>
    <div class="admin-stat">
      <span class="stat-num">${totalFiguras}</span>
      <span class="stat-label">Figuras</span>
    </div>
    <div class="admin-stat">
      <span class="stat-num">${totalMarcasPendientes}</span>
      <span class="stat-label">Marcas pendientes</span>
    </div>
    <div class="admin-stat">
      <span class="stat-num">${totalSeriesPendientes}</span>
      <span class="stat-label">Series pendientes</span>
    </div>
  </div>

  <!-- Tabs -->
  <div class="perfil-tabs">
    <button class="tab tab-activo" onclick="cambiarTab('marcas', this)">Marcas</button>
    <button class="tab" onclick="cambiarTab('modelos', this)">Modelos</button>
    <button class="tab" onclick="cambiarTab('series', this)">Series</button>
    <button class="tab" onclick="cambiarTab('usuarios', this)">Usuarios</button>
    <button class="tab" onclick="cambiarTab('figuras', this)">Figuras</button>
  </div>

  <!-- Tab marcas -->
  <div id="tab-marcas" class="tab-contenido">
    <div class="admin-tabla">
      <div class="admin-fila admin-cabecera">
        <span>Nombre</span>
        <span>Estado</span>
        <span>Acciones</span>
      </div>
      <c:forEach var="marca" items="${marcas}">
      <div class="admin-fila">
        <span>${marca.nombre}</span>
        <c:choose>
          <c:when test="${marca.verificada == 1}">
        <span class="etiqueta etiqueta-venta">Verificada</span>
          </c:when>
          <c:otherwise>
            <span class="etiqueta etiqueta-intercambio">Pendiente</span>
          </c:otherwise>
        </c:choose>
        <div class="admin-acciones">
          <c:if test="${marca.verificada == 0}">
            <form method="post" action="${pageContext.request.contextPath}/admin/verificarMarca" style="display:inline;">
            <input type="hidden" name="idMarca" value="${marca.idMarca}">
            <button type="submit" class="btn-verificar">Verificar</button>
            </form>
          </c:if>
          <form method="post" action="${pageContext.request.contextPath}/admin/desactivarMarca" style="display:inline;">
            <input type="hidden" name="idMarca" value="${marca.idMarca}">
            <button type="submit" class="btn-eliminar">Desactivar</button>
          </form>
        </div>
      </div>
      </c:forEach>
    </div>
  </div>

  <!-- Tab modelos -->
  <div id="tab-modelos" class="tab-contenido" style="display:none;">
    <div class="admin-tabla">
      <div class="admin-fila admin-cabecera">
        <span>Nombre</span>
        <span>Marca</span>
        <span>Estado</span>
        <span>Acciones</span>
      </div>
      <c:forEach var="modelo" items="${modelos}">
      <div class="admin-fila">
        <span>${modelo.nombre}</span>
        <span>${modelo.nombreMarca}</span>
        <c:choose>
          <c:when test="${modelo.verificada == 1}">
            <span class="etiqueta etiqueta-venta">Verificado</span>
          </c:when>
          <c:otherwise>
            <span class="etiqueta etiqueta-intercambio">Pendiente</span>
          </c:otherwise>
        </c:choose>
        <div class="admin-acciones">
          <c:if test="${modelo.verificada == 0}">
            <form method="post" action="${pageContext.request.contextPath}/admin/verificarModelo" style="display:inline;">
              <input type="hidden" name="idModelo" value="${modelo.idModelo}">
              <button type="submit" class="btn-verificar">Verificar</button>
            </form>
          </c:if>
          <form method="post" action="${pageContext.request.contextPath}/admin/desactivarModelo" style="display:inline;">
            <input type="hidden" name="idModelo" value="${modelo.idModelo}">
            <button type="submit" class="btn-eliminar">Desactivar</button>
          </form>
        </div>
      </div>
      </c:forEach>
    </div>
  </div>

  <!-- Tab series -->
  <div id="tab-series" class="tab-contenido" style="display:none;">
    <div class="admin-tabla">
      <div class="admin-fila admin-cabecera">
        <span>Nombre</span>
        <span>Modelo</span>
        <span>Estado</span>
        <span>Acciones</span>
      </div>
      <c:forEach var="serie" items="${series}">
      <div class="admin-fila">
        <span>${serie.nombre}</span>
        <span>${serie.nombreModelo}</span>
        <c:choose>
          <c:when test="${serie.verificada == 1}">
        <span class="etiqueta etiqueta-venta">Verificada</span>
          </c:when>
          <c:otherwise>
            <span class="etiqueta etiqueta-intercambio">Pendiente</span>
          </c:otherwise>
        </c:choose>
        <div class="admin-acciones">
          <c:if test="${serie.verificada == 0}">
            <form method="post" action="${pageContext.request.contextPath}/admin/verificarSerie" style="display:inline;">
             <input type="hidden" name="idSerie" value="${serie.idSerie}">
             <button type="submit" class="btn-verificar">Verificar</button>
            </form>
          </c:if>
           <form method="post" action="${pageContext.request.contextPath}/admin/desactivarSerie" style="display:inline;">
            <input type="hidden" name="idSerie" value="${serie.idSerie}"> 
            <button type="submit" class="btn-eliminar">Desactivar</button>
           </form>
        </div>
      </div>
      </c:forEach>
    </div>
  </div>

  <!-- Tab usuarios -->
  <div id="tab-usuarios" class="tab-contenido" style="display:none;">
    <div class="admin-tabla">
      <div class="admin-fila admin-cabecera">
        <span>Usuario</span>
        <span>Email</span>
        <span>Rol</span>
        <span>Acciones</span>
      </div>
      <c:forEach var="usuario" items="${usuarios}">
      <div class="admin-fila">
        <span>${usuario.username}</span>
        <span>${usuario.email}</span>
        <c:choose>
          <c:when test="${usuario.rol == 'admin'}">
            <span class="etiqueta etiqueta-ambos">Admin</span>
          </c:when>
          <c:otherwise>
            <span class="etiqueta etiqueta-venta">Usuario</span>
          </c:otherwise>
        </c:choose>
        <div class="admin-acciones">
          <c:if test="${usuario.rol != 'admin'}">
            <form method="post" action="${pageContext.request.contextPath}/admin/hacerAdmin" style="display:inline;">
              <input type="hidden" name="idUsuario" value="${usuario.idUsuario}">
              <button type="submit" class="btn-verificar">Hacer admin</button>
            </form>
          </c:if>
          <form method="post" action="${pageContext.request.contextPath}/admin/desactivarUsuario" style="display:inline;">
            <input type="hidden" name="idUsuario" value="${usuario.idUsuario}">
            <button type="submit" class="btn-eliminar">Desactivar</button>
          </form>
        </div>
      </div>
      </c:forEach>
    </div>
  </div>

  <!-- Tab figuras -->
  <div id="tab-figuras" class="tab-contenido" style="display:none;">
    <div class="admin-tabla">
      <div class="admin-fila admin-cabecera">
        <span>Figura</span>
        <span>Usuario</span>
        <span>Estado</span>
        <span>Acciones</span>
      </div>
      <c:forEach var="figura" items="${figuras}">

      <div class="admin-fila">
        <span>${figura.nombreFigura} · ${figura.idSerie}</span>
        <span>${figura.username}</span>
        <c:choose>
          <c:when test="${figura.activa == 1}">
        <span class="etiqueta etiqueta-venta">Activa</span>
          </c:when>
          <c:otherwise>
            <span class="etiqueta etiqueta-intercambio">Inactiva</span>
          </c:otherwise>
        </c:choose>
        <div class="admin-acciones">
          <form method="post" action="${pageContext.request.contextPath}/admin/desactivarFigura" style="display:inline;">
            <input type="hidden" name="idFigura" value="${figura.idFigura}">
            <button type="submit" class="btn-eliminar">Desactivar</button>
          </form>
        </div>
      </div>
      </c:forEach>
    </div>
  </div>

</div>

<div class="footer">
  <p>Tradeo · Proyecto DAW</p>
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