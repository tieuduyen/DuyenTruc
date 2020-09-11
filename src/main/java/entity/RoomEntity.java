package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="room")
public class RoomEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private String description;
    private String size;
    @Column(name="RoomImages")
    private String images;
    private Double price;
    
    @ManyToOne
    @JoinColumn(name="RoomTypeID")//khóa ngoại 
    private RoomTypeEntity roomType;
    
    @ManyToOne
    @JoinColumn(name="BookingDetailsID")//khóa ngoại 
    private BookingDetailsEntity bookingDetails;
    
}
