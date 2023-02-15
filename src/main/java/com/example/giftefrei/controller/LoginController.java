package com.example.giftefrei.controller;
import java.util.List;

import com.example.giftefrei.model.InternEntity;
import com.example.giftefrei.model.SupervisorEntity;
import com.example.giftefrei.model.SupervisorSB;
import jakarta.ejb.EJB;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "login", value = "/login")
public class LoginController extends HttpServlet {
    @EJB
    private SupervisorSB supervisorSB;
    /*
        Objectives :
        a) Get the values that the user has typed on the index.jsp page
        b)  call the hello.jsp page and show a message that contains those values
    */

    public void processRequest(HttpServletRequest request, HttpServletResponse response) {

        // TODO: Implement proper login. This is only for testing.
        List<SupervisorEntity> allSupervisors = supervisorSB.getSupervisors();
        for (SupervisorEntity supervisor : allSupervisors) {
            InternEntity intern = (InternEntity) supervisor.getInternsBySupervisorId().toArray()[0];
            System.out.println("SHOW Interns : " + intern.getFirstName());
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        processRequest(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        processRequest(request, response);
    }

    public void destroy() {
    }
}
