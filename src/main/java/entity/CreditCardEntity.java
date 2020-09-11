package entity;

import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="creditcard")
public class CreditCardEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private String creditCardType;
    private String creditCardNumber;
    private String cardholdersName;
    private LocalDate expirationDate;
    private Double surplus;
    
    @OneToOne(mappedBy = "creditcard")
    private PaymentEntity payment;
    
    @OneToOne(mappedBy = "creditcard")
    private CustomerEntity customer;
}
