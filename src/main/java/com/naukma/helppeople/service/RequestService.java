package com.naukma.helppeople.service;

import antlr.StringUtils;
import com.naukma.helppeople.entity.Product;
import com.naukma.helppeople.entity.User;
import com.naukma.helppeople.entity.dto.RequestInfoDTO;
import com.naukma.helppeople.entity.dto.RequestLineDTO;
import com.naukma.helppeople.entity.request.Request;
import com.naukma.helppeople.entity.request.RequestLine;
import com.naukma.helppeople.entity.request.RequestLineId;
import com.naukma.helppeople.exceptionHandlers.exceptions.InvalidData;
import com.naukma.helppeople.exceptionHandlers.exceptions.ProductNotFoundException;
import com.naukma.helppeople.exceptionHandlers.exceptions.RequestNotFoundException;
import com.naukma.helppeople.repository.ProductRepository;
import com.naukma.helppeople.repository.RequestLineRepository;
import com.naukma.helppeople.repository.RequestRepository;
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
    private RequestLineRepository requestLineRepository;

    @Autowired
    private UserService userService;

    private static List<String> sortParams = Arrays.asList("id", "user", "dateCreate", "status");

    @Autowired
    private RequestRepository requestRepository;

    public List<Request> getAllRequests(String sortParam, String sortType, Long userId) {
        if (sortParam == null && sortType == null) {
            if (userId == null) {
                List<Request> res = new ArrayList<>();
                Iterable<Request> fromDB = requestRepository.findAll();
                fromDB.iterator().forEachRemaining(res::add);
                return res;
            } else
                return requestRepository.findAllByUserId(userId);
        }
        if (sortParam != null && sortType == null)
            sortType = "ASC";
        if (!sortParams.contains(sortParam)) {
            throw new InvalidData(Collections.singletonMap("sortParam", sortParam));
        }
        if (sortType.equals("ASC") || sortType.equals("DESC")) {
            if (userId != null)
                return requestRepository.findAllByUserId(userId, Sort.by(Sort.Direction.valueOf(sortType), sortParam));
            else {
                List<Request> res = new ArrayList<>();
                Iterable<Request> fromDB = requestRepository.findAll(Sort.by(Sort.Direction.valueOf(sortType), sortParam));
                fromDB.iterator().forEachRemaining(res::add);
                return res;
            }
        } else
            throw new InvalidData(Collections.singletonMap("sortType", sortType));
    }

    @Transactional
    public void deleteRequest(Long id) {
        Optional<Request> receipt = requestRepository.findById(id);
        if (!receipt.isPresent()) {
            throw new RequestNotFoundException(id);
        } else {
            List<RequestLine> lines = requestLineRepository.findRequestLinesById_RequestId(id);
            requestLineRepository.deleteAll(lines);
            requestRepository.deleteById(id);
        }
    }

    public Request createRequest(RequestInfoDTO dto) {
        Request request = new Request();
        request.setUser(userService.findUserById(dto.getUserId()));
        request.setAdmin(userService.findUserById(dto.getAdminId()));
        request.setDateCreate(LocalDate.now());
        return requestRepository.save(request);
    }

    public void updateProductsInRequest(Long id, ArrayList<RequestLineDTO> dtos) {
        Map<Long, Integer> newVal = dtos.stream().collect(Collectors.toMap(RequestLineDTO::getId, RequestLineDTO::getAmount));

        if (!requestRepository.findById(id).isPresent()) {
            throw new RequestNotFoundException(id);
        }
        List<RequestLine> pr = requestLineRepository.findAllById_RequestIdAndId_ProductIdIn(id, newVal.keySet());
        for (RequestLine prod : pr) {
            prod.setAmount(newVal.get(prod.getId().getProductId()));
        }
        requestLineRepository.saveAll(pr);
    }

    public boolean editRequestInfo(Long id, Request editedInfo, Long adminId) {
        Request request;

        if (requestRepository.findById(id).isPresent()) {
            request = requestRepository.findById(id).get();
        } else {
            throw new RequestNotFoundException(id);
        }

        User user = userService.findUserById(adminId);
        request.setAdmin(user);

        if (editedInfo.getComment().equals(request.getComment()) &&
                editedInfo.getAdminComment().equals(request.getAdminComment()))
            return true;

        if (editedInfo.getComment().equals(""))
            request.setComment(null);
        else
            request.setComment(editedInfo.getComment());

        if (editedInfo.getAdminComment().equals(""))
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
        Request request = requestRepository.findById(id).get();
        RequestLineId prId = new RequestLineId();
        prId.setRequestId(id);
        prId.setProductId(product.getId());

        RequestLine pr = new RequestLine();
        pr.setId(prId);
        pr.setProduct(product);
        pr.setRequest(request);
        pr.setAmount(dto.getAmount());

        requestLineRepository.save(pr);
    }

}
