package com.naukma.helppeople.repository;

import com.naukma.helppeople.entity.Category;
import com.naukma.helppeople.entity.HelpRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HelpRequestRepository extends PagingAndSortingRepository<HelpRequest, Long> {
    List<HelpRequest> findAllByClient_Id(Long userId);

    List<HelpRequest> findAllByClient_Id(Long userId, Sort sort);
}
