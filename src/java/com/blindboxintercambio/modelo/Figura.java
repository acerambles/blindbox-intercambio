/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blindboxintercambio.modelo;

public class Figura {

    // ── Atributos (equivalen a las columnas de la tabla figuras) ──
    private int    idFigura;
    private int    idUsuario;
    private int    idSerie;
    private String nombreFigura;
    private int    nombreVerificado;
    private double precio;
    private String estado;
    private String condicion;
    private String busca;
    private String descripcion;
    private String imagenUrl;
    private String fechaPub;
    private int    activa;
    private String nombreSerie;
    private String nombreModelo;
    private String nombreMarca;
    private String username;
    private String ciudad;

    // ── Constructor vacío ──────────────────────────────────────────
    public Figura() {}

    // ── Getters y Setters ──────────────────────────────────────────

    public int getIdFigura() { return idFigura; }
    public void setIdFigura(int idFigura) { this.idFigura = idFigura; }

    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }

    public int getIdSerie() { return idSerie; }
    public void setIdSerie(int idSerie) { this.idSerie = idSerie; }

    public String getNombreFigura() { return nombreFigura; }
    public void setNombreFigura(String nombreFigura) { this.nombreFigura = nombreFigura; }

    public int getNombreVerificado() { return nombreVerificado; }
    public void setNombreVerificado(int nombreVerificado) { this.nombreVerificado = nombreVerificado; }

    public double getPrecio() { return precio; }
    public void setPrecio(double precio) { this.precio = precio; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }

    public String getCondicion() { return condicion; }
    public void setCondicion(String condicion) { this.condicion = condicion; }

    public String getBusca() { return busca; }
    public void setBusca(String busca) { this.busca = busca; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public String getImagenUrl() { return imagenUrl; }
    public void setImagenUrl(String imagenUrl) { this.imagenUrl = imagenUrl; }

    public String getFechaPub() { return fechaPub; }
    public void setFechaPub(String fechaPub) { this.fechaPub = fechaPub; }

    public int getActiva() { return activa; }
    public void setActiva(int activa) { this.activa = activa; }
    
    public String getNombreSerie() { return nombreSerie; }
    public void setNombreSerie(String nombreSerie) { this.nombreSerie = nombreSerie; }
    
    public String getNombreModelo() { return nombreModelo; }
    public void setNombreModelo(String nombreModelo) { this.nombreModelo = nombreModelo; }

    public String getNombreMarca() { return nombreMarca; }
    public void setNombreMarca(String nombreMarca) { this.nombreMarca = nombreMarca; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getCiudad() { return ciudad; }
    public void setCiudad(String ciudad) { this.ciudad = ciudad; }
    
    public String getCondicionTexto() {
    switch (condicion) {
        case "nueva_sellada": return "Nueva · Sellada";
        case "nueva_abierta": return "Nueva · Abierta";
        case "como_nueva":    return "Como nueva";
        case "displayed":     return "Expuesta";
        case "buen_estado":   return "Buen estado";
        case "con_detalles":  return "Con detalles";
        default:              return condicion;
    }
}
}