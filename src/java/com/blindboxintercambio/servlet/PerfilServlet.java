/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blindboxintercambio.servlet;

import com.blindboxintercambio.dao.FiguraDAO;
import com.blindboxintercambio.dao.UsuarioDAO;
import com.blindboxintercambio.modelo.Figura;
import com.blindboxintercambio.modelo.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/perfil")
public class PerfilServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ── Comprobar que el usuario está logueado ─────────────────
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("idUsuario") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // ── Obtener ID del usuario ─────────────────────────────────
        int idUsuario = (int) session.getAttribute("idUsuario");

        // ── Obtener datos del usuario ──────────────────────────────
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = usuarioDAO.buscarPorId(idUsuario);

        // ── Obtener publicaciones del usuario ──────────────────────
        FiguraDAO figuraDAO = new FiguraDAO();
        List<Figura> figuras = figuraDAO.listarPorUsuario(idUsuario);

        // ── Pasar datos al JSP ─────────────────────────────────────
        request.setAttribute("usuario", usuario);
        request.setAttribute("figuras", figuras);

        request.getRequestDispatcher("/perfil.jsp").forward(request, response);
    }
}