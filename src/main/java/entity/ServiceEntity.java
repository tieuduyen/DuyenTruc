package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="service")
public class ServiceEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private String serviceName;
    private Double price;
    
    @OneToOne(mappedBy = "service")
    private ServiceDetailsEntity serviceDetails;
    
    @ManyToOne
    @JoinColumn(name="HotelID")//khóa ngoại 
    private HotelEntity hotel;

    public ServiceEntity() {
    }

    public ServiceEntity(String serviceName, Double price, ServiceDetailsEntity serviceDetails, HotelEntity hotel) {
        this.serviceName = serviceName;
        this.price = price;
        this.serviceDetails = serviceDetails;
        this.hotel = hotel;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public ServiceDetailsEntity getServiceDetails() {
        return serviceDetails;
    }

    public void setServiceDetails(ServiceDetailsEntity serviceDetails) {
        this.serviceDetails = serviceDetails;
    }

    public HotelEntity getHotel() {
        return hotel;
    }

    public void setHotel(HotelEntity hotel) {
        this.hotel = hotel;
    }
    
    
}
