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
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ── Si viene de registro exitoso mostrar mensaje ───────────
        String registro = request.getParameter("registro");
        if ("ok".equals(registro)) {
            request.setAttribute("exito", "Cuenta creada correctamente. Inicia sesion.");
        }

        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // ── Recoger datos del formulario ───────────────────────────
        String login    = request.getParameter("login");
        String password = request.getParameter("password");

        // ── Validar que no hay campos vacíos ───────────────────────
        if (login == null || login.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {

            request.setAttribute("error", "Introduce tu email o usuario y contrasena.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // ── Buscar usuario por email o por username ─────────────────
        UsuarioDAO dao = new UsuarioDAO();
        Usuario u = dao.buscarPorEmail(login);
        if (u == null) {
            u = dao.buscarPorUsername(login);
        }

        // ── Comprobar si existe el usuario ─────────────────────────
        if (u == null) {
            request.setAttribute("error", "Email o usuario incorrecto.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // ── Comprobar si la cuenta está activa ─────────────────────
        if (u.getActivo() == 0) {
            request.setAttribute("error", "Tu cuenta ha sido desactivada.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // ── Comprobar contraseña ───────────────────────────────────
        String passwordEncriptada = encriptarSHA256(password);
        if (!passwordEncriptada.equals(u.getPassword())) {
            request.setAttribute("error", "Contrasena incorrecta.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // ── Crear sesión ───────────────────────────────────────────
        HttpSession session = request.getSession();
        session.setAttribute("usuarioLogueado", u);
        session.setAttribute("idUsuario", u.getIdUsuario());
        session.setAttribute("username", u.getUsername());
        session.setAttribute("rol", u.getRol());

        // ── Redirigir según rol ────────────────────────────────────
        if ("admin".equals(u.getRol())) {
            response.sendRedirect(request.getContextPath() + "/admin");
        } else {
            response.sendRedirect(request.getContextPath() + "/index");
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