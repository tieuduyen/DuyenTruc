package entity;

import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "booking")
public class BookingEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BookingID")
    private int id;

    @Column(name = "BookingDate")
    private LocalDate bookingDate;

    //Setup relationshipss with Payment
    @OneToOne()
    @PrimaryKeyJoinColumn
    private PaymentEntity payment;//

    //Setup relationshipss with bookingDetails
    @OneToOne()
    @PrimaryKeyJoinColumn
    private BookingDetailsEntity bookingDetails;//

    // n-1 voi bang Rate
    @ManyToOne
    @JoinColumn(name = "CustomerID")//khóa ngoại 
    private CustomerEntity customer;

    public BookingEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
