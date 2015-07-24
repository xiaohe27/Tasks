class SimpleRunnable implements Runnable{
    static int shared = 0;
    public void run(){
        System.out.println("Thread " + Thread.currentThread().getName());
        shared = shared + 1;
    }
}

public class Main{
    public static void main(String args[]){
        Thread t1 = new Thread (new SimpleRunnable());
        Thread t2 = new Thread (new SimpleRunnable());
        t1.start();
        t2.start();
    }

}