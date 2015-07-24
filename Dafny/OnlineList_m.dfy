class Data {}
class Node {
ghost var heap: set<Node>;
var value: Data;
var right: Node;
function isValid(): bool
reads this, heap;
decreases heap;
{
if right == null then
heap == {this}
else
this in heap &&
right in heap &&
right.heap == heap - {this} &&
right.isValid()
}
}

function getHeap(n: Node): set<Node>
reads n;
{
if n == null then {} else n.heap
}
function integralRight(n: Node): seq<Node>
reads n, getHeap(n);
requires n != null ==> n.isValid();
decreases getHeap(n);
{
if n == null then [] else [n] + integralRight(n.right)
} 

function minus(s: seq<Node>): seq<Node>
{
if |s| == 0 then [] else minus(s[1..]) + [s[0]]
}

method set_right(n: Node, right: Node) 
requires n != null;
requires n !in getHeap(right);
requires right != null ==> right.isValid();
modifies n;
ensures n.isValid();
ensures integralRight(n) == [n] + old(integralRight(right));
{
n.right := right;
n.heap := {n} + getHeap(right);
}

