method Main() {
  print "hello, Dafny\n";
  var a: seq<int>;
  var b: seq<int>;
  a := [1,2,3];
  b := a[0..2] + [5] + a[2..];
  
  assert b == [1,2,5,3];
  print b;
}