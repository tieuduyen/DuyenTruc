package entity;

import java.util.List;
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
    
    private String cityName;
    
    @OneToMany(mappedBy = "city",fetch = FetchType.EAGER)
    List<HotelEntity> hotelList;

    public CityEntity() {
    }

    public CityEntity(String cityName, List<HotelEntity> hotelList) {
        this.cityName = cityName;
        this.hotelList = hotelList;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public List<HotelEntity> getHotelList() {
        return hotelList;
    }

    public void setHotelList(List<HotelEntity> hotelList) {
        this.hotelList = hotelList;
    }  

}
