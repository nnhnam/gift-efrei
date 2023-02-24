package com.example.giftefrei.controller;

import java.io.*;
import java.util.List;

import com.example.giftefrei.model.InternEntity;
import com.example.giftefrei.model.SupervisorEntity;
import com.example.giftefrei.model.SupervisorSB;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "internsList", value = "/interns-list")
public class InternsListController extends HttpServlet {
    @EJB
    private SupervisorSB supervisorSB;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        if (session == null) {
            return;
        }
        SupervisorEntity supervisor = (SupervisorEntity) session.getAttribute("supervisor");
        if (supervisor == null) {
            return;
        }
        List<InternEntity> interns = supervisorSB.getInternsBySupervisorId(supervisor.getSupervisorId());
        request.setAttribute("interns", interns);
        request.getRequestDispatcher("/WEB-INF/interns.jsp").forward(request, response);
    }

    public void destroy() {
    }
}