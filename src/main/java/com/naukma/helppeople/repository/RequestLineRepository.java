package com.naukma.helppeople.repository;

import com.naukma.helppeople.entity.request.RequestLine;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.Set;

@Repository
public interface RequestLineRepository extends CrudRepository<RequestLine, Long> {

    List<RequestLine> findRequestLinesById_RequestId(Long id);

    List<RequestLine> findAllById_RequestIdAndId_ProductIdIn(@Param("id") Long id, Set<Long> productId);

    Optional<RequestLine> findRequestLineById_RequestIdAndId_ProductId(@Param("id") Long id, Long productId);

}