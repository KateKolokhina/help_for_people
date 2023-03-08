package com.naukma.helppeople.repository;

import com.naukma.helppeople.entity.Category;
import com.naukma.helppeople.entity.HelpRequestLine;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.Set;

@Repository
public interface HelpRequestLineRepository extends CrudRepository<HelpRequestLine, Long> {
    List<HelpRequestLine> findRequestLinesByHelpRequest_Id(Long id);

    List<HelpRequestLine> findRequestLineByHelpRequest_IdAndProduct_IdIn(@Param("id") Long id, Set<Long> productId);

    Optional<HelpRequestLine> findRequestLineByHelpRequest_IdAndProduct_Id(@Param("id") Long id, Long productId);

}
