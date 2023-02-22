package com.naukma.helppeople.repository;

import com.naukma.helppeople.entity.Category;
import com.naukma.helppeople.entity.HelpRequest;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HelpRequestRepository extends CrudRepository<HelpRequest, Long> {

}
