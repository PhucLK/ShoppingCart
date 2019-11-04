package com.spring.SpringJ32_JPA.controller;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.spring.SpringJ32_JPA.entities.Customer;
import com.spring.SpringJ32_JPA.entities.OrderDetail;
import com.spring.SpringJ32_JPA.entities.Orders;
import com.spring.SpringJ32_JPA.entities.Product;
import com.spring.SpringJ32_JPA.entities.User;
import com.spring.SpringJ32_JPA.service.CategoryService;
import com.spring.SpringJ32_JPA.service.CustomerService;
import com.spring.SpringJ32_JPA.service.OrderDetailService;
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

	private List<OrderDetail> listOrderDetails = new ArrayList<OrderDetail>();

	@GetMapping(value = { ("/"), ("/home") })
	public String home(Model model) {
		if (listOrderDetails == null) {
			model.addAttribute("ListProduct", productService.getList());
			return "index";
		} else {
			model.addAttribute("lenght", listOrderDetails.size());
			model.addAttribute("ListProduct", productService.getList());
			System.out.print(listOrderDetails.size());
			return "index";
		}

	}

	@GetMapping("/detail/{id}")
	public String detail(@PathVariable("id") int id, Model model) {
		Product product = productService.findProduct(id);
		model.addAttribute("product", product);
		return "detail";
	}

	@GetMapping("/add")
	public RedirectView add(@RequestParam("id") int id, @RequestParam("quantity") int quantity, Model model) {

		Product product = productService.findProduct(id);

		OrderDetail orderDetail = new OrderDetail(quantity);

		if (check(product)) {
			// product.setOrderDetail(orderDetail);
			// productService.save(product);
			orderDetail.setProduct(product);
			listOrderDetails.add(orderDetail);
		} else {

			for (int i = 0; i < listOrderDetails.size(); i++) {
				if (listOrderDetails.get(i).getProduct().getId() == product.getId()) {
					orderDetail.setQuantity(listOrderDetails.get(i).getQuantity() + quantity);
					orderDetail.setProduct(product);
					// product.setOrderDetail(orderDetail);
					listOrderDetails.set(i, orderDetail);
				}
			}

		}
		return new RedirectView("home");
	}

	@GetMapping("/cart")
	public String cart(ModelMap model) {

		model.addAttribute("ListOrderDetail", listOrderDetails);
		model.addAttribute("total", ordersService.getTotal(listOrderDetails));
		return "cart";
	}

	@GetMapping("/login")
	public String login(ModelMap model) {
		model.addAttribute("user", new User());
		return "login";
	}

	@PostMapping("/loginValidate")
	public String loginValidate(@ModelAttribute("user") User user, ModelMap model) throws NoSuchAlgorithmException {

		String password = encoding(user.getPassword());
		if (userService.findUser(user.getUserName(), password)) {
			return "wellcomeAd";
		} else {
			model.addAttribute("message", "Username or password not right !!!");
			return "login";
		}
	}

	@GetMapping("/checkout")
	public String checkOut(ModelMap model) {
		model.addAttribute("customer", new Customer());
		model.addAttribute("ListOrderDetail", listOrderDetails);
		model.addAttribute("total", ordersService.getTotal(listOrderDetails));
		return "checkout";
	}

	@PostMapping(value = "/delete")
	public RedirectView delete(ModelMap model, @RequestParam("id") int id) {

		for (int i = 0; i < listOrderDetails.size(); i++) {
			if (listOrderDetails.get(i).getProduct().getId() == id) {
				listOrderDetails.remove(i);
			}
		}
		return new RedirectView("cart");
	}

	@PostMapping("/thanks")
	public String thanks(ModelMap model, @ModelAttribute("customer") Customer customer) {
		// System.out.println(customer.toString());

		if (listOrderDetails.size() != 0) {
			Orders orders = ordersService.saveOrders(listOrderDetails);
			customer.setOrders(orders);
			customerService.save(customer);
			for (int i = 0; i < listOrderDetails.size(); i++) {
				OrderDetail o = new OrderDetail();
				o = listOrderDetails.get(i);
				o.setOrders(orders);
				orderDetailService.save(o);
			}
			listOrderDetails.clear();
		}
		return ("redirect:/success");
	}

	@GetMapping("/success")
	public String success() {
		return "thanks";
	}

	@GetMapping(value = "/managerOrder")
	public String managerOrder(ModelMap model) {

		// convert date -> String
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = dateFormat.format(date);
		System.out.println(strDate);

		List<OrderDetail> ListOrderDetail = orderDetailService.getListOrderWithDate(strDate);
		model.addAttribute("ListOrderDetail", ListOrderDetail);
		return "listOrder";
	}

	@GetMapping("/update")
	public RedirectView update(@RequestParam("id") int id, @RequestParam("quantity") int quantity, Model model) {

		Product product = productService.findProduct(id);

		OrderDetail orderDetail = new OrderDetail(quantity);

		for (int i = 0; i < listOrderDetails.size(); i++) {
			if (listOrderDetails.get(i).getProduct().getId() == product.getId()) {
				// product.setOrderDetail(orderDetail);
				orderDetail.setProduct(product);
				listOrderDetails.set(i, orderDetail);
			}
		}

		return new RedirectView("cart");
	}

	@PostMapping("/search")
	public String search(ModelMap model, @RequestParam("search") String search) {

		List<Product> listP = productService.findProduct(search, search);

		if (listP.size() == 0) {
			// model.addAttribute("ListProduct", productService.getList());
			model.addAttribute("message", "Not Found !!!");
			return "index";
		} else {
			model.addAttribute("ListProduct", listP);
			return "index";
		}

	}

	public boolean check(Product product) {
		for (OrderDetail o : listOrderDetails) {
			if (o.getProduct().getId() == product.getId()) {
				return false;
			}
		}
		return true;

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
