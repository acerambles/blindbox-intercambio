/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blindboxintercambio.dao;

import com.blindboxintercambio.modelo.Mensaje;
import com.blindboxintercambio.util.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MensajeDAO {

    // ── Insertar nuevo mensaje ─────────────────────────────────────
    public boolean insertar(Mensaje m) {
        String sql = "INSERT INTO mensajes (id_figura, id_remitente, contenido) VALUES (?, ?, ?)";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, m.getIdFigura());
            ps.setInt(2, m.getIdRemitente());
            ps.setString(3, m.getContenido());

            return ps.executeUpdate() == 1;

        } catch (SQLException e) {
            System.err.println("Error al insertar mensaje: " + e.getMessage());
            return false;
        }
    }

    // ── Listar mensajes por figura ─────────────────────────────────
    public List<Mensaje> listarPorFigura(int idFigura) {
        List<Mensaje> lista = new ArrayList<>();
        String sql = "SELECT * FROM mensajes WHERE id_figura = ? ORDER BY fecha ASC";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idFigura);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Mensaje m = new Mensaje();
                m.setIdMensaje(rs.getInt("id_mensaje"));
                m.setIdFigura(rs.getInt("id_figura"));
                m.setIdRemitente(rs.getInt("id_remitente"));
                m.setContenido(rs.getString("contenido"));
                m.setFecha(rs.getString("fecha"));
                lista.add(m);
            }

        } catch (SQLException e) {
            System.err.println("Error al listar mensajes: " + e.getMessage());
        }
        return lista;
    }
}
