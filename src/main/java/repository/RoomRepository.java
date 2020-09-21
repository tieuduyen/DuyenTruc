package repository;

import entity.RoomEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomRepository extends CrudRepository<RoomEntity, Integer> {

    //Query("SELECT r FROM RoomEntity r WHERE r.hotel.name = :name ")
    //List<RoomEntity> findRoomByName(@Param("name") String name);
    
   // @Query("SELECT r FROM RoomEntity r WHERE  r.name = :name")
    //RoomEntity findRoomDetailsByName(@Param("name") String name);
}
