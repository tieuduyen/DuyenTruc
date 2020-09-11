package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="payment")
public class PaymentEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private Double price;
    
     @OneToOne(mappedBy = "payment")
    private CreditCardEntity creditCard;
     
     @OneToOne(mappedBy = "payment")
    private BookingEntity booking;
}
