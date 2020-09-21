
package repository;

import entity.RoomTypeEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomTypeRepository extends CrudRepository<RoomTypeEntity,Integer> {
    @Query("SELECT rt FROM RoomTypeEntity rt WHERE rt.hotel.name = :name ")
    List<RoomTypeEntity> findRoomTypeByName(@Param("name") String name);
    
    @Query("SELECT rt FROM RoomTypeEntity rt WHERE  rt.name = :name")
   RoomTypeEntity findRoomDetailsByName(@Param("name") String name);
}
