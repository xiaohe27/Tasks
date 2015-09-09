class LinkedList<T> {
  var head: T;
  var tail: LinkedList<T>;
  var length: int;

  ghost var List: seq<T>;
  ghost var Repr: set<LinkedList<T>>;

  function Valid(): bool
    reads this, Repr;
  {
    this in Repr &&
    0 <= length && length == |List| &&
    (length == 0 ==> List == [] && tail == null) &&
    (length != 0 ==>
      tail != null && tail in Repr &&
      tail.Repr <= Repr && this !in tail.Repr &&
      tail.Valid() &&
      List == [head] + tail.List &&
      length == tail.length + 1)
  }

  method Init()
    modifies this;
    ensures Valid() && List == [];
  {
    tail := null;
    length := 0;
    List := [];
    Repr := {this};
  }

  method Cons(d: T) returns (r: LinkedList<T>)
    requires Valid();
    ensures r != null && r.Valid() && r.List == [d] + List;
  {
    r := new LinkedList<T>;
    r.head := d;
    r.tail := this;
    r.length := length + 1;
    r.List := [d] + List;
    r.Repr := {r} + Repr;
  }

  method Concat(end: LinkedList<T>) returns (r: LinkedList<T>)
    requires Valid() && end != null && end.Valid();
    ensures r != null && r.Valid() && r.List == List + end.List;
    decreases Repr;
  {
    if (length == 0) {
      r := end;
    } else {
      var c := tail.Concat(end);
      r := c.Cons(head);
    }
  }

  method Reverse() returns (r: LinkedList<T>)
    requires Valid();
    ensures r != null && r.Valid() && |List| == |r.List|;
    ensures (forall k :: 0 <= k && k < |List| ==> List[k] == r.List[|List|-1-k]);
    ensures r.List == ReverseSeq(List);
    decreases Repr;
  {
    if (length == 0) {
      r := this;
    } else {
      r := tail.Reverse();
      var e := new LinkedList<T>.Init();
      e := e.Cons(head);
      r := r.Concat(e);
    }
  }

  static function ReverseSeq(s: seq<T>): seq<T>
  {
    if s == [] then [] else
    ReverseSeq(s[1..]) + [s[0]]
  }
}