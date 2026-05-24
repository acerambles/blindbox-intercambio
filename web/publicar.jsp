<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
<title>Tradeo · Publicar figura</title>
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
        <h1 class="publicar-titulo">Publicar figura</h1>
        <p class="publicar-sub">Rellena los datos de tu figura para publicarla</p>
    </div>

    <c:if test="${not empty error}">
        <p style="color:#db2777;font-size:0.85rem;text-align:center;margin-bottom:1rem;">
            ${error}
        </p>
    </c:if>
    <div class="publicar-form">
        <form method="post" action="${pageContext.request.contextPath}/publicar">

        <!--Fotos-->
        <div class="form-grupo">
            <label class="form-label">Imagen de la figura *</label>
            <input type="text" name="imagenUrl" class="form-input"
                   placeholder="https://... pega aquí el enlace de tu foto">
            <p class="form-pista">Sube tu foto a Imgur o Google Fotos y pega el enlace aquí</p>
        </div>

        <!--Marca, modelo, serie-->
        <div class="form-fila-3">
            <div class="form-grupo">
                <label class="form-label">Marca *</label>
                <select class="form-input" name="idMarca" id="select-marca" onchange="cargarModelos()">
                    <option value="">Seleccionar...</option>
                </select>
                <input type="text" class="form-input" id="nueva-marca" 
                placeholder="Nombre de la nueva marca" 
                style="display: none; margin-top: 0.5rem;">
            </div>
            <div class="form-grupo">
                <label class="form-label">Modelo / IP *</label>
                <select class="form-input" name="idModelo" id="select-modelo" onchange="cargarSeries()">
                    <option value="">Seleccionar...</option>
                </select>
                <input type="text" class="form-input" id="nuevo-modelo"
                    placeholder="Nombre del nuevo modelo / IP" 
                    style="display: none; margin-top: 0.5rem;">
            </div>
            <div class="form-grupo">
                <label class="form-label">Serie *</label>
                <select class="form-input" name="idSerie" id="select-serie" onchange="comprobarSerie()">
                    <option value="">Seleccionar...</option>
                </select>
                <input type="text" class="form-input" id="nueva-serie" 
                placeholder="Nombre de la nueva serie"
                style="display: none; margin-top: 0.5rem;">
            </div>

        </div>

        <!--Nombre fig-->
        <div class="form-grupo">
            <label class="form-label">Estado de la figura *</label>
            <select class="form-input" name="condicion">
                <option value="">Seleccionar...</option>
                <option value="nueva_sellada">Nueva · Sellada</option>
                <option value="nueva_abierta">Nueva · Abierta</option>
                <option value="como_nueva">Como nueva</option>
                <option value="expuesta">Expuesta</option>
                <option value="buen_estado">Buen estado</option>
                <option value="con_detalles">Con detalles</option>
            </select>
        </div>

        <!--Tipo oferta-->
        <div class="form-grupo">
            <label class="form-label">¿Qué quieres hacer? *</label>
            <div class="tipo-opts">
                <div class="tipo-opt" onclick="selTipo(this, 'venta')">
                    <input type="radio" name="estado" value="venta" style="display: none;">
                    <p class="tipo-opt-label">Vender</p>
                </div>
                <div class="tipo-opt" onclick="selTipo(this, 'intercambio')">
                    <input type="radio" name="estado" value="intercambio" style="display: none;">
                    <p class="tipo-opt-label">Intercambiar</p>
                </div>
                <div class="tipo-opt" onclick="selTipo(this, 'ambos')">
                    <input type="radio" name="estado" value="ambos" style="display: none;">
                    <p class="tipo-opt-label">Ambas</p>
                </div>
            </div>
        </div>

        <!--Precio-->
        <div class="form-grupo">
            <label class="form-label">Precio (€)</label>
            <input type="number" name="precio" class="form-input" 
                   placeholder="0.00" style="max-width: 180px;">
            <p class="form-pista">Deja en blanco si solo quieres intercambiar.</p>
        </div>
        
        <!-- Nombre figura -->
        <div class="form-grupo">
            <label class="form-label">Nombre de la figura</label>
            <input type="text" name="nombreFigura" class="form-input" 
                   placeholder="Opcional · Ej: The Trust">
            <p class="form-pista">Si no recuerdas el nombre exacto puedes dejarlo en blanco.</p>
        </div>

        <!--Busca-->
        <div class="form-grupo">
            <label class="form-label">¿Qué buscas a cambio?</label>
            <textarea name="busca" class="form-input form-textarea" 
                      placeholder="Ej: Busco cualquier figura de Labubu o Hirono Shelter series..."></textarea>
            <p class="form-pista">Solo si quieres intercambiar.</p>
        </div>

        <!--Descripcion-->
        <div class="form-grupo">
            <label class="form-label">Descripción</label>
            <textarea name="descripcion" class="form-input form-textarea" 
                      placeholder="Describe el estado, si tiene caja original..."></textarea>  
        </div>

        <!--Botones-->
        <div class="publicar-botones">
            <a href="${pageContext.request.contextPath}/index" class="btn-cancelar">Cancelar</a>
            <button type="submit" class="btn-login">Publicar figura</button>
        </div>
        </form>
    </div>
</div>

<div class="footer">
  <p>Tradeo · Proyecto DAW</p>
</div>

<script src="${pageContext.request.contextPath}/js/datos.js"></script>">

</body>
</html>
