package com.example.giftefrei.model;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

import java.util.List;

@Stateless
public class CompanySB {
    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
    EntityManager em = entityManagerFactory.createEntityManager();
    public List<CompanyEntity> getCompanies() {
        Query q = em.createQuery("select c from CompanyEntity c");
        return q.getResultList();
    }

    public CompanyEntity getCompanyById(int id) {
        return em.find(CompanyEntity.class, id);
    }

}
