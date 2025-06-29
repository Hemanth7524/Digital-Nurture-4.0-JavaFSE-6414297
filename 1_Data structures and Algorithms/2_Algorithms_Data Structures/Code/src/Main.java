public class Main {

    public static void main(String[] args) {
        double initialValue = 1000.0;
        double rate = 0.10; // 10% growth rate
        int years = 5;

        double recursiveResult = financial_forecasting.futValueRecur(initialValue, rate, years);
        double iterativeResult = financial_forecasting.futValueIter(initialValue, rate, years);

        System.out.printf("Recursive Future Value after %d years: %.2f\n", years, recursiveResult);
        System.out.printf("Iterative Future Value after %d years: %.2f\n", years, iterativeResult);
    }
}
