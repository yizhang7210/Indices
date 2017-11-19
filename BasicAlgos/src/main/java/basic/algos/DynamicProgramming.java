package basic.algos;

import java.util.Arrays;

public class DynamicProgramming {
    
    public static int rodCut(int[] prices, int n){
        
        if(n == 0){
            return 0;
        }
        
        int[] best = new int[n+1];
        
        best[0] = 0;
        for(int i = 1; i <= n; ++i){
            int q = 0;
            for(int j = 1; j <= i; ++ j) {
                q = Math.max(q, prices[j-1] + best[i - j]);
            }
            best[i] = q;
        }
        
        return best[n];
    }
    
    
    public static void dpTest(){
        
        int[] prices = {1,5,8,9,10,17,17,20,24,30};
        
        System.out.println("At 4, result should be 10.");
        System.out.println(rodCut(prices, 4));
        
        System.out.println("At 10, result should be 30");
        System.out.println(rodCut(prices, 10));
    }
}
