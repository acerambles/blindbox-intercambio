/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blindboxintercambio.modelo;

public class Usuario {

    // ── Atributos (columnas de la tabla usuarios) ──
    private int     idUsuario;
    private String  nombre;
    private String  username;
    private String  email;
    private String  password;
    private String  pais;
    private String  ciudad;
    private int     activo;
    private String  rol;
    private int     mostrarNombre;

    // ── Constructor vacío ─────────────────
    public Usuario() {}

    // ── Getters y Setters ──────────────────────────────────────────

    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getPais() { return pais; }
    public void setPais(String pais) { this.pais = pais; }

    public String getCiudad() { return ciudad; }
    public void setCiudad(String ciudad) { this.ciudad = ciudad; }

    public int getActivo() { return activo; }
    public void setActivo(int activo) { this.activo = activo; }

    public String getRol() { return rol; }
    public void setRol(String rol) { this.rol = rol; }

    public int getMostrarNombre() { return mostrarNombre; }
    public void setMostrarNombre(int mostrarNombre) { this.mostrarNombre = mostrarNombre; }
}