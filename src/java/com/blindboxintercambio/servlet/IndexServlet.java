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

@WebServlet("/index")
public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ── Obtener figuras recientes de la base de datos ──────────
        FiguraDAO dao = new FiguraDAO();
        List<Figura> figuras = dao.listarRecientes();

        // ── Pasar las figuras al JSP ───────────────────────────────
        request.setAttribute("figuras", figuras);

        // ── Mostrar la página de inicio ────────────────────────────
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}