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
    @Column(name = "RoomTypeID")
    private int id;
    
    private String roomTypeName;
    private String descriptions;
    private String size;
    
    @Column(name="RoomImages")
    private String images;
    
    private Double price;
    
    @ManyToOne
    @JoinColumn(name="HotelID")//khóa ngoại 
    private HotelEntity hotel;
    
    @OneToMany(mappedBy = "roomtype",fetch = FetchType.LAZY)
    List<BookingDetailsEntity> bookingDetailsList;
    
    @OneToMany(mappedBy = "roomtype",fetch = FetchType.LAZY)
    List<RoomEntity> roomList;

    public RoomTypeEntity() {
    }

    public RoomTypeEntity(int id, String roomTypeName, String descriptions, String size, String images, Double price, HotelEntity hotel, List<BookingDetailsEntity> bookingDetailsList) {
        this.id = id;
        this.roomTypeName = roomTypeName;
        this.descriptions = descriptions;
        this.size = size;
        this.images = images;
        this.price = price;
        this.hotel = hotel;
        this.bookingDetailsList = bookingDetailsList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoomTypeName() {
        return roomTypeName;
    }

    public void setRoomTypeName(String roomTypeName) {
        this.roomTypeName = roomTypeName;
    }

    public String getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
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

    public List<BookingDetailsEntity> getBookingDetailsList() {
        return bookingDetailsList;
    }

    public void setBookingDetailsList(List<BookingDetailsEntity> bookingDetailsList) {
        this.bookingDetailsList = bookingDetailsList;
    }

    
    
}
