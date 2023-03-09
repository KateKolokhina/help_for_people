package com.naukma.helppeople.repository;


import com.naukma.helppeople.entity.request.Request;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface RequestRepository extends PagingAndSortingRepository<Request, Long> {

    List<Request> findAllByUserId(Long userId);

    @Override
    Optional<Request> findById(Long requestId);

    List<Request> findAllByUserId(Long userId, Sort sort);
}