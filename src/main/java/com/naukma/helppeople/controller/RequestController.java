package com.naukma.helppeople.controller;

import com.naukma.helppeople.entity.Product;
import com.naukma.helppeople.entity.ReceiptLineWrapper;
import com.naukma.helppeople.entity.User;
import com.naukma.helppeople.entity.dto.RequestInfoDTO;
import com.naukma.helppeople.entity.dto.RequestLineDTO;
import com.naukma.helppeople.entity.dto.UserDTO;
import com.naukma.helppeople.entity.request.Request;
import com.naukma.helppeople.entity.request.RequestLine;
import com.naukma.helppeople.exceptionHandlers.exceptions.*;
import com.naukma.helppeople.repository.ProductRepository;
import com.naukma.helppeople.repository.RequestLineRepository;
import com.naukma.helppeople.repository.RequestRepository;
import com.naukma.helppeople.repository.UserRepository;
import com.naukma.helppeople.service.RequestService;
import com.naukma.helppeople.service.UserService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@Log4j2
public class RequestController {

    @Autowired
    protected AuthenticationManager authenticationManager;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RequestService requestService;

    @Autowired
    private RequestRepository requestRepository;
    @Autowired
    private RequestLineRepository requestLineRepository;

    @ModelAttribute("userId")
    public String getCurrentUserIpn(Authentication authentication) {
        UserDetails det = (authentication == null) ? null : (UserDetails) authentication.getPrincipal();
        if (det == null) {
            return "";
        } else {
            String login = det.getUsername();
            if (!userRepository.findByLogin(login).isPresent()) {
                throw new UserNotFoundException(login);
            } else
                return userRepository.findByLogin(login).get().getId().toString();
        }
    }

