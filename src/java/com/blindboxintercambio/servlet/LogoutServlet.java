/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.blindboxintercambio.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ── Obtener la sesión actual sin crear una nueva ───────────
        HttpSession session = request.getSession(false);

        // ── Si existe sesión la destruimos ─────────────────────────
        if (session != null) {
            session.invalidate();
        }

        // ── Redirigir a la página de inicio ───────────────────────
        response.sendRedirect(request.getContextPath() + "/index");
    }
}