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

@WebServlet("/editarPerfil")
public class EditarPerfilServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ── Comprobar que está logueado ────────────────────────────
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("idUsuario") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // ── Cargar datos actuales del usuario ──────────────────────
        int idUsuario = (int) session.getAttribute("idUsuario");
        UsuarioDAO dao = new UsuarioDAO();
        Usuario usuario = dao.buscarPorId(idUsuario);

        request.setAttribute("usuario", usuario);
        request.getRequestDispatcher("/editarPerfil.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // ── Comprobar que está logueado ────────────────────────────
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("idUsuario") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int idUsuario = (int) session.getAttribute("idUsuario");

        // ── Recoger datos del formulario ───────────────────────────
        String username      = request.getParameter("username");
        String nombre        = request.getParameter("nombre");
        String email         = request.getParameter("email");
        String pais          = request.getParameter("pais");
        String ciudad        = request.getParameter("ciudad");
        String mostrarNombreParam = request.getParameter("mostrarNombre");
        int mostrarNombre    = "1".equals(mostrarNombreParam) ? 1 : 0;

        String passwordNueva     = request.getParameter("passwordNueva");
        String passwordConfirmar = request.getParameter("passwordConfirmar");

        // ── Validar campos obligatorios ────────────────────────────
        if (username == null || username.trim().isEmpty() ||
            email == null || email.trim().isEmpty()) {

            request.setAttribute("error", "El username y el email son obligatorios.");
            UsuarioDAO dao = new UsuarioDAO();
            request.setAttribute("usuario", dao.buscarPorId(idUsuario));
            request.getRequestDispatcher("/editarPerfil.jsp").forward(request, response);
            return;
        }

        // ── Actualizar datos del usuario ───────────────────────────
        Usuario u = new Usuario();
        u.setIdUsuario(idUsuario);
        u.setUsername(username.trim());
        u.setNombre(nombre != null ? nombre.trim() : "");
        u.setEmail(email.trim());
        u.setPais(pais != null ? pais.trim() : "");
        u.setCiudad(ciudad != null ? ciudad.trim() : "");
        u.setMostrarNombre(mostrarNombre);

        UsuarioDAO dao = new UsuarioDAO();
        boolean actualizado = dao.actualizar(u);

        if (!actualizado) {
            request.setAttribute("error", "Error al guardar los cambios. El username o email ya pueden estar en uso.");
            request.setAttribute("usuario", dao.buscarPorId(idUsuario));
            request.getRequestDispatcher("/editarPerfil.jsp").forward(request, response);
            return;
        }

        // ── Actualizar username en sesión ──────────────────────────
        session.setAttribute("username", username.trim());

        // ── Cambiar contraseña si se ha introducido ────────────────
        if (passwordNueva != null && !passwordNueva.trim().isEmpty()) {
            if (!passwordNueva.equals(passwordConfirmar)) {
                request.setAttribute("error", "Las contraseñas no coinciden.");
                request.setAttribute("usuario", dao.buscarPorId(idUsuario));
                request.getRequestDispatcher("/editarPerfil.jsp").forward(request, response);
                return;
            }
            if (passwordNueva.length() < 8) {
                request.setAttribute("error", "La contraseña debe tener al menos 8 caracteres.");
                request.setAttribute("usuario", dao.buscarPorId(idUsuario));
                request.getRequestDispatcher("/editarPerfil.jsp").forward(request, response);
                return;
            }
            String passwordEncriptada = encriptarSHA256(passwordNueva);
            dao.actualizarPassword(idUsuario, passwordEncriptada);
        }

        response.sendRedirect(request.getContextPath() + "/perfil?exito=1");
    }

    // ── Encriptar con SHA-256 ──────────────────────────────────────
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