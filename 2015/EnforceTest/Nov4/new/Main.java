class SimpleRunnable implements Runnable{
    public void run(){
        System.out.println("Thread " + Thread.currentThread().getName() + " begins!");
    }
}


public class Main{
    public static void main(String args[]) throws Exception{
	System.out.println("begin");
        Thread t1 = new Thread (new SimpleRunnable());
        Thread t2 = new Thread (new SimpleRunnable());
        t1.setName("T1");
        t2.setName("T2");
System.out.println("before t1");
        t1.start();
System.out.println("before t2");
        t2.start();
        t1.join();
        t2.join();
    }
}
