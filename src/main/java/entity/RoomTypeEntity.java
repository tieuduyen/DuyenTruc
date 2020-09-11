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
@Table(name="roomtype")
public class RoomTypeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
    private String roomTypeName;
    private String description;
    private String size;
    @Column(name="RoomImages")
    private String images;
    private Double price;
    
    @ManyToOne
    @JoinColumn(name="HotelID")//khóa ngoại 
    private HotelEntity hotel;
    
    @ManyToOne
    @JoinColumn(name="BookingDetailsID")//khóa ngoại 
    private BookingDetailsEntity bookingDetails;

    public RoomTypeEntity() {
    }

    public RoomTypeEntity(String roomTypeName, String description, String size, String images, Double price, HotelEntity hotel, BookingDetailsEntity bookingDetails) {
        this.roomTypeName = roomTypeName;
        this.description = description;
        this.size = size;
        this.images = images;
        this.price = price;
        this.hotel = hotel;
        this.bookingDetails = bookingDetails;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public HotelEntity getHotel() {
        return hotel;
    }

    public void setHotel(HotelEntity hotel) {
        this.hotel = hotel;
    }

    public BookingDetailsEntity getBookingDetails() {
        return bookingDetails;
    }

    public void setBookingDetails(BookingDetailsEntity bookingDetails) {
        this.bookingDetails = bookingDetails;
    }
    
    
}
