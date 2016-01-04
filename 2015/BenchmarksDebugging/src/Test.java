/**
 * Created by xiaohe on 15-4-13.
 */
interface A {}

class C implements A {
    String a;
    public C(String a) {
        this.a = a;
    }
}

public class Test {
    static class MyHashMap<T extends A, String> {
        T obj;

        public void set(T t) {
            obj = t;
        }

        public T get() {
            return obj;
        }

    }

    public static void main(String[] args) {
        MyHashMap<C,String> my = new MyHashMap<C,String>();
        my.set(new C("good"));
        System.out.println(my.get().a);

    }
}
