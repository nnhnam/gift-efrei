package com.example.giftefrei.controller;

import java.io.*;
import java.util.List;

import com.example.giftefrei.model.*;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "internsList", value = "/interns-list")
public class InternsListController extends HttpServlet {
    @EJB
    private InternSB internSB;

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
            return;
        }
        List<InternEntity> interns = internSB.getInternsBySupervisorId(supervisor.getSupervisorId());
        List<InternGroupEntity> groups = internGroupSB.getInternGroups();
        request.setAttribute("interns", interns);
        request.setAttribute("groups", groups);
        request.getRequestDispatcher("/WEB-INF/interns.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        SupervisorEntity supervisor = getSupervisorFromRequest(request);
        if (supervisor == null) {
            return;
        }
        List<InternEntity> interns = internSB.getInternsBySupervisorId(supervisor.getSupervisorId());
        for (InternEntity intern : interns) {
            int id = intern.getInternId();
            intern.setInternGroupByGroupId(internGroupSB.getInternGroupById(Integer.parseInt(request.getParameter("internGroup_" + id))));
            intern.setFirstName(request.getParameter("firstName_" + id));
            intern.setLastName(request.getParameter("lastName_" + id));
            intern.setHasCdc(request.getParameter("hasCdc_" + id) != null);
            intern.setHasVisitSheet(request.getParameter("hasVisitSheet_" + id) != null);
            intern.setHasTestSheet(request.getParameter("hasTestSheet_" + id) != null);
            intern.setHasOnlineSurvey(request.getParameter("hasOnlineSurvey_" + id) != null);
            intern.getInternshipByInternshipId().setReportDone(request.getParameter("isReportDone_" + id) != null);
            intern.getInternshipByInternshipId().setOralDefenseDone(request.getParameter("isOralDefenseDone_" + id) != null);
            intern.getInternshipByInternshipId().setVisitPlanningDone(request.getParameter("isVisitPlanningDone_" + id) != null);
            intern.getInternshipByInternshipId().setVisitDone(request.getParameter("isVisitDone_" + id) != null);
            intern.getInternshipByInternshipId().setNoteTech(request.getParameter("noteTech_" + id).isEmpty() ? null : Double.valueOf(request.getParameter("noteTech_" + id)));
            intern.getInternshipByInternshipId().setNoteCom(request.getParameter("noteCom_" + id).isEmpty() ? null : Double.valueOf(request.getParameter("noteCom_" + id)));
            internSB.updateIntern(intern);
        }
        response.sendRedirect(request.getContextPath() + "/interns-list");
    }


    public void destroy() {
    }
}