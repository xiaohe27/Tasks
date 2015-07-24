class Data {}
class INode {
ghost var heap: set<INode>;
ghost var contents: seq<Data>;

var data: Data;
var next: INode;

function Valid(): bool
reads this, heap;
decreases heap;
{
(if next == null then
heap == {this} && contents == [data] 
else
this in heap &&
next in heap &&
next.heap == heap - {this} &&
next.heap < heap &&
contents == [data] + next.contents &&
next.Valid()
)
&& |contents| == |heap|
&& null !in heap
}

predicate listOK() 
reads this, heap;
{
(if next == null then
heap == {this} 
else
this in heap &&
next in heap &&
next.heap == heap - {this} &&
next.heap < heap
)
&& null !in heap
}

constructor init(d:Data) 
modifies this;
ensures Valid();
ensures data == d;
ensures next == null;
ensures heap == {this};
ensures fresh(heap - {this});
{
    data := d;
	next := null;
    contents := [d];
	heap := {this};
}

method addNode2Heap(nd:INode)
modifies this, heap;
requires Valid();
requires listOK();
//ensures 
{}

}

function method len(n: INode): int
reads n, getHeap(n);
requires n != null ==> n.Valid();
ensures n != null ==> len(n) == |n.heap|;
decreases getHeap(n);
{
if n == null then 0 else 1 + len(n.next)
}

function getHeap(n: INode): set<INode>
reads n;
{
if n == null then {} else n.heap
}

function method getList(n: INode): seq<INode>
reads n, getHeap(n);
requires n != null ==> n.Valid();
decreases getHeap(n);
ensures forall nd :: nd in getHeap(n) ==> nd in getList(n) && nd.Valid();
ensures forall nd :: nd in getList(n) ==> nd in getHeap(n) && nd.Valid();
ensures (set node | node in getList(n)) == getHeap(n);
{
if n == null then [] else [n] + getList(n.next)
} 

function method getFootprint(n: INode): set<INode>
reads n, getHeap(n);
requires n != null ==> n.Valid();
decreases getHeap(n);
ensures getFootprint(n) == getHeap(n);
{
if n == null then {} else {n} + getFootprint(n.next)
} 

function getContents(ns:seq<INode>): seq<Data>
reads *;
requires forall nd :: nd in ns ==> nd != null && nd.Valid();
ensures |getContents(ns)| == |ns|;
ensures forall i :: 0 <= i < |ns| ==> ns[i].data == getContents(ns)[i];
{
if |ns| == 0 then [] else [ns[0].data] + getContents(ns[1..])
}

function method get(nd:INode, i:int): INode
reads nd, getHeap(nd);
requires nd != null && nd.Valid();
requires 0 <= i < |nd.contents|;
{
if i == 0 then nd else get(nd.next, i - 1)
}

method setNext(n: INode, next: INode) 
requires n != null;
requires n !in getHeap(next);
requires next != null ==> next.Valid();
modifies n;
ensures n.data == old(n.data) && n.next == next;
ensures n.Valid();
ensures getList(n) == [n] + old(getList(next));
{
n.next := next;
n.heap := {n} + getHeap(next);
n.contents := (if next == null then [n.data] else [n.data] + next.contents);
}

method preAppend(nd: INode, d:Data) returns (newHead:INode)
requires nd != null && nd.Valid();
ensures newHead != null && newHead.data == d && newHead.next == nd;
ensures newHead.Valid();
{
newHead := new INode.init(d);
setNext(newHead, nd);
}


method append(nd: INode, d:Data)
requires nd != null && nd.Valid();
requires forall node :: node in getHeap(nd) ==> node.listOK();

modifies getHeap(nd);
//ensures nd.Valid();
//ensures nd.contents == old(nd.contents) + [d];
//ensures fresh(getHeap(nd) - old(getHeap(nd)));
{

var lastNd := nd;

while(lastNd.next != null)
invariant lastNd != null && lastNd.Valid();
decreases getHeap(lastNd);
{
lastNd := lastNd.next;
}

assert lastNd.next == null && lastNd.Valid();

var newNd := new INode.init(d);
assert newNd.Valid();

assert forall node :: node in getHeap(nd) ==> node.listOK();

lastNd.next := newNd;

assert forall node :: node in getHeap(nd) ==> node.heap !! newNd.heap;

forall(node | node in getHeap(nd))
{
node.heap := node.heap + getHeap(newNd);
}

assert nd.listOK();
assert newNd.listOK();
assert getHeap(nd) == old(getHeap(nd)) + newNd.heap;

/*
(if next == null then
heap == {this} 
else
this in heap &&
next in heap &&
next.heap == heap - {this} &&
next.heap < heap
)
&& null !in heap
*/
assert forall node::node in getHeap(nd) ==> node in getHeap(node);

assert forall node::node in getHeap(nd) ==> (node.next != null ==> 
			(node.next in getHeap(node)));


assert forall node::node in getHeap(nd) ==> (node.next != null ==> 
			(node.next.heap < getHeap(node)));


//assert forall node :: node in getHeap(nd) ==> node.listOK();

}

