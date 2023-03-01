package com.example.giftefrei.model;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import org.mindrot.jbcrypt.BCrypt;

import java.util.List;

@Stateless
public class SupervisorSB {
    EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("default");
    EntityManager em = entityManagerFactory.createEntityManager();

    public SupervisorEntity authenticate(String login, String password) {
        Query q = em.createNamedQuery("authenticate")
                .setParameter("login", login);
        SupervisorEntity s = (SupervisorEntity) q.getResultList().stream().findFirst().orElse(null);
        if (s == null) {
            return null;
        }
        if (BCrypt.checkpw(password, s.getPasswordHash())) {
            return s;
        } else {
            return null;
        }
    }
}
