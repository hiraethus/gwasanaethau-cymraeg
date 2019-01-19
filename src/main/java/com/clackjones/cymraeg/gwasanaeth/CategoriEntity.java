package com.clackjones.cymraeg.gwasanaeth;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name="CategoriEntity")
@NamedQueries({
        @NamedQuery(name = "CategoriEntity.findAll",
                query = "SELECT c FROM CategoriEntity c")
})
class CategoriEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "categori")
    protected String categori;

    @Deprecated
    @Column(name="category_img", nullable = true)
    private String categoryImg;

    public Long getId() {
        return id;
    }

    public void setId(Long id) { }

    @OneToMany
    protected Collection<GwasanaethEntity> gwasanaethau;

    public String getCategori() {
        return categori;
    }

    public void setCategori(String categori) {
        this.categori = categori;
    }

    public Collection<GwasanaethEntity> getGwasanaethau() {
        return gwasanaethau;
    }

    public void setGwasanaethau(Collection<GwasanaethEntity> gwasanaethau) {
        this.gwasanaethau = gwasanaethau;
    }

    public String getCategoryImg() {
        return categoryImg;
    }

    public void setCategoryImg(String categoryImg) {
        this.categoryImg = categoryImg;
    }
}
