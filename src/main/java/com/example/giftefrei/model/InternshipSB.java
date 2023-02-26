package com.example.giftefrei.model;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

import java.util.List;

@Stateless
public class InternshipSB {
    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
    EntityManager em = entityManagerFactory.createEntityManager();
    public InternshipEntity getInternshipById(int id) {
        return em.find(InternshipEntity.class, id);
    }

    public void updateInternship(InternshipEntity internship) {
        em.getTransaction().begin();
        em.merge(internship);
        em.getTransaction().commit();
    }

    public void deleteInternship(InternshipEntity internship) {
        em.getTransaction().begin();
        if (!em.contains(internship)) {
            internship = em.merge(internship);
        }
        em.remove(internship);
        em.getTransaction().commit();
    }
}
