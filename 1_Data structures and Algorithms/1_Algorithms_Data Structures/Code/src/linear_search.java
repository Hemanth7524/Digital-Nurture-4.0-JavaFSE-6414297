public class linear_search {
    public  Product linearsearch(String name,Product[] arr){
        for (Product product : arr) {
            if (product.getProName().equalsIgnoreCase(name)) {
                return product;
            }
        }
        return null;
    }
}
