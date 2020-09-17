package entity;

import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="serviceDetails")
public class ServiceDetailsEntity {
    @Id
    @Column(name = "ServiceDetailsID")
    private int id;
    
    @Column(name = "Time")
    private LocalDate time;
    
    @Column(name = "NumberOfPeople")
    private int numberOfPeople;
    
    //Implement relationships with Service 1-1
    @OneToOne(mappedBy = "serviceDetails") //serviceDetails(**) ben ServiceEntity
    private ServiceEntity service;
    
    // n-1 (ServiceDetails-BookingDetails)
    @ManyToOne
    @JoinColumn(name="BookingDetailsID")//khóa ngoại 
    private BookingDetailsEntity bookingDetails;

    public ServiceDetailsEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
   
    public LocalDate getTime() {
        return time;
    }

    public void setTime(LocalDate time) {
        this.time = time;
    }

    public int getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(int numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public ServiceEntity getService() {
        return service;
    }

    public void setService(ServiceEntity service) {
        this.service = service;
    }

    public BookingDetailsEntity getBookingDetails() {
        return bookingDetails;
    }

    public void setBookingDetails(BookingDetailsEntity bookingDetails) {
        this.bookingDetails = bookingDetails;
    }
   
}
