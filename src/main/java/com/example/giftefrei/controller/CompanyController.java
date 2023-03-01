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
@WebServlet(name = "company", value = "/company")
public class CompanyController extends HttpServlet {
    @EJB
    private CompanySB companySB;

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
            CompanyEntity company = companySB.getCompanyById(Integer.parseInt(request.getParameter("id")));
            if (company == null) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }
            request.setAttribute("company", company);
        }
        request.getRequestDispatcher("/WEB-INF/company.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        SupervisorEntity supervisor = getSupervisorFromRequest(request);
        if (supervisor == null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        String companyId = request.getParameter("companyId");
        CompanyEntity company = companyId == null ? new CompanyEntity() : companySB.getCompanyById(Integer.parseInt(companyId));
        company.setName(request.getParameter("name"));
        company.setAddress(request.getParameter("address"));
        companySB.updateCompany(company);
        response.sendRedirect(request.getContextPath() + "/interns-list");
    }

    public void destroy() {
    }
}