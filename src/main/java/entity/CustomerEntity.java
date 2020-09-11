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
}
