package com.example.giftefrei.model;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
@Table(name = "company", schema = "public", catalog = "giftefrei")
public class CompanyEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "company_id", nullable = false)
    private int companyId;
    @Basic
    @Column(name = "name", nullable = false, length = 50)
    private String name;
    @Basic
    @Column(name = "address", nullable = false, length = 100)
    private String address;
    @OneToMany(mappedBy = "companyByCompanyId")
    private Collection<InternshipEntity> internshipsByCompanyId;

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CompanyEntity that = (CompanyEntity) o;

        if (companyId != that.companyId) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (address != null ? !address.equals(that.address) : that.address != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = companyId;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        return result;
    }

    public Collection<InternshipEntity> getInternshipsByCompanyId() {
        return internshipsByCompanyId;
    }

    public void setInternshipsByCompanyId(Collection<InternshipEntity> internshipsByCompanyId) {
        this.internshipsByCompanyId = internshipsByCompanyId;
    }
}
