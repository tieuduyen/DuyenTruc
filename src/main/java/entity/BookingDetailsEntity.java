package entity;

import java.time.LocalDate;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="bookingDetails")
public class BookingDetailsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BookingDetailsID")
    private int id;
    
    @Column(name = "NumberOfPeople")
    private int numberOfPeople;
    
    @Column(name = "NumberOfRoom")
    private int numberOfRoom;
    
    @Column(name = "Price")
    private Double price;
    
    @Column(name = "CheckInDate")
    private LocalDate checkInDate;
    
    @Column(name = "CheckOutDate")
    private LocalDate checkOutDate;
    
    @OneToOne(mappedBy = "bookingDetails")
    private BookingEntity booking;
    
    // 1-n (BookingDetails-ServiceDetails)
    @OneToMany(mappedBy = "bookingDetails",fetch = FetchType.LAZY)
    List<ServiceDetailsEntity> serviceDetailsList;
    
    @ManyToOne
    @JoinColumn(name="RoomID")//khóa ngoại 
    private RoomEntity room;
    
    @OneToMany(mappedBy = "bookingDetails",fetch = FetchType.LAZY)
    List<BookingDetailsEntity> bookingDetailsList;

    public BookingDetailsEntity() {
    }
    
    
}
