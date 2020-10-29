package repository;

import entity.UsersEntity;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UsersRepository extends CrudRepository<UsersEntity, Integer> {

    @Query(value = "select count(*) from users", nativeQuery = true)
    int getCountUsers();
    
    
    //@Query(value = "select DATEDIFF(current_date(),RegisterDate)"
    //        + "from users"
     //       + "where UserID = ?1", nativeQuery = true)
    //int getRegisterDate(int id);

    @Query("select u FROM UsersEntity u WHERE password = ?1")
    public UsersEntity findByPassword(@Param("password") String password);

    @Query("select u FROM UsersEntity u WHERE userName = ?1")
    UsersEntity findByUsername(String username);

    @Query("select u FROM UsersEntity u WHERE email = ?1")
    UsersEntity findByEmail(String email);

    List<UsersEntity> findByUsernameLikeOrEmailLikeOrNameLike(String username, String email, String name);

    @Query(value = "SELECT u FROM UsersEntity u ORDER BY u.username DESC")
    List<UsersEntity> sortUsersDESC();

    @Query(value = "SELECT u FROM UsersEntity u ORDER BY u.username ASC")
    List<UsersEntity> sortUsersASC();

    @Query("select u FROM UsersEntity u WHERE id = ?1")
    UsersEntity findById(int id);
    
    @Query(value = "select * from users limit  ?1 , ?2 ", nativeQuery = true)
    List<UsersEntity> getAllUsers(int pageUserId, int limitUser);

}
