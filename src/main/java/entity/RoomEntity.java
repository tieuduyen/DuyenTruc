package entity;

import java.text.NumberFormat;
import java.util.Locale;
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
    @Column(name = "RoomID")
    private int id;   
    
    @Column(name = "RoomName")
    private String name;
    
    @Column(name = "Descriptions")
    private String descriptions;
    
    @Column(name = "Size")
    private String size;
    
    @Column(name="RoomImages")
    private String images;
    
    @Column(name="Price")
    private Double price;
    
    @ManyToOne
    @JoinColumn(name="HotelID")//khóa ngoại 
    private HotelEntity hotel;
    
    // n-1 voi bang BookingDetails
    @ManyToOne
    @JoinColumn(name="BookingDetailsID")//khóa ngoại 
    private BookingDetailsEntity bookingDetails;
    
    public RoomEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public BookingDetailsEntity getBookingDetails() {
        return bookingDetails;
    }

    public void setBookingDetails(BookingDetailsEntity bookingDetails) {
        this.bookingDetails = bookingDetails;
    }
    
    public String getPriceFormatted(){
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat priceFormat = NumberFormat.getCurrencyInstance(localeVN);
        return priceFormat.format(price);
    }
}
