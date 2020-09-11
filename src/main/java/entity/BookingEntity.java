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
}
