/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blindboxintercambio.servlet;

import com.blindboxintercambio.dao.FiguraDAO;
import com.blindboxintercambio.modelo.Figura;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/explorar")
public class ExplorarServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ── Recoger parámetros de búsqueda y filtros ───────────────
        String busqueda = request.getParameter("busqueda");
        String estado   = request.getParameter("estado");
        String marca    = request.getParameter("marca");

        // ── Obtener figuras de la base de datos ────────────────────
        FiguraDAO dao = new FiguraDAO();
        List<Figura> figuras = dao.listarTodas(busqueda, estado, marca);

        // ── Pasar datos al JSP ─────────────────────────────────────
        request.setAttribute("figuras", figuras);
        request.setAttribute("busqueda", busqueda);
        request.setAttribute("estado", estado);
        request.setAttribute("marca", marca);

        // ── Mostrar página de explorar ─────────────────────────────
        request.getRequestDispatcher("/explorar.jsp").forward(request, response);
    }
}