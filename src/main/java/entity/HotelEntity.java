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
}
