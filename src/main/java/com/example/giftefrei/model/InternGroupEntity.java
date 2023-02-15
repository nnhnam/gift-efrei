package com.example.giftefrei.model;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
@Table(name = "intern_group", schema = "public", catalog = "giftefrei")
public class InternGroupEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "group_id", nullable = false)
    private int groupId;
    @Basic
    @Column(name = "name", nullable = false, length = 50)
    private String name;
    @OneToMany(mappedBy = "internGroupByGroupId")
    private Collection<InternEntity> internsByGroupId;

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        InternGroupEntity that = (InternGroupEntity) o;

        if (groupId != that.groupId) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = groupId;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }

    public Collection<InternEntity> getInternsByGroupId() {
        return internsByGroupId;
    }

    public void setInternsByGroupId(Collection<InternEntity> internsByGroupId) {
        this.internsByGroupId = internsByGroupId;
    }
}
