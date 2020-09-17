
package repository;

import entity.CityEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CityRepository extends CrudRepository<CityEntity,Integer>{
    @Query(value="select * from city limit 3", nativeQuery = true)
    List<CityEntity> getCityImages();
}
