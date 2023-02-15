package com.example.giftefrei.model;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
@Table(name = "supervisor", schema = "public", catalog = "giftefrei")
public class SupervisorEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "supervisor_id", nullable = false)
    private int supervisorId;
    @Basic
    @Column(name = "first_name", nullable = false, length = 50)
    private String firstName;
    @Basic
    @Column(name = "last_name", nullable = false, length = 50)
    private String lastName;
    @Basic
    @Column(name = "login", nullable = false, length = 50)
    private String login;
    @Basic
    @Column(name = "password_hash", nullable = false, length = 60)
    private String passwordHash;
    @OneToMany(mappedBy = "supervisorBySupervisorId")
    private Collection<InternEntity> internsBySupervisorId;

    public int getSupervisorId() {
        return supervisorId;
    }

    public void setSupervisorId(int supervisorId) {
        this.supervisorId = supervisorId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SupervisorEntity that = (SupervisorEntity) o;

        if (supervisorId != that.supervisorId) return false;
        if (firstName != null ? !firstName.equals(that.firstName) : that.firstName != null) return false;
        if (lastName != null ? !lastName.equals(that.lastName) : that.lastName != null) return false;
        if (login != null ? !login.equals(that.login) : that.login != null) return false;
        if (passwordHash != null ? !passwordHash.equals(that.passwordHash) : that.passwordHash != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = supervisorId;
        result = 31 * result + (firstName != null ? firstName.hashCode() : 0);
        result = 31 * result + (lastName != null ? lastName.hashCode() : 0);
        result = 31 * result + (login != null ? login.hashCode() : 0);
        result = 31 * result + (passwordHash != null ? passwordHash.hashCode() : 0);
        return result;
    }

    public Collection<InternEntity> getInternsBySupervisorId() {
        return internsBySupervisorId;
    }

    public void setInternsBySupervisorId(Collection<InternEntity> internsBySupervisorId) {
        this.internsBySupervisorId = internsBySupervisorId;
    }
}
