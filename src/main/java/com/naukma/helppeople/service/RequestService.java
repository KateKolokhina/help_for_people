package com.naukma.helppeople.service;

import com.naukma.helppeople.entity.HelpRequest;
import com.naukma.helppeople.entity.HelpRequestLine;
import com.naukma.helppeople.entity.Product;
import com.naukma.helppeople.entity.User;
import com.naukma.helppeople.entity.dto.RequestInfoDTO;
import com.naukma.helppeople.entity.dto.RequestLineDTO;
import com.naukma.helppeople.exceptionHandlers.exceptions.InvalidData;
import com.naukma.helppeople.exceptionHandlers.exceptions.ProductNotFoundException;
import com.naukma.helppeople.exceptionHandlers.exceptions.RequestNotFoundException;
import com.naukma.helppeople.repository.HelpRequestLineRepository;
import com.naukma.helppeople.repository.HelpRequestRepository;
import com.naukma.helppeople.repository.ProductRepository;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Log4j2
public class RequestService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private HelpRequestLineRepository requestLineRepository;

    @Autowired
    private UserService userService;

    private static List<String> sortParams = Arrays.asList("id", "user", "dateCreate", "status");

    @Autowired
    private HelpRequestRepository requestRepository;

    public List<HelpRequest> getAllRequests(String sortParam, String sortType, Long userId) {
        if (sortParam == null && sortType == null) {
            if (userId == null) {
                List<HelpRequest> res = new ArrayList<>();
                Iterable<HelpRequest> fromDB = requestRepository.findAll();
                fromDB.iterator().forEachRemaining(res::add);
                return res;
            } else
                return requestRepository.findAllByClient_Id(userId);
        }
        if (sortParam != null && sortType == null)
            sortType = "ASC";
        if (!sortParams.contains(sortParam)) {
            throw new InvalidData(Collections.singletonMap("sortParam", sortParam));
        }
        if (sortType.equals("ASC") || sortType.equals("DESC")) {
            if (userId != null)
                return requestRepository.findAllByClient_Id(userId, Sort.by(Sort.Direction.valueOf(sortType), sortParam));
            else {
                List<HelpRequest> res = new ArrayList<>();
                Iterable<HelpRequest> fromDB = requestRepository.findAll(Sort.by(Sort.Direction.valueOf(sortType), sortParam));
                fromDB.iterator().forEachRemaining(res::add);
                return res;
            }
        } else
            throw new InvalidData(Collections.singletonMap("sortType", sortType));
    }

    @Transactional
    public void deleteRequest(Long id) {
        Optional<HelpRequest> receipt = requestRepository.findById(id);
        if (!receipt.isPresent()) {
            throw new RequestNotFoundException(id);
        } else {
            List<HelpRequestLine> lines = requestLineRepository.findRequestLinesByHelpRequest_Id(id);
            requestLineRepository.deleteAll(lines);
            requestRepository.deleteById(id);
        }
    }

    public HelpRequest createRequest(RequestInfoDTO dto) {
        HelpRequest request = new HelpRequest();
        request.setClient(userService.findUserById(dto.getUserId()));
        request.setAdmin(userService.findUserById(dto.getAdminId()));
        request.setDateCreate(LocalDate.now());
        return requestRepository.save(request);
    }

    public void updateProductsInRequest(Long id, ArrayList<RequestLineDTO> dtos) {
        Map<Long, Integer> newVal = dtos.stream().collect(Collectors.toMap(RequestLineDTO::getId, RequestLineDTO::getAmount));

        if (!requestRepository.findById(id).isPresent()) {
            throw new RequestNotFoundException(id);
        }
        List<HelpRequestLine> pr = requestLineRepository.findRequestLineByHelpRequest_IdAndProduct_IdIn(id, newVal.keySet());
        for (HelpRequestLine prod : pr) {
            prod.setAmount(newVal.get(prod.getProductId()));
        }
        requestLineRepository.saveAll(pr);
    }

    public boolean editRequestInfo(Long id, HelpRequest editedInfo, Long adminId) {
        HelpRequest request;

        if (requestRepository.findById(id).isPresent()) {
            request = requestRepository.findById(id).get();
        } else {
            throw new RequestNotFoundException(id);
        }

        User user = userService.findUserById(adminId);
        request.setAdmin(user);

        if (editedInfo.getClientComment().equals(request.getClientComment()) &&
                editedInfo.getAdminComment().equals(request.getAdminComment()))
            return true;

        if (editedInfo.getClientComment().isEmpty())
            request.setClientComment(null);
        else
            request.setClientComment(editedInfo.getClientComment());

        if (editedInfo.getAdminComment().isEmpty())
            request.setAdminComment(null);
        else
            request.setAdminComment(editedInfo.getAdminComment());

        requestRepository.save(request);
        return true;
    }

    public void addProduct(Long id, RequestLineDTO dto) {

        if (!requestRepository.findById(id).isPresent()) {
            throw new RequestNotFoundException(id);
        }
        if (!productRepository.findById(dto.getId()).isPresent()) {
            throw new ProductNotFoundException(dto.getId().toString());
        }
        if (dto.getAmount() <= 0) {
            throw new InvalidData(Collections.singletonMap("amount", dto.getAmount().toString()));
        }
        Product product = productRepository.findById(dto.getId()).get();
        HelpRequest request = requestRepository.findById(id).get();
        HelpRequestLine pr = new HelpRequestLine();
        pr.setProduct(product);
        pr.setHelpRequest(request);
        pr.setAmount(dto.getAmount());

        requestLineRepository.save(pr);
    }

}
