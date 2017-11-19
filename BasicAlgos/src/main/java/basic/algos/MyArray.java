package basic.algos;

import java.util.Arrays;

public class MyArray {
    
    public int [] intArray;
    public double[] doubleArray;
    
    public MyArray(int[] intA, double[] doubleA) {
        this.intArray = intA;
        this.doubleArray = doubleA;
    }
    
    public int maxSubArray() {

        int maxEndingHere = 0;
        int maxSoFar = 0;

        for (int i = 0; i < intArray.length; ++i) {
            maxEndingHere = Math.max(0, maxEndingHere + intArray[i]);
            maxSoFar = Math.max(maxEndingHere, maxSoFar);
        }

        return maxSoFar;

    }
    
    public static void arrayTest() {
        
        System.out.println("==========Array test==========");
        int[] intA = {3,4,0,2,-6,98};
        double[] doubleA = { 9.8, 2.1, -0.6, 8, 21.32};
        
        MyArray marray = new MyArray(intA, doubleA);
        
        System.out.println("The original arrays are:");
        System.out.println(Arrays.toString(intA));
        System.out.println(Arrays.toString(doubleA));
        
        /**
         * Max Sub Array.
         */
        int max = marray.maxSubArray();
        System.out.println("Max sub array test: " + max);
    }
    
}
