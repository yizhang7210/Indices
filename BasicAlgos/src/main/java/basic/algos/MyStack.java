package basic.algos;

public class MyStack<T> {

    private T[] stack;
    private int top;

    public MyStack(){
        this.top = 0;
    }
    
    
    public boolean empty() {

        return this.top == -1;
    }

    public void push(T x) {
        
        if(this.top >= stack.length){
            System.err.println("Stack overflow");
        }
        
        this.top = this.top + 1;
        this.stack[this.top] = x;
    }

    public T pop() {
        if (this.empty()) {
            System.err.println("Stack underflow");
        }
        
        this.top = this.top - 1;
        return this.stack[this.top + 1];

    }

}
