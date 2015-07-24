class Data {}
class INode 
{
ghost var tailContents: seq<Data>;
ghost var footprint: set<object>;

var data: Data;
var next: INode;

function Valid() : bool
reads this, footprint;
{
    this in footprint 
	&& (next != null ==> (next in footprint 
	&& this !in next.footprint && next.footprint < footprint
	&& next.Valid() 
	))
	&& (next ==null ==> tailContents == [])
	&& (next != null ==> tailContents == [next.data] + next.tailContents)
	&& null !in footprint
}

constructor init() 
modifies this;
ensures Valid();
ensures data == null;
ensures next == null;
ensures fresh(footprint - {this});
{
    data := null;
	next := null;
    tailContents := [];
	footprint := {this};
}

function method len() :int
reads this,footprint;
requires Valid();
ensures Valid();
ensures len() == |tailContents| + 1;
{
if (next == null) then 1 else 1 + next.len()
}

}  




class INodes {
  var head: INode;

  ghost var contents: seq<Data>;
  ghost var spine: seq<INode>;
  ghost var footprint: set<object>;

  function valid(): bool
reads *;
{
this in footprint 

&& (forall nd :: nd in spine ==> nd in footprint && nd != null && nd.Valid())

&& head != null 
&& |spine| == |head.tailContents| + 1
&& head == spine[0] 
&& contents == head.tailContents
&&
(forall i :: 0 <= i < |spine| ==> 
(i > 0 ==> (spine[i].data == contents[i-1]))
&& (spine[i].footprint <= footprint)
&& (spine[i].next != null ==> (i < |spine| - 1 && spine[i].next == spine[i + 1]))
&& (spine[i].next == null ==> i == |spine| - 1) 
)

&& head.data == null
&& (forall i, j :: 0 <= i < |spine| && 0 <= j < |spine| 
		==> (i < j ==> spine[i] !in spine[j].footprint) )
}

method init()
modifies this;
ensures valid() && fresh(footprint - {this});
ensures |contents| == 0;
{
var n := new INode.init();
head := n;
contents := n.tailContents;

footprint := {this} + n.footprint;
spine := [n];
}

/*
method len() returns (len:int)
requires valid();
ensures valid();
ensures len == |contents|;
{
var tmp:INode;
tmp := head;
len := 0;

while(tmp.next != null)
decreases tmp.footprint;
invariant tmp != null && tmp.Valid();
invariant tmp.next == null ==> tmp.tailContents == [];
invariant len + |tmp.tailContents| == |contents|;
{
len := len + 1;

tmp := tmp.next;
}

}

method get(index:int) returns (node:INode)
requires valid();
requires 0 <= index < |contents|;
ensures valid();
ensures node == spine[index + 1];
ensures node.data == contents[index];
{
var curNd: INode;
var curPos: int;

curNd := head;
curPos := 0; 

while (curNd.next != null)
decreases curNd.footprint;
invariant 0 <= curPos <= index;
invariant curNd != null && curNd.Valid();
invariant curNd == spine[curPos];
{
if (curPos == index) 
{
return curNd.next;
}

curPos := curPos + 1;
curNd := curNd.next;
}

}
*/

method insert(d:Data, pos:int) 
modifies footprint;
requires valid();
requires d != null;
//requires 0 <= pos <= |contents|;
requires pos == 0;

ensures valid();
ensures |contents| == (|old(contents)| + 1);
ensures |spine| == old(|spine|) + 1;
ensures forall i :: 0 <= i < pos ==> contents[i] == old(contents[i]) == spine[i + 1].data;
ensures contents[pos] == d == spine[pos + 1].data;
ensures forall i :: pos < i < |this.contents| ==> (contents[i] == old(contents[i - 1]) == spine[i + 1].data);
ensures fresh(footprint - old(footprint));
{
var newHead := new INode.init();

newHead.data := d;
newHead.next := head.next;

newHead.footprint := newHead.footprint + head.footprint - {head};
newHead.tailContents := head.tailContents;

head.next := newHead;
head.footprint := head.footprint + newHead.footprint;
head.tailContents := [d] + head.tailContents;


ghost var tmp: INode;
tmp := head;

ghost var index: int;
index := 0;

ghost var newContents:seq<Data>;
ghost var newFt:set<object>;
ghost var newSpine: seq<INode>;

newContents := [];
newFt := {head};
newSpine := [head];

while (tmp.next != null)
decreases tmp.footprint;
invariant tmp != null && tmp.Valid();
invariant forall nd :: nd in newSpine ==> nd != null && nd.Valid();

invariant index + tmp.len() == |spine| + 1;
invariant 0 <= index <= |spine|;
invariant tmp.next == null ==> index == |spine|;
{
tmp := tmp.next;
index := index + 1;

newContents := newContents + [tmp.data];
newFt := newFt + {tmp};
newSpine := newSpine + [tmp];

}

assert (forall nd :: nd in newSpine ==> nd.Valid() );


contents := newContents;
footprint := newFt + {this};
spine := newSpine;


assert (forall nd :: nd in newSpine ==> nd.Valid() );


}

}
