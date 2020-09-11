package entity;

import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="servicedetails")
public class ServiceDetailsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private LocalDate time;
    private int numberOfPeople;
    
    @OneToOne(mappedBy = "servicedetails")
    private ServiceEntity service;
    
    @ManyToOne
    @JoinColumn(name="BookingDetailsID")//khóa ngoại 
    private BookingDetailsEntity bookingDetail;

    public ServiceDetailsEntity() {
    }

    public ServiceDetailsEntity(LocalDate time, int numberOfPeople, ServiceEntity service, BookingDetailsEntity bookingDetail) {
        this.time = time;
        this.numberOfPeople = numberOfPeople;
        this.service = service;
        this.bookingDetail = bookingDetail;
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

    public BookingDetailsEntity getBookingDetail() {
        return bookingDetail;
    }

    public void setBookingDetail(BookingDetailsEntity bookingDetail) {
        this.bookingDetail = bookingDetail;
    }
    
    
}
