package com.example.giftefrei.model;

import jakarta.persistence.*;

import java.sql.Date;
import java.util.Collection;

@Entity
@Table(name = "internship", schema = "public", catalog = "giftefrei")
public class InternshipEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "internship_id", nullable = false)
    private int internshipId;
    @Basic
    @Column(name = "description", nullable = false, length = 100)
    private String description;
    @Basic
    @Column(name = "manager_name", nullable = false, length = 50)
    private String managerName;
    @Basic
    @Column(name = "comment", nullable = true, length = 100)
    private String comment;
    @Basic
    @Column(name = "start_date", nullable = false)
    private Date startDate;
    @Basic
    @Column(name = "end_date", nullable = false)
    private Date endDate;
    @Basic
    @Column(name = "is_report_done", nullable = false)
    private boolean isReportDone;
    @Basic
    @Column(name = "is_oral_defense_done", nullable = false)
    private boolean isOralDefenseDone;
    @Basic
    @Column(name = "is_visit_planning_done", nullable = false)
    private boolean isVisitPlanningDone;
    @Basic
    @Column(name = "is_visit_done", nullable = false)
    private boolean isVisitDone;
    @OneToMany(mappedBy = "internshipByInternshipId")
    private Collection<InternEntity> internsByInternshipId;
    @ManyToOne
    @JoinColumn(name = "company_id", referencedColumnName = "company_id")
    private CompanyEntity companyByCompanyId;

    public int getInternshipId() {
        return internshipId;
    }

    public void setInternshipId(int internshipId) {
        this.internshipId = internshipId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public boolean isReportDone() {
        return isReportDone;
    }

    public void setReportDone(boolean reportDone) {
        isReportDone = reportDone;
    }

    public boolean isOralDefenseDone() {
        return isOralDefenseDone;
    }

    public void setOralDefenseDone(boolean oralDefenseDone) {
        isOralDefenseDone = oralDefenseDone;
    }

    public boolean isVisitPlanningDone() {
        return isVisitPlanningDone;
    }

    public void setVisitPlanningDone(boolean visitPlanningDone) {
        isVisitPlanningDone = visitPlanningDone;
    }

    public boolean isVisitDone() {
        return isVisitDone;
    }

    public void setVisitDone(boolean visitDone) {
        isVisitDone = visitDone;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        InternshipEntity that = (InternshipEntity) o;

        if (internshipId != that.internshipId) return false;
        if (isReportDone != that.isReportDone) return false;
        if (isOralDefenseDone != that.isOralDefenseDone) return false;
        if (isVisitPlanningDone != that.isVisitPlanningDone) return false;
        if (isVisitDone != that.isVisitDone) return false;
        if (description != null ? !description.equals(that.description) : that.description != null) return false;
        if (managerName != null ? !managerName.equals(that.managerName) : that.managerName != null) return false;
        if (comment != null ? !comment.equals(that.comment) : that.comment != null) return false;
        if (startDate != null ? !startDate.equals(that.startDate) : that.startDate != null) return false;
        if (endDate != null ? !endDate.equals(that.endDate) : that.endDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = internshipId;
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (managerName != null ? managerName.hashCode() : 0);
        result = 31 * result + (comment != null ? comment.hashCode() : 0);
        result = 31 * result + (startDate != null ? startDate.hashCode() : 0);
        result = 31 * result + (endDate != null ? endDate.hashCode() : 0);
        result = 31 * result + (isReportDone ? 1 : 0);
        result = 31 * result + (isOralDefenseDone ? 1 : 0);
        result = 31 * result + (isVisitPlanningDone ? 1 : 0);
        result = 31 * result + (isVisitDone ? 1 : 0);
        return result;
    }

    public Collection<InternEntity> getInternsByInternshipId() {
        return internsByInternshipId;
    }

    public void setInternsByInternshipId(Collection<InternEntity> internsByInternshipId) {
        this.internsByInternshipId = internsByInternshipId;
    }

    public CompanyEntity getCompanyByCompanyId() {
        return companyByCompanyId;
    }

    public void setCompanyByCompanyId(CompanyEntity companyByCompanyId) {
        this.companyByCompanyId = companyByCompanyId;
    }
}
