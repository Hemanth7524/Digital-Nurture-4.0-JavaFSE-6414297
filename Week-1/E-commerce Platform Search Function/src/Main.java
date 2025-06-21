import java.util.*;
public class Main {
    public static void main(String [] args){

        Product[] prods = {
                new Product("1", "Laptop", "Electronics"),
                new Product("2", "Smartphone", "Electronics"),
                new Product("3", "Tablet", "Electronics"),
                new Product("4", "Headphones", "Accessories"),
                new Product("5", "Charger", "Accessories"),
                new Product("6", "Refrigerator", "Appliances"),
                new Product("7", "Microwave", "Appliances"),
                new Product("8", "Sofa", "Furniture"),
                new Product("9", "Dining Table", "Furniture"),
                new Product("10", "Office Chair", "Furniture"),
                new Product("11", "Running Shoes", "Footwear"),
                new Product("12", "Sandals", "Footwear"),
                new Product("13", "T-shirt", "Clothing"),
                new Product("14", "Jeans", "Clothing"),
                new Product("15", "Jacket", "Clothing"),
                new Product("16", "Washing Machine", "Appliances"),
                new Product("17", "Smartwatch", "Electronics"),
                new Product("18", "Bluetooth Speaker", "Accessories"),
                new Product("19", "Backpack", "Accessories"),
                new Product("20", "Camera", "Electronics")
        };

        /*System.out.println("The product Details are ");
        for(Product prod : prods){
            System.out.println(prod.getProName());
        }*/

        Scanner sc = new Scanner(System.in);

        System.out.println("Search for an item (Enter name of the Product ): ");
        String name1 = sc.next();
        System.out.println("Implementing Linear search");
        linear_search obj1 = new linear_search();
        Product res1 =  obj1.linearsearch(name1,prods);
        System.out.println("Searched Product details : ");
        if(res1 != null) {
            System.out.println("ProductId: " + res1.getProId() + " Product Name: " + res1.getProName() + " Category: " + res1.getCate());
        }
        else{
            System.out.println("Not Found");
        }

        System.out.println("Search for an item (Enter name of the Product ): ");
        String name2 = sc.next();
        System.out.println("Implementing Binary search");
        binary_search obj2 = new binary_search();
        Product res2 = obj2.binarysearch(name2,prods);
        System.out.println("Searched Product details : ");
        if(res1 != null) {
            System.out.println("ProductId: " + res2.getProId() + " Product Name: " + res2.getProName() + " Category: " + res2.getCate());
        }
        else{
            System.out.println("Not Found");
        }

    }
}