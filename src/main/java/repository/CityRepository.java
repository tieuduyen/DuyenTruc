
package repository;

import entity.CityEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CityRepository extends CrudRepository<CityEntity,Integer>{
     CityEntity findByName(String name);
    
    //CityEntity findByNameLike(String name);
    
    CityEntity findById(int id);
    
    @Query(value="select * from city limit 3", nativeQuery = true)
    List<CityEntity> getAllCity();
    
    @Query(value="select count(*) from city", nativeQuery = true)
    int getCountCity();
     
    @Query(value = "SELECT c FROM CityEntity c WHERE c.name = ?1 ")
    CityEntity findCityByName(String name);
    
    @Query(value = "select * from city ORDER BY CityID DESC limit  ?1 , ?2 ", nativeQuery = true)
    List<CityEntity> getAllCity(int pageCityId, int limitCity);
    
    @Query(value = "select * from city ORDER BY CityName DESC limit  ?1 , ?2 ", nativeQuery = true)
    List<CityEntity> sortCityDESC(int pageCityId, int limitCity);
    
    @Query(value = "select * from city ORDER BY CityName ASC limit  ?1 , ?2 ", nativeQuery = true)
    List<CityEntity> sortCityASC(int pageCityId, int limitCity);
    
    List<CityEntity> findByNameLike(String name);
}

