package basic.algos;

import java.util.Arrays;

public class MyHeap {
    
    public int [] arr;
    public int length;
    public int heapsize;
    
    public MyHeap(int[] a){
        this.arr = a;
        this.length = a.length;
        this.heapsize = a.length;
    }
    
    public int left(int i){
        return 2*i + 1;
    }
    
    public int right(int i){
        return 2*i + 2;
    }
    
    public int parent(int i){
        return (i-1)/2;
    }
    
    public void print(){
        int[] heap = Arrays.copyOfRange(arr, 0, this.heapsize);
        
        System.out.println(Arrays.toString(heap));
        
    }
}
