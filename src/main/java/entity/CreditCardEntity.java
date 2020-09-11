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

    public CreditCardEntity() {
    }

    public CreditCardEntity(String creditCardType, String creditCardNumber, String cardholdersName, LocalDate expirationDate, Double surplus, PaymentEntity payment, CustomerEntity customer) {
        this.creditCardType = creditCardType;
        this.creditCardNumber = creditCardNumber;
        this.cardholdersName = cardholdersName;
        this.expirationDate = expirationDate;
        this.surplus = surplus;
        this.payment = payment;
        this.customer = customer;
    }

    public String getCreditCardType() {
        return creditCardType;
    }

    public void setCreditCardType(String creditCardType) {
        this.creditCardType = creditCardType;
    }

    public String getCreditCardNumber() {
        return creditCardNumber;
    }

    public void setCreditCardNumber(String creditCardNumber) {
        this.creditCardNumber = creditCardNumber;
    }

    public String getCardholdersName() {
        return cardholdersName;
    }

    public void setCardholdersName(String cardholdersName) {
        this.cardholdersName = cardholdersName;
    }

    public LocalDate getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(LocalDate expirationDate) {
        this.expirationDate = expirationDate;
    }

    public Double getSurplus() {
        return surplus;
    }

    public void setSurplus(Double surplus) {
        this.surplus = surplus;
    }

    public PaymentEntity getPayment() {
        return payment;
    }

    public void setPayment(PaymentEntity payment) {
        this.payment = payment;
    }

    public CustomerEntity getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }
    
    
}
