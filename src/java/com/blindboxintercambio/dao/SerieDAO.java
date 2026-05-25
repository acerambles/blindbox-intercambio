/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blindboxintercambio.dao;

import com.blindboxintercambio.util.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SerieDAO {

    public int buscarIdPorNombre(String nombre) {
        String sql = "SELECT id_serie FROM series WHERE nombre = ?";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, nombre);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("id_serie");
            }

        } catch (SQLException e) {
            System.err.println("Error al buscar serie: " + e.getMessage());
        }
        return -1;
    }
    public int insertar(String nombreSerie, int idModelo) {
        String sql = "INSERT INTO series (nombre, id_modelo, verificada) VALUES (?, ?, 0)";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, nombreSerie);
            ps.setInt(2, idModelo);
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
            System.err.println("Error al insertar serie: " + e.getMessage());
        }
        return -1;
    }
    public int buscarIdModeloPorNombre(String nombre) {
        String sql = "SELECT id_modelo FROM modelos WHERE nombre = ?";
        try (Connection con = ConexionDB.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, nombre);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("id_modelo");
            }

        } catch (SQLException e) {
            System.err.println("Error al buscar modelo: " + e.getMessage());
        }
        return -1;
    }  
}