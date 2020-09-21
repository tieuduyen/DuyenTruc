package entity;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
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
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Entity
@Table(name = "customer")
public class CustomerEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CustomerID")
    private int id;

    @Column(name = "Email")
    private String email;

    @Column(name = "CustomerName")
    private String name;

    @Column(name = "phone")
    private String phone;

    @Column(name = "Sex")
    private String sex;

    @Column(name = "Birthdate")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birthdate;

    @Column(name = "Password")
    private String password;

    @Column(name = "username")
    private String username;

    @Column(name = "enabled")
    private boolean enabled;

    //Implement relationships with CreditCard 1-1
    @OneToOne(mappedBy = "customer")
    private CreditCardEntity creditCard;

    //Setup relationshipss with CreditCard
    @OneToMany(mappedBy = "customer", fetch = FetchType.LAZY)
    List<BookingEntity> bookingList;

    @OneToMany(mappedBy = "customer", fetch = FetchType.LAZY)
    List<CommentEntity> comment;

    public CustomerEntity() {

    }

    public CustomerEntity(int id, String email, String name, String phone, String sex, LocalDate birthdate, String password, String username, boolean enabled) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.sex = sex;
        this.birthdate = birthdate;
        this.password = password;
        this.username = username;
        this.enabled = enabled;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public CreditCardEntity getCreditCard() {
        return creditCard;
    }

    public void setCreditCard(CreditCardEntity creditCard) {
        this.creditCard = creditCard;
    }

    public List<BookingEntity> getBookingList() {
        return bookingList;
    }

    public void setBookingList(List<BookingEntity> bookingList) {
        this.bookingList = bookingList;
    }

    public List<CommentEntity> getComment() {
        return comment;
    }

    public void setComment(List<CommentEntity> comment) {
        this.comment = comment;
    }

    public String getBirthDateFormatted() {
        DateTimeFormatter birthDateFormat = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return birthDateFormat.format(birthdate);
    }



}
