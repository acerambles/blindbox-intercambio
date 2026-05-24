/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blindboxintercambio.servlet;

import com.blindboxintercambio.dao.MensajeDAO;
import com.blindboxintercambio.modelo.Mensaje;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/mensaje")
public class MensajeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // ── Comprobar que el usuario está logueado ─────────────────
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("idUsuario") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // ── Recoger datos del formulario ───────────────────────────
        int    idUsuario  = (int) session.getAttribute("idUsuario");
        String idFiguraStr = request.getParameter("idFigura");
        String contenido   = request.getParameter("contenido");

        // ── Validar campos ─────────────────────────────────────────
        if (idFiguraStr == null || idFiguraStr.trim().isEmpty() ||
            contenido == null || contenido.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/explorar");
            return;
        }

        // ── Convertir ID de figura ─────────────────────────────────
        int idFigura;
        try {
            idFigura = Integer.parseInt(idFiguraStr);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/explorar");
            return;
        }

        // ── Crear y guardar el mensaje ─────────────────────────────
        Mensaje m = new Mensaje();
        m.setIdFigura(idFigura);
        m.setIdRemitente(idUsuario);
        m.setContenido(contenido);

        MensajeDAO dao = new MensajeDAO();
        dao.insertar(m);

        // ── Volver a la página de detalle ──────────────────────────
        response.sendRedirect(request.getContextPath() + "/detalle?id=" + idFigura);
    }
}
