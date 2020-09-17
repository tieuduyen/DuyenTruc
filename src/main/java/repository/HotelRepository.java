
package repository;

import entity.HotelEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HotelRepository extends CrudRepository<HotelEntity,Integer>{
    //@Query(value = "SELECT h FROM CityEntity c Join HotelEntity h On c.id=h.id WHERE  h.city.name = ?1")
    //List<HotelEntity> findHotelByName(String name);
    //@Query(value = "SELECT h FROM HotelEntity h WHERE h.city.cityName = ?1")
    //List<HotelEntity> findHotelByCityName(String cityName);
    @Query(value = "SELECT h FROM HotelEntity h WHERE h.city.name = ?1")
    List<HotelEntity> findHotelByName(String name);
    
}
