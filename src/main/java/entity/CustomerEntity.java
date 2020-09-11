package entity;

import java.time.LocalDate;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="customer")
public class CustomerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private String email;
    @Column(name="CustomerName")
    private String name;
    private String phone;
    private String sex;
    private LocalDate birthdate;
    private String password;
    
    @OneToOne(mappedBy = "service")
    private CreditCardEntity creditCard;
    
    @OneToOne(mappedBy = "service")
    private BookingEntity booking;
    
    @OneToMany(mappedBy = "customer",fetch = FetchType.LAZY)
    List<CommentEntity> comment;

    public CustomerEntity() {
    }

    public CustomerEntity(String email, String name, String phone, String sex, LocalDate birthdate, String password, CreditCardEntity creditCard, BookingEntity booking, List<CommentEntity> comment) {
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.sex = sex;
        this.birthdate = birthdate;
        this.password = password;
        this.creditCard = creditCard;
        this.booking = booking;
        this.comment = comment;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public LocalDate getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(LocalDate birthdate) {
        this.birthdate = birthdate;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public List<CommentEntity> getComment() {
        return comment;
    }

    public void setComment(List<CommentEntity> comment) {
        this.comment = comment;
    }
    
    
}
