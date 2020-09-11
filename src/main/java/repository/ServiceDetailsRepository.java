package repository;

import entity.ServiceDetailsEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceDetailsRepository extends CrudRepository<ServiceDetailsEntity, Integer>{
    
}
