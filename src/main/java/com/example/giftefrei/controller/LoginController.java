package com.example.giftefrei.controller;

import java.io.IOException;
import java.util.List;

import com.example.giftefrei.model.InternEntity;
import com.example.giftefrei.model.SupervisorEntity;
import com.example.giftefrei.model.SupervisorSB;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "login", value = "/login")
public class LoginController extends HttpServlet {
    @EJB
    private SupervisorSB supervisorSB;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String logoutRequest = request.getParameter("logout");
        if (logoutRequest != null) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        String enteredLogin = request.getParameter("loginField");
        String enteredPassword = request.getParameter("pwdField");
        SupervisorEntity supervisor = supervisorSB.authenticate(enteredLogin, enteredPassword);
        if (supervisor == null) {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        HttpSession session = request.getSession();
        session.setAttribute("supervisor", supervisor);
        // TODO: This is a temp path.
        response.sendRedirect(request.getContextPath() + "/interns-list");
    }

    public void destroy() {
    }
}
