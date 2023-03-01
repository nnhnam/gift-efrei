package com.example.giftefrei.model;

import jakarta.ejb.Stateless;
import jakarta.persistence.*;

import java.util.List;

@Stateless
public class InternSB {
    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
    EntityManager em = entityManagerFactory.createEntityManager();

    public List<InternEntity> getInternsBySupervisorId(int supervisorId) {
        Query q = em.createNamedQuery("getInternsBySupervisorId")
                .setParameter("supervisorId", supervisorId);
        return q.getResultList();
    }

    public InternEntity getInternById(int id) {
        return em.find(InternEntity.class, id);
    }

    public void updateIntern(InternEntity intern) {
        em.getTransaction().begin();
        em.merge(intern);
        em.getTransaction().commit();
    }

    public void deleteIntern(InternEntity intern) {
        em.getTransaction().begin();
        if (!em.contains(intern)) {
            intern = em.merge(intern);
        }
        em.remove(intern);
        em.getTransaction().commit();
    }
}
