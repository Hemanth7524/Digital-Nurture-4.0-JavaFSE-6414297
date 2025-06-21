public class financial_forecasting {
        public static double futValueRecur(double initialValue, double rate, int years) {
            if (years == 0) {
                return initialValue;
            }
            return futValueRecur(initialValue, rate, years - 1) * (1 + rate);
        }

        public static double futValueIter(double initialValue, double rate, int years) {
            double result = initialValue;
            for (int i = 1; i <= years; i++) {
                result *= (1 + rate);
            }
            return result;
        }
}


