package entity;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="hotel")
public class HotelEntity { 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    @Column(name="hotelName")
    private String name;
    @Column(name="hotelPhone")
    private String phone;
    @Column(name="hotelEmail")
    private String email;
    @Column(name="hotelImages")
    private String images;
    private Double rate;
    @Column(name="HotelAddress")
    private String address;
    private String promotion;
    
    @ManyToOne
    @JoinColumn(name="CityID")//khóa ngoại 
    private CityEntity city;
    
    @OneToMany(mappedBy = "hotel",fetch = FetchType.LAZY)
    List<ServiceEntity> serviceList;
    
    @OneToMany(mappedBy = "hotel",fetch = FetchType.EAGER)
    List<CommentEntity> commentList;
    
    @OneToMany(mappedBy = "hotel",fetch = FetchType.EAGER)
    List<RoomTypeEntity> roomTypeList;

    public HotelEntity() {
    }

    public HotelEntity(String name, String phone, String email, String images, Double rate, String address, String promotion, CityEntity city, List<ServiceEntity> serviceList, List<CommentEntity> commentList, List<RoomTypeEntity> roomTypeList) {
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.images = images;
        this.rate = rate;
        this.address = address;
        this.promotion = promotion;
        this.city = city;
        this.serviceList = serviceList;
        this.commentList = commentList;
        this.roomTypeList = roomTypeList;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public Double getRate() {
        return rate;
    }

    public void setRate(Double rate) {
        this.rate = rate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPromotion() {
        return promotion;
    }

    public void setPromotion(String promotion) {
        this.promotion = promotion;
    }

    public CityEntity getCity() {
        return city;
    }

    public void setCity(CityEntity city) {
        this.city = city;
    }

    public List<ServiceEntity> getServiceList() {
        return serviceList;
    }

    public void setServiceList(List<ServiceEntity> serviceList) {
        this.serviceList = serviceList;
    }

    public List<CommentEntity> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<CommentEntity> commentList) {
        this.commentList = commentList;
    }

    public List<RoomTypeEntity> getRoomTypeList() {
        return roomTypeList;
    }

    public void setRoomTypeList(List<RoomTypeEntity> roomTypeList) {
        this.roomTypeList = roomTypeList;
    }
    
    
}
