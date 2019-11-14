package com.spring.SpringJ32_JPA.controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.SpringJ32_JPA.entities.Customer;
import com.spring.SpringJ32_JPA.entities.OrderDetail;
import com.spring.SpringJ32_JPA.entities.OrderSize;
import com.spring.SpringJ32_JPA.entities.Orders;
import com.spring.SpringJ32_JPA.entities.Product;
import com.spring.SpringJ32_JPA.entities.User;
import com.spring.SpringJ32_JPA.service.CustomerService;
import com.spring.SpringJ32_JPA.service.OrderDetailService;
import com.spring.SpringJ32_JPA.service.OrderSizeService;
import com.spring.SpringJ32_JPA.service.OrdersService;
import com.spring.SpringJ32_JPA.service.ProductService;
import com.spring.SpringJ32_JPA.service.UserService;

@Controller
public class HomeController {

	@Autowired
	private ProductService productService;

	@Autowired
	private OrderDetailService orderDetailService;

	@Autowired
	private OrdersService ordersService;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private UserService userService;

	@Autowired
	OrderSizeService orderSizeService;

	private List<OrderDetail> listOrderDetails = new ArrayList<OrderDetail>();

	@GetMapping(value = { ("/"), ("/home") })
	public String home(Model model, @RequestParam(value = "page", defaultValue = "0", required = false) int page) {

		PageRequest pageRequest = new PageRequest(page, 6);

		Pageable pageable = pageRequest;

		Page<Product> allProducts = (Page<Product>) productService.getProductPage(pageable);
		model.addAttribute("curentPage", page);

		model.addAttribute("ListProduct", allProducts.getContent());
		model.addAttribute("totalPage", allProducts.getTotalPages());
		model.addAttribute("check", "Banner");
		if (listOrderDetails == null) {

		} else {
			model.addAttribute("lenght", listOrderDetails.size());
		}
//			model.addAttribute("ListProduct", allProducts.getContent());
//			model.addAttribute("totalPage", allProducts.getTotalPages());
//			model.addAttribute("ListProduct", productService.getList());

//			return "index";
//		} else {

//			model.addAttribute("ListProduct", allProducts.getContent());
//			model.addAttribute("totalPage", allProducts.getTotalPages());
//			model.addAttribute("ListProduct", productService.getList());
//			System.out.print(listOrderDetails.size());
//			model.addAttribute("check", "Banner");

		return "index";
	}

	@GetMapping("/detail/{id}")
	public String detail(@PathVariable("id") int id, Model model) {
		Product product = productService.findProduct(id);
		model.addAttribute("product", product);
		model.addAttribute("lenght", listOrderDetails.size());

		return "detail";
	}

	@PostMapping("/add")
	public String add(@RequestParam("id") int id, @RequestParam("size") String orderSize,
			@RequestParam("quantity") int quantity, Model model) {
		// find product in database
		Product product = productService.findProduct(id);
		// product.setOrderSize(orderSize);


		// check product exist
		if (check(product, orderSize)) {
			
			for (int i = 0; i < listOrderDetails.size(); i++) {
				// if was exist -> quantity ++
				if (listOrderDetails.get(i).getProduct().getId() == product.getId() &&
						listOrderDetails.get(i).getOrderSizeTem().equals(orderSize)) {
					int newQuantity = listOrderDetails.get(i).getQuantity() + quantity;
					listOrderDetails.get(i).setQuantity(newQuantity);
					// orderDetail.setProduct(product);

					listOrderDetails.set(i, listOrderDetails.get(i));
					model.addAttribute("message", "Item was exist on your cart");
					break;
				}
			}

		} else {
			// view message if item was not exist..
			
			OrderDetail orderDetail = new OrderDetail(quantity);
			//
			System.out.println(
					"---------------------------------------------------------------------------------------------");
			System.out.println(orderSize);
			orderDetail.setProduct(product);
			orderDetail.setOrderSizeTem(orderSize);
			
			listOrderDetails.add(orderDetail);
			model.addAttribute("message", "Item was add to your cart");

		}
		model.addAttribute("product", product);
		model.addAttribute("lenght", listOrderDetails.size());

		return "detail";
	}

	@GetMapping("/cart")
	public String cart(Model model) {

		model.addAttribute("ListOrderDetail", listOrderDetails);
		model.addAttribute("lenght", listOrderDetails.size());
		model.addAttribute("total", ordersService.getTotal(listOrderDetails));
		model.addAttribute("message", "You have no items in your shopping cart !");
		return "cart";
	}

