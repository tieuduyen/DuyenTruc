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

    public PaymentEntity() {
    }

    public PaymentEntity(Double price, CreditCardEntity creditCard, BookingEntity booking) {
        this.price = price;
        this.creditCard = creditCard;
        this.booking = booking;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public CreditCardEntity getCreditCard() {
        return creditCard;
    }

    public void setCreditCard(CreditCardEntity creditCard) {
        this.creditCard = creditCard;
    }

    public BookingEntity getBooking() {
        return booking;
    }

    public void setBooking(BookingEntity booking) {
        this.booking = booking;
    }
     
     
}
