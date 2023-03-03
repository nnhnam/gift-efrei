package com.example.giftefrei.controller;

import com.example.giftefrei.model.*;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "internGroup", value = "/intern-group")
public class InternGroupController extends HttpServlet {
    @EJB
    private InternGroupSB internGroupSB;

    SupervisorEntity getSupervisorFromRequest(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session == null) {
            return null;
        }
        return (SupervisorEntity) session.getAttribute("supervisor");
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        SupervisorEntity supervisor = getSupervisorFromRequest(request);
        if (supervisor == null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        if (request.getParameter("id") != null) {
            InternGroupEntity internGroup = internGroupSB.getInternGroupById(Integer.parseInt(request.getParameter("id")));
            if (internGroup == null) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }
            request.setAttribute("internGroup", internGroup);
        }
        request.getRequestDispatcher("/WEB-INF/internGroup.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        SupervisorEntity supervisor = getSupervisorFromRequest(request);
        if (supervisor == null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        String internGroupId = request.getParameter("internGroupId");
        InternGroupEntity internGroup = internGroupId == null ? new InternGroupEntity() : internGroupSB.getInternGroupById(Integer.parseInt(internGroupId));
        internGroup.setName(request.getParameter("name"));
        internGroupSB.updateInternGroup(internGroup);
        response.sendRedirect(request.getContextPath() + "/interns-list");
    }

    public void destroy() {
    }
}