package entity;

import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="booking")
public class BookingEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private LocalDate bookingDate;
    
    @OneToOne(mappedBy = "booking")
    private PaymentEntity payment;
    
    @OneToOne(mappedBy = "booking")
    private BookingDetailsEntity bookingDetails;
    
    @OneToOne(mappedBy = "booking")
    private CustomerEntity customer;

    public BookingEntity() {
    }

    public BookingEntity(LocalDate bookingDate, PaymentEntity payment, BookingDetailsEntity bookingDetails, CustomerEntity customer) {
        this.bookingDate = bookingDate;
        this.payment = payment;
        this.bookingDetails = bookingDetails;
        this.customer = customer;
    }

    public LocalDate getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(LocalDate bookingDate) {
        this.bookingDate = bookingDate;
    }

    public PaymentEntity getPayment() {
        return payment;
    }

    public void setPayment(PaymentEntity payment) {
        this.payment = payment;
    }

    public BookingDetailsEntity getBookingDetails() {
        return bookingDetails;
    }

    public void setBookingDetails(BookingDetailsEntity bookingDetails) {
        this.bookingDetails = bookingDetails;
    }

    public CustomerEntity getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }
    
    
}
