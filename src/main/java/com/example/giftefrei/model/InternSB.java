package com.example.giftefrei.model;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import org.mindrot.jbcrypt.BCrypt;

import java.util.List;

@Stateless
public class InternSB {
    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
    EntityManager em = entityManagerFactory.createEntityManager();

    public List<InternEntity> getInternsBySupervisorId(int supervisorId) {
        Query q = em.createQuery("select i from InternEntity i where i.supervisorBySupervisorId.supervisorId = :supervisorId")
                .setParameter("supervisorId", supervisorId);
        return q.getResultList();
    }

    public void updateIntern(InternEntity intern) {
        em.getTransaction().begin();
        em.merge(intern);
        em.getTransaction().commit();
    }
}
