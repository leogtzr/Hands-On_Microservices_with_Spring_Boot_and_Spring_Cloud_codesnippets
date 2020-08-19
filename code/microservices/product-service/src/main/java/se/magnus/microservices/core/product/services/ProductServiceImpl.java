package se.magnus.microservices.core.product.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import se.magnus.api.core.product.Product;
import se.magnus.api.core.product.ProductService;
import se.magnus.util.http.ServiceUtil;

@RestController
public class ProductServiceImpl implements ProductService  {

    private final ServiceUtil serviceUtil;

    @Autowired
    public ProductServiceImpl(final ServiceUtil serviceUtil) {
        this.serviceUtil = serviceUtil;
    }

    @Override
    public Product getProduct(final int productId) {
        return new Product(productId, "name-" + productId, 123, serviceUtil.getServiceAddress());
    }

}
