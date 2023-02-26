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
        Query q = em.createQuery("select i from InternEntity i where i.supervisorBySupervisorId.supervisorId = :supervisorId order by i.internId")
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
