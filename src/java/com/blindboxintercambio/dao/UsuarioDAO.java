/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blindboxintercambio.dao;

import com.blindboxintercambio.modelo.Usuario;
import com.blindboxintercambio.util.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    // ── Insertar nuevo usuario ─────────────────────────────────────
    public boolean insertar(Usuario u) {
        String sql = "INSERT INTO usuarios (nombre, username, email, password, pais, ciudad) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, u.getNombre());
            ps.setString(2, u.getUsername());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getPassword());
            ps.setString(5, u.getPais());
            ps.setString(6, u.getCiudad());

            return ps.executeUpdate() == 1;

        } catch (SQLException e) {
            System.err.println("Error al insertar usuario: " + e.getMessage());
            return false;
        }
    }

    // ── Buscar usuario por email ───────────────────────────────────
    public Usuario buscarPorEmail(String email) {
        String sql = "SELECT * FROM usuarios WHERE email = ?";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Usuario u = new Usuario();
                u.setIdUsuario(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setPais(rs.getString("pais"));
                u.setCiudad(rs.getString("ciudad"));
                u.setActivo(rs.getInt("activo"));
                u.setRol(rs.getString("rol"));
                return u;
            }

        } catch (SQLException e) {
            System.err.println("Error al buscar usuario: " + e.getMessage());
        }
        return null;
    }

    // ── Buscar usuario por ID ──────────────────────────────────────
    public Usuario buscarPorId(int id) {
        String sql = "SELECT * FROM usuarios WHERE id_usuario = ?";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Usuario u = new Usuario();
                u.setIdUsuario(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setPais(rs.getString("pais"));
                u.setCiudad(rs.getString("ciudad"));
                u.setActivo(rs.getInt("activo"));
                u.setRol(rs.getString("rol"));
                return u;
            }

        } catch (SQLException e) {
            System.err.println("Error al buscar usuario por ID: " + e.getMessage());
        }
        return null;
    }

    // ── Buscar usuario por username ────────────────────────────────
    public Usuario buscarPorUsername(String username) {
        String sql = "SELECT * FROM usuarios WHERE username = ?";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Usuario u = new Usuario();
                u.setIdUsuario(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setPais(rs.getString("pais"));
                u.setCiudad(rs.getString("ciudad"));
                u.setActivo(rs.getInt("activo"));
                u.setRol(rs.getString("rol"));
                return u;
            }

        } catch (SQLException e) {
            System.err.println("Error al buscar usuario por username: " + e.getMessage());
        }
        return null;
    }
    
    // ── Listar todos los usuarios ──────────────────────────────────
    public List<Usuario> listarTodos() {
        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT * FROM usuarios ORDER BY fecha_alta DESC";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setIdUsuario(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                u.setPais(rs.getString("pais"));
                u.setCiudad(rs.getString("ciudad"));
                u.setActivo(rs.getInt("activo"));
                u.setRol(rs.getString("rol"));
                lista.add(u);
             }

        } catch (SQLException e) {
            System.err.println("Error al listar usuarios: " + e.getMessage());
        }
        return lista;
}

// ── Contar todos los usuarios ──────────────────────────────────
    public int contarTodos() {
        String sql = "SELECT COUNT(*) FROM usuarios";
        try (Connection con = ConexionDB.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) return rs.getInt(1);

        } catch (SQLException e) {
            System.err.println("Error al contar usuarios: " + e.getMessage());
        }
        return 0;
}

// ── Desactivar usuario ─────────────────────────────────────────
    public boolean desactivar(int idUsuario) {
        String sql = "UPDATE usuarios SET activo = 0 WHERE id_usuario = ?";
        try (Connection con = ConexionDB.getConexion();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, idUsuario);
        
        return ps.executeUpdate() == 1;

        } catch (SQLException e) {
            System.err.println("Error al desactivar usuario: " + e.getMessage());
        return false;
        }
    }
    // ── Actualizar datos del usuario ───────────────────────────────
    public boolean actualizar(Usuario u) {
        String sql = "UPDATE usuarios SET username=?, nombre=?, email=?, pais=?, ciudad=?, mostrar_nombre=? WHERE id_usuario=?";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, u.getUsername());
            ps.setString(2, u.getNombre());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getPais());
            ps.setString(5, u.getCiudad());
            ps.setInt(6, u.getMostrarNombre());
            ps.setInt(7, u.getIdUsuario());

            return ps.executeUpdate() == 1;

        } catch (SQLException e) {
            System.err.println("Error al actualizar usuario: " + e.getMessage());
            return false;
        }
    }

// ── Actualizar contraseña ──────────────────────────────────────
    public boolean actualizarPassword(int idUsuario, String passwordEncriptada) {
        String sql = "UPDATE usuarios SET password=? WHERE id_usuario=?";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, passwordEncriptada);
            ps.setInt(2, idUsuario);

            return ps.executeUpdate() == 1;

        } catch (SQLException e) {
            System.err.println("Error al actualizar password: " + e.getMessage());
            return false;
        }
    }
}