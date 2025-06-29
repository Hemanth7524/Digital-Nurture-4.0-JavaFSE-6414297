public class Product {
    private final String productId;
    private final String productName;
    private final String category;

    public Product(String productId,String productName , String category){
        this.productId = productId;
        this.productName = productName;
        this.category = category;
    }

    public String getProId() {
        return productId;
    }

    public String getProName() {
        return productName;
    }

    public String getCate() {
        return category;
    }

}