    @ModelAttribute("currentUser")
    public UserDetails getCurrentUser(Authentication authentication) {
        return (authentication == null) ? null : (UserDetails) authentication.getPrincipal();
    }

    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) {
        User user = userRepository.findByLogin(username).get();
        if (user == null) throw new UserNotFoundException(username);

        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        grantedAuthorities.add(new SimpleGrantedAuthority(user.getRole()));

        return new org.springframework.security.core.userdetails.User(user.getLogin(), user.getPassword(), grantedAuthorities);
    }

    @GetMapping("/help")
    public ModelAndView registration() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("help_first_time");
        UserDTO user = new UserDTO();
        mav.addObject("user", user);
        return mav;
    }

    @PostMapping("/registrationForHelp")
    public RedirectView registUser(@ModelAttribute("user") UserDTO user, HttpServletRequest request) {
        if (userRepository.findUserById(user.getId()).isPresent()) {
            throw new EntityDuplicateException("Користувач", "id", user.getId().toString());
        }
        userService.addUser(user);

        User userRes = userRepository.findByLogin(user.getLogin()).get();

        UserDetails userDetails = loadUserByUsername(user.getLogin());
        try {
            UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(userDetails, user.getConfirmedPassword(), userDetails.getAuthorities());
            authenticationManager.authenticate(usernamePasswordAuthenticationToken);

            if (usernamePasswordAuthenticationToken.isAuthenticated()) {
                SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
                log.debug(String.format("Auto login %s successfully!", user.getLogin()));
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return createReceipt(userRes.getId());
    }


    @GetMapping("/request/all")
    public ModelAndView getAllReceipt(@RequestParam(value = "sortParam", required = false) String sortParam,
                                      @RequestParam(value = "sortType", required = false) String sortType) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("request_all");
        mav.addObject("sortParam", sortParam);
        mav.addObject("sortType", sortType);
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = null;
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }
        User user = userService.findUserByLogin(username);
        if (user.getRole().equals("USER"))
            mav.addObject("requests", requestService.getAllRequests(sortParam, sortType, user.getId()));
        else
            mav.addObject("requests", requestService.getAllRequests(sortParam, sortType, null));
        return mav;
    }

    @GetMapping("/request/{id}/products")
    public ModelAndView getReceiptProducts(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("request_products");

        if (!requestRepository.findById(id).isPresent()) {
            throw new RequestNotFoundException(id);
        }

        Request request = requestRepository.findById(id).get();
        mav.addObject("request", request);
        List<RequestLine> lines = new ArrayList<>();
        if (request.getRequestLinesList().size() != 0)
            lines = requestLineRepository.findRequestLinesById_RequestId(id);
        mav.addObject("lines", lines);
        return mav;
    }


    @PutMapping("/request/info")
    public RedirectView updateReceiptNotes(@RequestParam(value = "id") Long id, @RequestParam(value = "adminLogin") Long adminId, Request dto) {
        log.info(dto);
        requestService.editRequestInfo(id, dto, adminId);
        return new RedirectView("/request/" + id + "/products");
    }

    @GetMapping("/request/add")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ModelAndView getCreateReceiptPageAdmin() {
        ModelAndView mav = new ModelAndView();
        RequestInfoDTO request = new RequestInfoDTO();
        mav.setViewName("request_create");
        mav.addObject("request", request);
        mav.addObject("users", userRepository.findUsersByRole("USER"));
        return mav;
    }

    @PostMapping("/request/add")
    public RedirectView createReceipt(@ModelAttribute("request") RequestInfoDTO request) {
        Request res = requestService.createRequest(request);
        log.info(res);
        return new RedirectView("/request/" + res.getId() + "/products");
    }

    @GetMapping("/request/{id}/end")
    public RedirectView moveInFinish(@PathVariable Long id, @RequestParam(value = "adminLogin") Long adminLogin) {

        if (!requestRepository.findById(id).isPresent()) {
            throw new RequestNotFoundException(id);
        }
        Request request = requestRepository.findById(id).get();

        if (!userRepository.findUserById(adminLogin).isPresent()) {
            throw new UserNotFoundException(adminLogin.toString());
        } else {
            request.setAdmin(userRepository.findUserById(adminLogin).get());
        }

        request.setStatus("CLOSED");
        request.setDateClosed(LocalDate.now());

        List<String> errors = new ArrayList<>();
        List<Product> toSave = new ArrayList<>();
        for (RequestLine line : request.getRequestLinesList()) {
            Product product = productRepository.findById(line.getProductId()).get();
            if (product.getTotalCount() - line.getAmount() < 0) {
                errors.add("Продукту " + line.getProduct().getName() + " міститься на складі всього " +
                        product.getTotalCount() + " а намагаються списати " + line.getAmount());
            } else {
                product.setTotalCount(product.getTotalCount() - line.getAmount());
                toSave.add(product);
            }
        }

        if (!errors.isEmpty()) {
            throw new CloseRequestException(errors);
        } else {
            productRepository.saveAll(toSave);
        }

        requestRepository.save(request);
        return new RedirectView("/request/" + id + "/products");
    }

    @GetMapping("/request/{id}/progress")
    public RedirectView moveInProgress(@PathVariable Long id, @RequestParam(value = "adminLogin") Long adminLogin) {
        if (!requestRepository.findById(id).isPresent()) {
            throw new RequestNotFoundException(id);
        }
        Request request = requestRepository.findById(id).get();
        request.setStatus("IN_PROGRESS");

        if (!userRepository.findUserById(adminLogin).isPresent()) {
            throw new UserNotFoundException(adminLogin.toString());
        } else {
            request.setAdmin(userRepository.findUserById(adminLogin).get());
        }
        requestRepository.save(request);
        return new RedirectView("/request/" + id + "/products");
    }


    @GetMapping("/request/add/{id}")
    public RedirectView createReceipt(@PathVariable Long id) {
        RequestInfoDTO request = new RequestInfoDTO();
        request.setUserId(id);
        request.setAdminId(null);
        Request res = requestService.createRequest(request);
        return new RedirectView("/request/" + res.getId() + "/products");
    }

    @PostMapping("/request/{id}")
    public RedirectView updateReceiptProducts(@PathVariable Long id, @ModelAttribute("properties_wrapper")
            ReceiptLineWrapper propertiesWrapper) {

        requestService.updateProductsInRequest(id, propertiesWrapper.getProperties());
        return new RedirectView("/request/" + id);
    }

    @DeleteMapping("/request/products")
    public RedirectView deleteReceiptProduct(@RequestParam(value = "id") String
                                                     Sid, @RequestParam(value = "productId") Long productId) {
        Long id = Long.valueOf(Sid);
        if (!requestRepository.findById(id).isPresent()) {
            throw new RequestNotFoundException(id);
        }
        if (!requestLineRepository.findRequestLineById_RequestIdAndId_ProductId(id, productId).isPresent()) {
            throw new RequestProductNotFoundException(id, productId);
        }
        RequestLine pr = requestLineRepository.findRequestLineById_RequestIdAndId_ProductId(id, productId).get();
        requestLineRepository.delete(pr);

        return new RedirectView("/request/" + id + "/products");
    }

    @DeleteMapping("/request/{id}")
    public RedirectView deleteReceipt(@PathVariable Long id) {
        requestService.deleteRequest(id);
        return new RedirectView("/receipt/all");
    }

    @GetMapping("/request/{id}")
    public ModelAndView goToEditPageOfReceipt(@PathVariable Long id, Model model) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("request_edit");

        if (!requestRepository.findById(id).isPresent()) {
            throw new RequestNotFoundException(id);
        }
        Request request = requestRepository.findById(id).get();
        if (request.getStatus().equals("CLOSED")) {
            throw new AccessDeniedException("Ви не можете редагувати заявку, що вже закрита");
        }
        mav.addObject("request", request);

        ArrayList<RequestLineDTO> lines = new ArrayList<>();
        if (request.getRequestLinesList().size() != 0) {
            List<RequestLine> res = requestLineRepository.findRequestLinesById_RequestId(id);
            for (RequestLine line : res) {
                RequestLineDTO dto = new RequestLineDTO(line.getProduct().getId(),
                        line.getProduct().getGender(),
                        line.getProduct().getCategory().getName(),
                        line.getProduct().getSeason(),
                        line.getProduct().getSize(),
                        line.getAmount(), line.getProduct().getTotalCount());
                lines.add(dto);
            }
        }
        ReceiptLineWrapper prwrapper = createWrapper(lines);

        RequestLineDTO newProduct = new RequestLineDTO();

        List<Product> products = productRepository.findProductsByTotalCountGreaterThan(0);
        List<Long> productsInOrder = requestLineRepository.findRequestLinesById_RequestId(id).stream()
                .map(RequestLine::getProductId).collect(Collectors.toList());
        products.removeIf(x -> productsInOrder.contains(x.getId()));

        model.addAttribute("products", products);
        model.addAttribute("addProduct", newProduct);
        model.addAttribute("properties_wrapper", prwrapper);
        return mav;
    }

    @PostMapping("/request/{id}/add/product")
    public RedirectView addLineToRequest(@PathVariable Long id, @ModelAttribute("addProduct") RequestLineDTO
            product) {
        log.info(product);
        requestService.addProduct(id, product);
        return new RedirectView("/request/" + id + "/products");
    }

    private ReceiptLineWrapper createWrapper(ArrayList<RequestLineDTO> lines) {
        ReceiptLineWrapper res = new ReceiptLineWrapper();
        res.setProperties(lines);
        return res;
    }

}