package entity;

import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="creditcard")
public class CreditCardEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CreditCardID")
    private int id;
    
    @Column(name = "CreditCardType")
    private String creditCardType;
    
    @Column(name = "CreditCardNumber")
    private String creditCardNumber;
    
    @Column(name = "CardholdersName")
    private String cardholdersName;
    
    @Column(name = "ExpirationDate")
    private LocalDate expirationDate;
    
    @Column(name = "Surplus")
    private Double surplus;
    
    //Implement relationships with Customer 1-1
    @OneToOne(mappedBy = "creditCard")
    private CustomerEntity customer;
    
    //Setup relationshipss with Payment
    @OneToOne()
    @PrimaryKeyJoinColumn
    private PaymentEntity payment;//(3)


    public CreditCardEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
