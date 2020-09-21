
package repository;

import entity.CustomerEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends CrudRepository<CustomerEntity,Integer>{
    
    // get username, pasword
    
    @Query(value="select * from customer", nativeQuery = true)
    List<CustomerEntity> getAllCustomers();

    //CustomerEntity getCustomerById (int id);

    //CustomerEntity getCustomerByUsername (String username);
}
