package repository;

import entity.BookingDetailsEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

//giao tiep voi database
@Repository
public interface BookingDetailsRepository extends CrudRepository<BookingDetailsEntity, Integer> {

    List<BookingDetailsEntity> findById(int id);

    @Query(value = "SELECT bd FROM BookingDetailsEntity bd WHERE bd.booking.id = ?1 ")
    List<BookingDetailsEntity> findBookingDetailsByBookingId(@Param("id") int id);

    @Query(value = "select count(*) from bookingDetails where bookingID = ?1", nativeQuery = true)
    int getCountBookingDetailsByBookingId(int id);

    @Query(value = "SELECT sum(bd.price) FROM BookingDetailsEntity bd WHERE bd.booking.id = ?1 ")
    double getTotalBookingDetails(@Param("id") int id);

    @Query(value = "select sum(price)\n"
            + "from bookingdetails\n"
            + "where  (CheckInDate between '2020-10-01' and '2020-10-31')\n"
            + "and (CheckOutDate between '2020-10-01' and '2020-10-31')", nativeQuery = true)
    double getIncomesBookingDetailsOctobor();
    
    @Query(value = "select sum(price) from bookingdetails", nativeQuery = true)
    double getIncomesBookingDetails();
    
    

}
