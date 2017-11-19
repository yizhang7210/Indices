package basic.algos;

public class MyQueue<T> {
    
    private T[] queue;
    private int head;
    private int tail;
    
    public MyQueue(){
        this.head = 0;
        this.tail = 0;
    }
    
    
    public void enqueue(T x){
        
        if(this.head == this.tail + 1){
            System.err.println("Queue overflow");
        }
        
        this.queue[this.tail] = x;
        this.tail = (this.tail + 1) % this.queue.length;
    }
    
    public T dequeue(){
        if(this.head == this.tail){
            System.err.println("Queue underflow");
        }
        
        T x = this.queue[this.head];
        
        this.head = (this.head + 1) % this.queue.length;
        
        return x;
    }
    
}
