/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blindboxintercambio.servlet;

import com.blindboxintercambio.dao.UsuarioDAO;
import com.blindboxintercambio.modelo.Usuario;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registro")
public class RegistroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/registro.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // ── Recoger datos del formulario ───────────────────────────
        String nombre   = request.getParameter("nombre");
        String username = request.getParameter("username");
        String email    = request.getParameter("email");
        String password = request.getParameter("password");
        String pais     = request.getParameter("pais");
        String ciudad   = request.getParameter("ciudad");

        // ── Validar que no hay campos vacíos ───────────────────────
        if (nombre == null || nombre.trim().isEmpty() ||
            username == null || username.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {

            request.setAttribute("error", "Todos los campos obligatorios deben estar rellenos.");
            request.getRequestDispatcher("/registro.jsp").forward(request, response);
            return;
        }

        // ── Comprobar si el email ya existe ────────────────────────
        UsuarioDAO dao = new UsuarioDAO();
        if (dao.buscarPorEmail(email) != null) {
            request.setAttribute("error", "Este email ya está registrado.");
            request.getRequestDispatcher("/registro.jsp").forward(request, response);
            return;
        }

        // ── Comprobar si el username ya existe ─────────────────────
        if (dao.buscarPorUsername(username) != null) {
            request.setAttribute("error", "Este nombre de usuario ya está en uso.");
            request.getRequestDispatcher("/registro.jsp").forward(request, response);
            return;
        }

        // ── Encriptar contraseña ───────────────────────────────────
        String passwordEncriptada = encriptarSHA256(password);

        // ── Crear objeto Usuario y guardar ─────────────────────────
        Usuario u = new Usuario();
        u.setNombre(nombre);
        u.setUsername(username);
        u.setEmail(email);
        u.setPassword(passwordEncriptada);
        u.setPais(pais);
        u.setCiudad(ciudad);

        if (dao.insertar(u)) {
            response.sendRedirect(request.getContextPath() + "/login?registro=ok");
        } else {
            request.setAttribute("error", "Error al crear la cuenta. Intentalo de nuevo.");
            request.getRequestDispatcher("/registro.jsp").forward(request, response);
        }
    }

    // ── Método para encriptar con SHA-256 ──────────────────────────
    private String encriptarSHA256(String texto) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(texto.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder();
            for (byte b : hash) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException | java.io.UnsupportedEncodingException e) {
            System.err.println("Error al encriptar: " + e.getMessage());
            return texto;
        }
    }
}