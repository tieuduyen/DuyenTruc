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
@Table(name = "rate")
public class RateEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "RateID")
    private int id;
    
    @Column(name = "TypeRate")
    private int typeRate;
    
    @OneToMany(mappedBy = "rate",fetch = FetchType.LAZY)
    List<HotelEntity> hotelList;

    public RateEntity() {
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTypeRate() {
        return typeRate;
    }

    public void setTypeRate(int typeRate) {
        this.typeRate = typeRate;
    }

    public List<HotelEntity> getHotelList() {
        return hotelList;
    }

    public void setHotelList(List<HotelEntity> hotelList) {
        this.hotelList = hotelList;
    }
    
    
}
