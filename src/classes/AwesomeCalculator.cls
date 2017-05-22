public class AwesomeCalculator {
    public static Double add(Double x, Double y){
        calculatorServices.CalculatorImplPort calculator = new calculatorServices.CalculatorImplPort();
        Double result = calculator.doAdd(x, y);
        System.debug('** AwesomeCalculator.apxc ** returned value= ' + result);
        return result;
    }
}