	@GetMapping("/loginUser")
	public String login(Model model) {
		model.addAttribute("user", new User());
		return "loginUser";
	}

//    @RequestMapping("/login")
//    public String login(Model model,
//            @RequestParam(value = "error",
//                    required = false) boolean error) {
//        if (error) {
//            model.addAttribute("message", "Login Fail");
//        }
//        return "login";
//    }

	@PostMapping("/loginValidate")
	public String loginValidate(@ModelAttribute("user") User user, Model model) throws NoSuchAlgorithmException {

		String password = encoding(user.getPassword());
		if (userService.findUser(user.getUserName(), password)) {
			return "wellcomeAd";
		} else {
			model.addAttribute("message", "Username or password not right !!!");
			return "loginUser";
		}
	}

	@GetMapping("/checkout")
	public String checkOut(Model model) {

		model.addAttribute("customer", new Customer());
		model.addAttribute("lenght", listOrderDetails.size());
		model.addAttribute("ListOrderDetail", listOrderDetails);
		model.addAttribute("total", ordersService.getTotal(listOrderDetails));
		return "checkout";
	}

	@PostMapping("/thanks")
	public String thanks(Model model, @ModelAttribute("customer") @Valid Customer customer, BindingResult result) {
		// System.out.println(customer.toString());

		if (result.hasErrors()) {
			model.addAttribute("customer", new Customer());
			model.addAttribute("lenght", listOrderDetails.size());
			model.addAttribute("ListOrderDetail", listOrderDetails);
			model.addAttribute("total", ordersService.getTotal(listOrderDetails));
			return "checkout";
		} else {
			if (listOrderDetails.size() != 0) {
				Orders orders = ordersService.saveOrders(listOrderDetails);
				customer.setOrders(orders);
				customerService.save(customer);
				for (int i = 0; i < listOrderDetails.size(); i++) {
					OrderDetail o = new OrderDetail();
					o = listOrderDetails.get(i);
					o.setOrders(orders);
					o = orderDetailService.save(o);
					OrderSize orderSize = new OrderSize();
					orderSize.setSizeOrder(o.getOrderSizeTem());
					orderSize.setOrderDetail(o);
					orderSizeService.save(orderSize);

				}
				listOrderDetails.clear();
			}
			return ("redirect:/success");
		}
	}

	@GetMapping("/update")
	public String update(@RequestParam("size") String orderSize, @RequestParam("quantity") int quantity, Model model) {

		//Product product = productService.findProduct(id);

		//OrderDetail orderDetail = new OrderDetail(quantity);

		for (int i = 0; i < listOrderDetails.size(); i++) {
			if (listOrderDetails.get(i).getOrderSizeTem().equals(orderSize)) {
				listOrderDetails.get(i).setQuantity(quantity);
				//orderDetail.setProduct(product);
				listOrderDetails.set(i, listOrderDetails.get(i));
			}
		}

		return "redirect:/cart";
	}

	@GetMapping(value = "/delete/{orderSizeTem}")
	public String delete(Model model, @PathVariable("orderSizeTem") String orderSizeTem) {

		for (int i = 0; i < listOrderDetails.size(); i++) {
			if (listOrderDetails.get(i).getOrderSizeTem().equals(orderSizeTem)) {
				listOrderDetails.remove(i);
			}
		}
		return "redirect:/cart";

	}

	@GetMapping("/success")
	public String success() {
		return "thanks";
	}

//	@GetMapping(value = "/managerOrder")
//	public String managerOrder(Model model) {
//
//		// convert date -> String
//		Date date = new Date();
//		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		String strDate = dateFormat.format(date);
//		System.out.println(strDate);
//
//		List<OrderDetail> ListOrderDetail = orderDetailService.getListOrderWithDate(strDate);
//		model.addAttribute("ListOrderDetail", ListOrderDetail);
//		return "listOrder";
//	}

	@PostMapping("/search")
	public String search(Model model, @RequestParam("search") String search) {

		List<Product> listP = productService.findProduct(search, search);
		model.addAttribute("lenght", listOrderDetails.size());
		if (listP.size() == 0 || listP == null) {
			model.addAttribute("message", "Not Found !!!");
			return "index";
		} else {
			model.addAttribute("ListProduct", listP);
			return "index";
		}

	}

	public boolean check(Product product, String orderSize) {
		for (OrderDetail o : listOrderDetails) {
			if (o.getOrderSizeTem() != null) {
				if (o.getProduct().getId() == product.getId() && o.getOrderSizeTem().equals(orderSize)) {
					return true;
				}
			}
		}
		return false;

	}

	public String encoding(String password) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		byte[] hashInBytes = md.digest(password.getBytes(StandardCharsets.UTF_8));

		StringBuilder sb = new StringBuilder();
		for (byte b : hashInBytes) {
			sb.append(String.format("%02x", b));
		}
		return sb.toString();
	}

}
