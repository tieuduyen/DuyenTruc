package entity;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="city")
public class CityEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CityID")
    private int id;
    
    @Column(name = "CityName")
    private String name;
    
    @OneToMany(mappedBy = "city",fetch = FetchType.LAZY)
    List<HotelEntity> hotelList;

    public CityEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<HotelEntity> getHotelList() {
        return hotelList;
    }

    public void setHotelList(List<HotelEntity> hotelList) {
        this.hotelList = hotelList;
    }  

}
