package repository;

import entity.BookingEntity;
import entity.CommentEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentRepository extends CrudRepository<CommentEntity,Integer>{
    @Query(value="select count(*) from comment", nativeQuery = true)
    int getCountComment();
    
    @Query(value="select count(*) from Comment c join Users u on c.UserID = u.UserID WHERE u.UserID = ?1", nativeQuery = true)
    int getCountCommentByUser(int id);
    
    @Query(value = "SELECT c FROM CommentEntity c WHERE c.users.id = ?1")
    List<CommentEntity> findCommentByUserId(@Param("id") int id);
}
