
package repository;

import entity.RoomTypeEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomTypeRepository extends CrudRepository<RoomTypeEntity,Integer> {
    @Query(value="select * from roomtype  limit 4", nativeQuery = true)
    List<RoomTypeEntity> getAllRoomType();
}
