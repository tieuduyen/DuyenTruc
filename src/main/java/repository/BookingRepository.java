package repository;

import entity.BookingEntity;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingRepository extends CrudRepository<BookingEntity, Integer> {

    @Query(value = "select count(*) from booking", nativeQuery = true)
    int getCountBooking();

    @Query(value = "select * from booking where status = 'Pending'", nativeQuery = true)
    List<BookingEntity> getBookingPending();
    
    @Query(value = "select count(*) from booking where Status = 'Pending'", nativeQuery = true)
    int getCountBookingPending();

    @Query(value = "select * from booking where status = 'Processed'", nativeQuery = true)
    List<BookingEntity> getBookingProcessed();
    
    @Query(value = "select count(*) from booking where Status = 'Processed'", nativeQuery = true)
    int getCountBookingProcessed();

    @Query(value = "select * from booking where status = 'Cancelled'", nativeQuery = true)
    List<BookingEntity> getBookingCancelled();
    
    @Query(value = "select count(*) from booking where Status = 'Cancelled'", nativeQuery = true)
    int getCountBookingCancelled();

    @Query(value = "SELECT b FROM BookingEntity b WHERE b.users.id = ?1")
    List<BookingEntity> findBookingByUserId(@Param("id") int id);

    @Query(value = "select count(*) from Booking b join Users u on b.UserID = u.UserID WHERE u.UserID = ?1", nativeQuery = true)
    int getCountBookingByUser(int id);

    @Query(value = "SELECT b FROM BookingEntity b WHERE b.bookingDate between '2020-10-01' and '2020-10-31' ")
    List<BookingEntity> findBookingInOctober();

    @Query(value = "SELECT b FROM BookingEntity b WHERE b.bookingDate between '2020-09-01' and '2020-09-30' ")
    List<BookingEntity> findBookingInSeptember();

    @Query(value = "select * from booking where status = 'Pending'", nativeQuery = true)
    List<BookingEntity> findBookings(Pageable pageable);
    
    @Query(value = "select * from booking where status = 'Pending' ORDER BY BookingDate DESC limit  ?1 , ?2 ", nativeQuery = true)
    List<BookingEntity> getBookingPending(int pageBookingId, int limitBooking);
    
    @Query(value = "select * from booking ORDER BY BookingDate DESC limit  ?1 , ?2 ", nativeQuery = true)
    List<BookingEntity> getAllBooking(int pageBookingId, int limitBooking);
    
    @Query(value = "select * from booking where Status = 'Pending' ORDER BY BookingDate DESC limit  ?1 , ?2 ", nativeQuery = true)
    List<BookingEntity> getAllBookingPending(int pageBookingPendingId, int limitBookingPending);
    
    @Query(value = "select * from booking where Status = 'Processed' ORDER BY BookingDate DESC limit  ?1 , ?2 ", nativeQuery = true)
    List<BookingEntity> getAllBookingProcessed(int pageBookingProcessedId, int limitBookingProcessed);
    
    @Query(value = "select * from booking where Status = 'Cancelled' ORDER BY BookingDate DESC limit  ?1 , ?2 ", nativeQuery = true)
    List<BookingEntity> getAllBookingCancelled(int pageBookingCancelledId, int limitBookingCancelled);
    
    BookingEntity findById(int id);

}
