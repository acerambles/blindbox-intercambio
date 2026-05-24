/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blindboxintercambio.servlet;

import com.blindboxintercambio.dao.FiguraDAO;
import com.blindboxintercambio.modelo.Figura;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.blindboxintercambio.dao.SerieDAO;

@WebServlet("/publicar")
public class PublicarServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ── Comprobar que el usuario está logueado ─────────────────
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("idUsuario") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.getRequestDispatcher("/publicar.jsp").forward(request, response);
    }

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
        int    idUsuario    = (int) session.getAttribute("idUsuario");
        String idSerieStr   = request.getParameter("idSerie");
        String nombreFigura = request.getParameter("nombreFigura");
        String precioStr    = request.getParameter("precio");
        String estado       = request.getParameter("estado");
        String condicion    = request.getParameter("condicion");
        String busca        = request.getParameter("busca");
        String descripcion  = request.getParameter("descripcion");
        String imagenUrl    = request.getParameter("imagenUrl");

        // ── Validar campos obligatorios ────────────────────────────
        if (idSerieStr == null || idSerieStr.trim().isEmpty() ||
            estado == null || estado.trim().isEmpty() ||
            condicion == null || condicion.trim().isEmpty()) {

            request.setAttribute("error", "Por favor rellena todos los campos obligatorios.");
            request.getRequestDispatcher("/publicar.jsp").forward(request, response);
            return;
        }

        // ── Convertir tipos ────────────────────────────────────────
        SerieDAO serieDAO = new SerieDAO();
        int idSerie = serieDAO.buscarIdPorNombre(idSerieStr);
        
        if (idSerie == -1) {
            request.setAttribute("error", "La serie seleccionada no existe.");
            request.getRequestDispatcher("/publicar.jsp").forward(request, response);
            return;
        }
        double precio = 0;
        if (precioStr != null && !precioStr.trim().isEmpty()) {
            try {
                precio = Double.parseDouble(precioStr);
            } catch (NumberFormatException e) {
                precio = 0;
            }
        }

        // ── Crear objeto Figura y guardar ──────────────────────────
        Figura f = new Figura();
        f.setIdUsuario(idUsuario);
        f.setIdSerie(idSerie);
        f.setNombreFigura(nombreFigura);
        f.setPrecio(precio);
        f.setEstado(estado);
        f.setCondicion(condicion);
        f.setBusca(busca);
        f.setDescripcion(descripcion);
        f.setImagenUrl(imagenUrl);

        FiguraDAO dao = new FiguraDAO();
        if (dao.insertar(f)) {
            response.sendRedirect(request.getContextPath() + "/perfil");
        } else {
            request.setAttribute("error", "Error al publicar la figura. Intentalo de nuevo.");
            request.getRequestDispatcher("/publicar.jsp").forward(request, response);
        }
    }
}