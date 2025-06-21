import java.util.Arrays;
import java.util.Comparator;

public class binary_search {
    public Product binarysearch(String name,Product[] arr){
        Arrays.sort(arr, Comparator.comparing(Product::getProName));
        /*for(Product pro : arr){
            System.out.println(pro.getProName());
        }*/
        int low = 0;
        int high = arr.length;


        while (low <= high) {
            int mid = (low + high) / 2;
            int result = name.compareToIgnoreCase(arr[mid].getProName());

            if (result == 0) {
                return arr[mid];
            } if (result > 0) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        return null;
    }
}

