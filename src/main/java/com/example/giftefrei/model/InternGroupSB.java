package com.example.giftefrei.model;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

import java.util.List;

@Stateless
public class InternGroupSB {
    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
    EntityManager em = entityManagerFactory.createEntityManager();
    public List<InternGroupEntity> getInternGroups() {
        Query q = em.createQuery("select g from InternGroupEntity g");
        return q.getResultList();
    }

    public InternGroupEntity getInternGroupById(int id) {
        return em.find(InternGroupEntity.class, id);
    }

    public void updateInternGroup(InternGroupEntity internGroup) {
        em.getTransaction().begin();
        em.merge(internGroup);
        em.getTransaction().commit();
    }

}
