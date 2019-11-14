package com.spring.SpringJ32_JPA.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.SpringJ32_JPA.entities.Images;
import com.spring.SpringJ32_JPA.entities.Product;
import com.spring.SpringJ32_JPA.entities.Size;
import com.spring.SpringJ32_JPA.service.CategoryService;
import com.spring.SpringJ32_JPA.service.ImageService;
import com.spring.SpringJ32_JPA.service.ProductService;
import com.spring.SpringJ32_JPA.service.SizeService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ProductService productService;

	@Autowired
	private ImageService imageService;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	CategoryService categoryService;

//	@Autowired
//	SizeService sizeService;


	private Product p;

//    @RequestMapping("/login")
//    public String login(Model model,
//            @RequestParam(value = "error",
//                    required = false) boolean error) {
//        if (error) {
//            model.addAttribute("message", "Login Fail");
//        }
//        return "login";
//    }

	@RequestMapping(value = { ("/manager"), ("/") })
	public String managerProduct() {

		return "admin/productManager";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String home(Model model, @RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "message", required = false) String message) {
		model.addAttribute("ListProduct", productService.getList());
		model.addAttribute("status", status);
		model.addAttribute("message", message);
		return "admin/lists";
	}

//	@GetMapping("/view")
//	public String view(@RequestParam("id") int id, Model model) {
//		for (Product p : productService.getList()) {
//			if (p.getId() == id) {
//				model.addAttribute("product", p);
//				break;
//			}
//		}
//		return "view";
//	}
	
	@GetMapping("/addProduct")
	public String addProduct(Model model) {
		// Product product = ;
		model.addAttribute("product", new Product());
		model.addAttribute("action", "addProduct");
		model.addAttribute("submit", "Add Product");
		model.addAttribute("categories", categoryService.getAll());
		String sizes[] = { "S", "M", "L", "Xl" };
		// product.getSizes()
		model.addAttribute("sizes", sizes);
		return "admin/product-form";
	}

	@PostMapping("/addProduct")
	public String saveProduct(Model model, @ModelAttribute("product") Product product) {
		p = product;
		model.addAttribute("images", new Images());
		model.addAttribute("action", "addImage");
		return "admin/image-form";
	}

	@PostMapping("/addImage")
	public String addImage(@ModelAttribute("images") Images images, Model model) {
		
		String[] size = p.getSize();
		List<Size> sizes = new ArrayList<Size>();
		for (String s : size) {
			sizes.add(new Size(s));
		}
		
		if (images != null && !images.getImage().isEmpty()) {

			String realPathtoUploads = request.getServletContext().getRealPath("/");
			
			List<MultipartFile> listMultipartFile = images.getImage();
			for (MultipartFile multipartFile : listMultipartFile) {

				Images image = new Images();
				String fileName = multipartFile.getOriginalFilename();
				image.setName(fileName);
				p = productService.saveProductS(p, sizes,image);
				
				String array[] = realPathtoUploads.split("\\.");
//				for (String a : array) {
//					System.out.println(a);
//				}
				String path = array[0] + "MVCupload\\src\\main\\webapp\\resources\\images\\" + fileName;

				File imageFile = new File(path);
				try {
					multipartFile.transferTo(imageFile);
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
			
			return "redirect:/admin/list";
		} else {
			model.addAttribute("image", new Images());
			model.addAttribute("action", "addImage");
			return "admin/image-form";
		}

	}
	
	@GetMapping("/editProduct/{id}")
	public String editProduct(Model model, @PathVariable("id") int id) {

		Product product = productService.findProduct(id);

		if (product != null) {
			List<Size> listSize = product.getSizes();
			model.addAttribute("product", product);
			model.addAttribute("action", "editProduct");

			String sizes[] = { "S", "M", "L", "Xl" };
			model.addAttribute("sizes", sizes);

			model.addAttribute("listSize", listSize);
			model.addAttribute("lenght", listSize.size());
			model.addAttribute("submit", "Edit Product");
			model.addAttribute("categories", categoryService.getAll());
			return "admin/product-form";
		} else {
			model.addAttribute("message", "Not exist data !!!");
			return "redirect:/admin/list";
		}
	}

	@PostMapping("/editProduct")
	public String editProduct(Model model, @ModelAttribute("product") Product product) {
		p = product;
		model.addAttribute("images", new Images());
		model.addAttribute("action", "editImage");
		return "admin/image-form";
	}

	@PostMapping("/editImage")
	public String editImage(@ModelAttribute("images") Images images, Model model) {

		String[] size = p.getSize();
		List<Size> sizes = new ArrayList<Size>();
		for(Size s : p.getSizes()) {
			System.out.println("========================================================================================");
			System.out.println(s);
		}
		for (String s : size) {
			sizes.add(new Size(s));

		}
		if (images != null && !images.getImage().isEmpty()) {

			imageService.delete(p.getImages());
			
			if(p.getImages().size()==0) {
				System.out.println("nullllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
			}
			for(Images i : p.getImages()) {
				System.out.println(i.toString());
				System.out.println("========================================================================================");
			}

			String realPathtoUploads = request.getServletContext().getRealPath("/");
			// List<Images> listImages = new ArrayList<Images>();
			List<MultipartFile> listMultipartFile = images.getImage();
			for (MultipartFile multipartFile : listMultipartFile) {

				Images image = new Images();
				String fileName = multipartFile.getOriginalFilename();
				image.setName(fileName);
				p = productService.saveProductS(p, sizes,image);
				image.setProduct(p);
				image = imageService.saveImage(image);

				String array[] = realPathtoUploads.split("\\.");
//				for (String a : array) {
//					System.out.println(a);
//				}
				String path = array[0] + "MVCupload\\src\\main\\webapp\\resources\\images\\" + fileName;

				File imageFile = new File(path);
				try {
					multipartFile.transferTo(imageFile);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			return "redirect:/admin/list";
		} else {
			model.addAttribute("image", new Images());
		}
		model.addAttribute("action", "addImage");
		return "admin/image-form";

	}



//	@PostMapping("/search")
//	public String search(Model model, @ModelAttribute("searchText") String search) {
//
//		List<Product> products = productService.search(search);
//		model.addAttribute("ListProduct", products);
//		if (products.size() == 0) {
//			model.addAttribute("message", "Not Found !!!");
//		}
//		return "lists";
//
//	}



	@GetMapping("/deleteProduct/{id}")
	public String deleteProduct(Model model, @PathVariable("id") int id) {

		Product product = productService.findProduct(id);

		if (product != null) {
			if (!productService.isDelete(id)) {
				return "redirect:/home?status=ok&message=Delete Success !";
			} else {
				return "redirect:/home?status=fail&message=Delete Fail !";
			}
		} else {
			model.addAttribute("message", "Not exist data !!!");
			return "redirect:/admin/list";
		}
	}

}
