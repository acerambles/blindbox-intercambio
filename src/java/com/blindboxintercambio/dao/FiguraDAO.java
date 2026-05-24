/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blindboxintercambio.dao;

import com.blindboxintercambio.modelo.Figura;
import com.blindboxintercambio.util.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FiguraDAO {

    // ── Insertar nueva figura ──────────────────────────────────────
    public boolean insertar(Figura f) {
        String sql = "INSERT INTO figuras (id_usuario, id_serie, nombre_figura, precio, estado, condicion, busca, descripcion, imagen_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, f.getIdUsuario());
            ps.setInt(2, f.getIdSerie());
            ps.setString(3, f.getNombreFigura());
            ps.setDouble(4, f.getPrecio());
            ps.setString(5, f.getEstado());
            ps.setString(6, f.getCondicion());
            ps.setString(7, f.getBusca());
            ps.setString(8, f.getDescripcion());
            ps.setString(9, f.getImagenUrl());

            return ps.executeUpdate() == 1;

        } catch (SQLException e) {
            System.err.println("Error al insertar figura: " + e.getMessage());
            return false;
        }
    }

    // ── Listar figuras recientes ───────────────────────────────────
    public List<Figura> listarRecientes() {
        List<Figura> lista = new ArrayList<>();
        String sql = "SELECT * FROM figuras WHERE activa = 1 ORDER BY fecha_pub DESC LIMIT 6";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Figura f = new Figura();
                f.setIdFigura(rs.getInt("id_figura"));
                f.setIdUsuario(rs.getInt("id_usuario"));
                f.setIdSerie(rs.getInt("id_serie"));
                f.setNombreFigura(rs.getString("nombre_figura"));
                f.setPrecio(rs.getDouble("precio"));
                f.setEstado(rs.getString("estado"));
                f.setCondicion(rs.getString("condicion"));
                f.setBusca(rs.getString("busca"));
                f.setDescripcion(rs.getString("descripcion"));
                f.setImagenUrl(rs.getString("imagen_url"));
                f.setFechaPub(rs.getString("fecha_pub"));
                lista.add(f);
            }

        } catch (SQLException e) {
            System.err.println("Error al listar figuras: " + e.getMessage());
        }
        return lista;
    }

    // ── Listar figuras por usuario ─────────────────────────────────
    public List<Figura> listarPorUsuario(int idUsuario) {
        List<Figura> lista = new ArrayList<>();
        String sql = "SELECT * FROM figuras WHERE id_usuario = ? AND activa = 1 ORDER BY fecha_pub DESC";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Figura f = new Figura();
                f.setIdFigura(rs.getInt("id_figura"));
                f.setIdUsuario(rs.getInt("id_usuario"));
                f.setIdSerie(rs.getInt("id_serie"));
                f.setNombreFigura(rs.getString("nombre_figura"));
                f.setPrecio(rs.getDouble("precio"));
                f.setEstado(rs.getString("estado"));
                f.setCondicion(rs.getString("condicion"));
                f.setBusca(rs.getString("busca"));
                f.setDescripcion(rs.getString("descripcion"));
                f.setImagenUrl(rs.getString("imagen_url"));
                f.setFechaPub(rs.getString("fecha_pub"));
                lista.add(f);
            }

        } catch (SQLException e) {
            System.err.println("Error al listar figuras por usuario: " + e.getMessage());
        }
        return lista;
    }

    // ── Buscar figura por ID ───────────────────────────────────────
    public Figura buscarPorId(int id) {
        String sql = "SELECT * FROM figuras WHERE id_figura = ? AND activa = 1";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Figura f = new Figura();
                f.setIdFigura(rs.getInt("id_figura"));
                f.setIdUsuario(rs.getInt("id_usuario"));
                f.setIdSerie(rs.getInt("id_serie"));
                f.setNombreFigura(rs.getString("nombre_figura"));
                f.setPrecio(rs.getDouble("precio"));
                f.setEstado(rs.getString("estado"));
                f.setCondicion(rs.getString("condicion"));
                f.setBusca(rs.getString("busca"));
                f.setDescripcion(rs.getString("descripcion"));
                f.setImagenUrl(rs.getString("imagen_url"));
                f.setFechaPub(rs.getString("fecha_pub"));
                return f;
            }

        } catch (SQLException e) {
            System.err.println("Error al buscar figura: " + e.getMessage());
        }
        return null;
    }

    // ── Desactivar figura ──────────────────────────────────────────
    public boolean desactivar(int idFigura) {
        String sql = "UPDATE figuras SET activa = 0 WHERE id_figura = ?";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idFigura);
            return ps.executeUpdate() == 1;

        } catch (SQLException e) {
            System.err.println("Error al desactivar figura: " + e.getMessage());
            return false;
        }
    }
    // ── Listar todas las figuras con filtros ───────────────────────
public List<Figura> listarTodas(String busqueda, String estado, String marca) {
    List<Figura> lista = new ArrayList<>();

    StringBuilder sql = new StringBuilder(
        "SELECT f.* FROM figuras f " +
        "JOIN series s ON f.id_serie = s.id_serie " +
        "JOIN modelos mo ON s.id_modelo = mo.id_modelo " +
        "JOIN marcas ma ON mo.id_marca = ma.id_marca " +
        "WHERE f.activa = 1 "
    );

    if (busqueda != null && !busqueda.trim().isEmpty()) {
        sql.append("AND (f.nombre_figura LIKE ? OR s.nombre LIKE ? OR mo.nombre LIKE ?) ");
    }
    if (estado != null && !estado.trim().isEmpty()) {
        sql.append("AND f.estado = ? ");
    }
    if (marca != null && !marca.trim().isEmpty()) {
        sql.append("AND ma.nombre = ? ");
    }

    sql.append("ORDER BY f.fecha_pub DESC");

    try (Connection con = ConexionDB.getConexion();
         PreparedStatement ps = con.prepareStatement(sql.toString())) {

        int i = 1;
        if (busqueda != null && !busqueda.trim().isEmpty()) {
            ps.setString(i++, "%" + busqueda + "%");
            ps.setString(i++, "%" + busqueda + "%");
            ps.setString(i++, "%" + busqueda + "%");
        }
        if (estado != null && !estado.trim().isEmpty()) {
            ps.setString(i++, estado);
        }
        if (marca != null && !marca.trim().isEmpty()) {
            ps.setString(i++, marca);
        }

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Figura f = new Figura();
            f.setIdFigura(rs.getInt("id_figura"));
            f.setIdUsuario(rs.getInt("id_usuario"));
            f.setIdSerie(rs.getInt("id_serie"));
            f.setNombreFigura(rs.getString("nombre_figura"));
            f.setPrecio(rs.getDouble("precio"));
            f.setEstado(rs.getString("estado"));
            f.setCondicion(rs.getString("condicion"));
            f.setBusca(rs.getString("busca"));
            f.setDescripcion(rs.getString("descripcion"));
            f.setImagenUrl(rs.getString("imagen_url"));
            f.setFechaPub(rs.getString("fecha_pub"));
            lista.add(f);
        }

    } catch (SQLException e) {
        System.err.println("Error al listar figuras: " + e.getMessage());
    }
    return lista;
}
}
