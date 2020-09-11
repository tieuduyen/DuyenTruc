package entity;

import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="comment")
public class CommentEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private LocalDate commentDate;
    private Double rate;
    private String content;
    
    @ManyToOne
    @JoinColumn(name="CustomerID")//khóa ngoại 
    private CustomerEntity customer;
    
    @ManyToOne
    @JoinColumn(name="HotelID")//khóa ngoại 
    private HotelEntity hotel;

    public CommentEntity() {
    }

    public CommentEntity(LocalDate commentDate, Double rate, String content, CustomerEntity customer, HotelEntity hotel) {
        this.commentDate = commentDate;
        this.rate = rate;
        this.content = content;
        this.customer = customer;
        this.hotel = hotel;
    }

    public LocalDate getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(LocalDate commentDate) {
        this.commentDate = commentDate;
    }

    public Double getRate() {
        return rate;
    }

    public void setRate(Double rate) {
        this.rate = rate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public CustomerEntity getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }

    public HotelEntity getHotel() {
        return hotel;
    }

    public void setHotel(HotelEntity hotel) {
        this.hotel = hotel;
    }
    
    
}
