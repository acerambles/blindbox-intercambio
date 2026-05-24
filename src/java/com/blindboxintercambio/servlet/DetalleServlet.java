/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blindboxintercambio.servlet;

import com.blindboxintercambio.dao.FiguraDAO;
import com.blindboxintercambio.dao.MensajeDAO;
import com.blindboxintercambio.dao.UsuarioDAO;
import com.blindboxintercambio.modelo.Figura;
import com.blindboxintercambio.modelo.Mensaje;
import com.blindboxintercambio.modelo.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/detalle")
public class DetalleServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ── Recoger el ID de la figura de la URL ───────────────────
        String idParam = request.getParameter("id");

        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/explorar");
            return;
        }

        int idFigura;
        try {
            idFigura = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/explorar");
            return;
        }

        // ── Obtener la figura ──────────────────────────────────────
        FiguraDAO figuraDAO = new FiguraDAO();
        Figura figura = figuraDAO.buscarPorId(idFigura);

        if (figura == null) {
            response.sendRedirect(request.getContextPath() + "/explorar");
            return;
        }

        // ── Obtener el vendedor ────────────────────────────────────
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario vendedor = usuarioDAO.buscarPorId(figura.getIdUsuario());

        // ── Obtener los mensajes de la figura ──────────────────────
        MensajeDAO mensajeDAO = new MensajeDAO();
        List<Mensaje> mensajes = mensajeDAO.listarPorFigura(idFigura);

        // ── Pasar datos al JSP ─────────────────────────────────────
        request.setAttribute("figura", figura);
        request.setAttribute("vendedor", vendedor);
        request.setAttribute("mensajes", mensajes);

        request.getRequestDispatcher("/detalle.jsp").forward(request, response);
    }
}