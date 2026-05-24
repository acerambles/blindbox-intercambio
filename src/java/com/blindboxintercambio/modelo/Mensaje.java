/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blindboxintercambio.modelo;

public class Mensaje {

    // ── Atributos (equivalen a las columnas de la tabla mensajes) ──
    private int    idMensaje;
    private int    idFigura;
    private int    idRemitente;
    private String contenido;
    private String fecha;

    // ── Constructor vacío ──────────────────────────────────────────
    public Mensaje() {}

    // ── Getters y Setters ──────────────────────────────────────────

    public int getIdMensaje() { return idMensaje; }
    public void setIdMensaje(int idMensaje) { this.idMensaje = idMensaje; }

    public int getIdFigura() { return idFigura; }
    public void setIdFigura(int idFigura) { this.idFigura = idFigura; }

    public int getIdRemitente() { return idRemitente; }
    public void setIdRemitente(int idRemitente) { this.idRemitente = idRemitente; }

    public String getContenido() { return contenido; }
    public void setContenido(String contenido) { this.contenido = contenido; }

    public String getFecha() { return fecha; }
    public void setFecha(String fecha) { this.fecha = fecha; }
}