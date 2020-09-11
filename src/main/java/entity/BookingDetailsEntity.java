package entity;

import java.time.LocalDate;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="bookingdetails")
public class BookingDetailsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private int numberOfPeople;
    private int numberOfRoom;
    private Double price;
    private LocalDate checkInDate;
    private LocalDate checkOutDate;
    
    @OneToOne(mappedBy = "bookingdetails")
    private BookingEntity booking;
     
    @OneToMany(mappedBy = "bookingdetails",fetch = FetchType.LAZY)
    List<ServiceDetailsEntity> serviceDetailsList;
    
    @OneToMany(mappedBy = "bookingdetails",fetch = FetchType.LAZY)
    List<RoomEntity> roomList;
}
