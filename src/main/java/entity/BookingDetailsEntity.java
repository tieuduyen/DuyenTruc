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
    List<RoomTypeEntity> roomTypeList;

    public BookingDetailsEntity() {
    }

    public BookingDetailsEntity(int numberOfPeople, int numberOfRoom, Double price, LocalDate checkInDate, LocalDate checkOutDate, BookingEntity booking, List<ServiceDetailsEntity> serviceDetailsList, List<RoomTypeEntity> roomTypeList) {
        this.numberOfPeople = numberOfPeople;
        this.numberOfRoom = numberOfRoom;
        this.price = price;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.booking = booking;
        this.serviceDetailsList = serviceDetailsList;
        this.roomTypeList = roomTypeList;
    }

    public int getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(int numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public int getNumberOfRoom() {
        return numberOfRoom;
    }

    public void setNumberOfRoom(int numberOfRoom) {
        this.numberOfRoom = numberOfRoom;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public LocalDate getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(LocalDate checkInDate) {
        this.checkInDate = checkInDate;
    }

    public LocalDate getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(LocalDate checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public BookingEntity getBooking() {
        return booking;
    }

    public void setBooking(BookingEntity booking) {
        this.booking = booking;
    }

    public List<ServiceDetailsEntity> getServiceDetailsList() {
        return serviceDetailsList;
    }

    public void setServiceDetailsList(List<ServiceDetailsEntity> serviceDetailsList) {
        this.serviceDetailsList = serviceDetailsList;
    }

    public List<RoomTypeEntity> getRoomTypeList() {
        return roomTypeList;
    }

    public void setRoomTypeList(List<RoomTypeEntity> roomTypeList) {
        this.roomTypeList = roomTypeList;
    }
    
    
}
