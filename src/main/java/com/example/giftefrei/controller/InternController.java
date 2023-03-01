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
import java.sql.Date;
import java.util.List;

@WebServlet(name = "intern", value = "/intern")
public class InternController extends HttpServlet {
    @EJB
    private InternSB internSB;

    @EJB
    private InternGroupSB internGroupSB;

    @EJB
    private CompanySB companySB;

    @EJB
    private InternshipSB internshipSB;

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
            InternEntity intern = internSB.getInternById(Integer.parseInt(request.getParameter("id")));
            if (intern == null || intern.getSupervisorBySupervisorId().getSupervisorId() != supervisor.getSupervisorId()) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }
            request.setAttribute("intern", intern);
        }
        List<InternGroupEntity> groups = internGroupSB.getInternGroups();
        List<CompanyEntity> companies = companySB.getCompanies();
        request.setAttribute("groups", groups);
        request.setAttribute("companies", companies);
        request.getRequestDispatcher("/WEB-INF/intern.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        SupervisorEntity supervisor = getSupervisorFromRequest(request);
        if (supervisor == null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        String internId = request.getParameter("internId");
        InternEntity intern = internId == null ? new InternEntity() : internSB.getInternById(Integer.parseInt(internId));
        intern.setSupervisorBySupervisorId(supervisor);
        intern.setInternGroupByGroupId(internGroupSB.getInternGroupById(Integer.parseInt(request.getParameter("internGroup"))));
        intern.setFirstName(request.getParameter("firstName"));
        intern.setLastName(request.getParameter("lastName"));
        if (intern.getInternshipByInternshipId() == null) {
            intern.setInternshipByInternshipId(new InternshipEntity());
        }
        intern.getInternshipByInternshipId().setCompanyByCompanyId(companySB.getCompanyById(Integer.parseInt(request.getParameter("company"))));
        intern.getInternshipByInternshipId().setStartDate(Date.valueOf(request.getParameter("startDate")));
        intern.getInternshipByInternshipId().setEndDate(Date.valueOf(request.getParameter("endDate")));
        intern.getInternshipByInternshipId().setManagerName(request.getParameter("managerName"));
        intern.getInternshipByInternshipId().setDescription(request.getParameter("description"));
        intern.getInternshipByInternshipId().setComment(request.getParameter("comment"));
        internshipSB.updateInternship(intern.getInternshipByInternshipId());
        internSB.updateIntern(intern);
        response.sendRedirect(request.getContextPath() + "/interns-list");
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SupervisorEntity supervisor = getSupervisorFromRequest(request);
        if (supervisor == null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        String internId = request.getParameter("internId");
        InternEntity intern = internSB.getInternById(Integer.parseInt(internId));
        if (intern == null || intern.getSupervisorBySupervisorId().getSupervisorId() != supervisor.getSupervisorId()) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        internSB.deleteIntern(intern);
        internshipSB.deleteInternship(intern.getInternshipByInternshipId());
        response.sendRedirect(request.getContextPath() + "/interns-list");
    }

    public void destroy() {
    }
}