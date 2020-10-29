package repository;

import entity.HotelEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface HotelRepository extends CrudRepository<HotelEntity, Integer> {

    HotelEntity findById(int id);
    
    HotelEntity findByName(String name);
    
    List<HotelEntity> findByNameLike(String name);
    
    @Query(value = "SELECT h FROM HotelEntity h WHERE h.city.id = ?1 ")
    List<HotelEntity> findHotelByCityId(@Param("id") int id);

    @Query(value="select count(*) from hotel", nativeQuery = true)
    int getCountHotel();
    
    @Query(value="select count(*) from hotel h join city c on h.CityID = c.CityID where c.cityId = ?1", nativeQuery = true)
    int getCountHotelByCity(int id);
    
    @Query("SELECT h FROM HotelEntity h WHERE h.city.name = :name")
    List<HotelEntity> findHotelByName(@Param("name") String name);

    @Query(value = "SELECT h FROM HotelEntity h WHERE h.city.name = ?1 ORDER BY h.evaluate DESC")
    List<HotelEntity> sortHotelByEvaluateHighToLow(String name);

    @Query(value = "SELECT h FROM HotelEntity h WHERE h.city.name = ?1 ORDER BY h.evaluate ASC")
    List<HotelEntity> sortHotelByEvaluateLowToHigh(String name);
    
    @Query(value = "select * from hotel ORDER BY HotelID DESC limit  ?1 , ?2 ", nativeQuery = true)
    List<HotelEntity> getAllHotel(int pageHotelId, int limitHotel);
    
    @Query(value = "select * from hotel ORDER BY HotelName DESC limit  ?1 , ?2 ", nativeQuery = true)
    List<HotelEntity> sortHotelDESC(int pageHotelId, int limitHotel);
    
    @Query(value = "select * from hotel ORDER BY HotelName ASC limit  ?1 , ?2 ", nativeQuery = true)
    List<HotelEntity> sortHotelASC(int pageHotelId, int limitHotel);

}
