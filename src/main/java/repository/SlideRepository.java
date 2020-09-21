
package repository;

import entity.SlideEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SlideRepository extends CrudRepository<SlideEntity,Integer>{
    
}
