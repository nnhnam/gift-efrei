package com.example.giftefrei.model;

import jakarta.persistence.*;

@Entity
@Table(name = "intern", schema = "public", catalog = "giftefrei")
@NamedQuery(name = "getInternsBySupervisorId", query = "select i from InternEntity i where i.supervisorBySupervisorId.supervisorId = :supervisorId order by i.internId")
public class InternEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "intern_id", nullable = false)
    private int internId;
    @Basic
    @Column(name = "first_name", nullable = false, length = 50)
    private String firstName;
    @Basic
    @Column(name = "last_name", nullable = false, length = 50)
    private String lastName;
    @Basic
    @Column(name = "has_cdc", nullable = false)
    private boolean hasCdc;
    @Basic
    @Column(name = "has_visit_sheet", nullable = false)
    private boolean hasVisitSheet;
    @Basic
    @Column(name = "has_test_sheet", nullable = false)
    private boolean hasTestSheet;
    @Basic
    @Column(name = "has_online_survey", nullable = false)
    private boolean hasOnlineSurvey;
    @ManyToOne
    @JoinColumn(name = "supervisor_id", referencedColumnName = "supervisor_id", nullable = false)
    private SupervisorEntity supervisorBySupervisorId;
    @ManyToOne
    @JoinColumn(name = "internship_id", referencedColumnName = "internship_id", nullable = false)
    private InternshipEntity internshipByInternshipId;
    @ManyToOne
    @JoinColumn(name = "group_id", referencedColumnName = "group_id", nullable = false)
    private InternGroupEntity internGroupByGroupId;

    public int getInternId() {
        return internId;
    }

    public void setInternId(int internId) {
        this.internId = internId;
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

    public boolean isHasCdc() {
        return hasCdc;
    }

    public void setHasCdc(boolean hasCdc) {
        this.hasCdc = hasCdc;
    }

    public boolean isHasVisitSheet() {
        return hasVisitSheet;
    }

    public void setHasVisitSheet(boolean hasVisitSheet) {
        this.hasVisitSheet = hasVisitSheet;
    }

    public boolean isHasTestSheet() {
        return hasTestSheet;
    }

    public void setHasTestSheet(boolean hasTestSheet) {
        this.hasTestSheet = hasTestSheet;
    }

    public boolean isHasOnlineSurvey() {
        return hasOnlineSurvey;
    }

    public void setHasOnlineSurvey(boolean hasOnlineSurvey) {
        this.hasOnlineSurvey = hasOnlineSurvey;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        InternEntity that = (InternEntity) o;

        if (internId != that.internId) return false;
        if (hasCdc != that.hasCdc) return false;
        if (hasVisitSheet != that.hasVisitSheet) return false;
        if (hasTestSheet != that.hasTestSheet) return false;
        if (hasOnlineSurvey != that.hasOnlineSurvey) return false;
        if (firstName != null ? !firstName.equals(that.firstName) : that.firstName != null) return false;
        if (lastName != null ? !lastName.equals(that.lastName) : that.lastName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = internId;
        result = 31 * result + (firstName != null ? firstName.hashCode() : 0);
        result = 31 * result + (lastName != null ? lastName.hashCode() : 0);
        result = 31 * result + (hasCdc ? 1 : 0);
        result = 31 * result + (hasVisitSheet ? 1 : 0);
        result = 31 * result + (hasTestSheet ? 1 : 0);
        result = 31 * result + (hasOnlineSurvey ? 1 : 0);
        return result;
    }

    public SupervisorEntity getSupervisorBySupervisorId() {
        return supervisorBySupervisorId;
    }

    public void setSupervisorBySupervisorId(SupervisorEntity supervisorBySupervisorId) {
        this.supervisorBySupervisorId = supervisorBySupervisorId;
    }

    public InternshipEntity getInternshipByInternshipId() {
        return internshipByInternshipId;
    }

    public void setInternshipByInternshipId(InternshipEntity internshipByInternshipId) {
        this.internshipByInternshipId = internshipByInternshipId;
    }

    public InternGroupEntity getInternGroupByGroupId() {
        return internGroupByGroupId;
    }

    public void setInternGroupByGroupId(InternGroupEntity internGroupByGroupId) {
        this.internGroupByGroupId = internGroupByGroupId;
    }
}
