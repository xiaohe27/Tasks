class Data {}
class INode 
{
ghost var tailContents: seq<Data>;
ghost var footprint: set<INode>;

var data: Data;
var next: INode;

function Valid() : bool
reads this, footprint;
{
    this in footprint 
	&& (next != null ==> (next in footprint 
	&& this !in next.footprint && next.footprint < footprint
	&& next.footprint + {this} == footprint
	&& next.Valid() 
	))
	&& (next ==null ==> footprint == {this} && tailContents == [])
	&& (next != null ==> tailContents == [next.data] + next.tailContents)
	&& null !in footprint
}

constructor init(d:Data) 
modifies this;
ensures Valid();
ensures data == d;
ensures next == null;
ensures footprint == {this};
ensures fresh(footprint - {this});
{
    data := d;
	next := null;
    tailContents := [];
	footprint := {this};
}


/*
method preAppend(d:Data) returns (node:INode)
requires Valid();
ensures node != null && node.Valid();
ensures node.data == d && node.next == this;
{
var r := new INode.init();
r.data := d;
r.next := this;

r.footprint := r.footprint + this.footprint;
r.tailContents := [this.data] + this.tailContents;
return r;
}
*/

method append(d:Data) returns (node:INode)
modifies footprint;
decreases footprint;
requires Valid();
ensures Valid();
ensures (tailContents == old(tailContents) + [d]);
ensures this.data == old(this.data);
ensures footprint == old(footprint) + {node};
ensures fresh(footprint - old(footprint));
{
if(next == null)
{
node := new INode.init(d);
next := node;
this.tailContents := [d];
}

else
 {
node := next.append(d);
this.tailContents := [this.next.data] + this.next.tailContents;
}

this.footprint := {this} + next.footprint;

}

/*
function method getNode(i:int):INode
reads this, footprint;
requires 0 <= i <= |tailContents|;
requires Valid();

ensures Valid();
ensures getNode(i) != null;
ensures getNode(i).Valid();
ensures getNode(i) in footprint;
ensures (i == 0 ==> getNode(i) == this);
ensures (i > 0 ==> getNode(i).data == tailContents[i-1] && getNode(i).tailContents == tailContents[i..]);
{
if(i == 0) 
then this
else
this.next.getNode(i - 1)
}
*/

}  



class INodes {
  var head: INode;

  ghost var contents: seq<Data>;
  ghost var footprint: set<object>;
  ghost var spine: seq<INode>;

  function valid(): bool
reads *; 
{
this in footprint 

&& head != null && head in spine 
&& head.data == null
&& head == spine[0] 
&& |contents| == |spine| - 1
&& head.footprint == (set nd | nd in spine)
&&
(forall nd :: nd in spine ==> nd != null && nd.Valid() && nd.footprint <= footprint - {this})

&& (forall nd :: nd in spine ==> nd.next != head && head in nd.footprint ==> head == nd)

&&
(forall nd :: nd in spine ==> (nd.next != null ==> nd.next in spine))

&& (forall i :: 0 <= i < |spine| - 1 ==> spine[i].next == spine[i + 1])

&& contents == head.tailContents 
}

method init()
modifies this;
ensures valid() && fresh(footprint - {this});
ensures |contents| == 0;
ensures spine == [head];
ensures head.next == null;
{
head := new INode.init(null);
contents := head.tailContents;

footprint := {this};
footprint := footprint + {head};
spine := [head];
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
*/

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


method add2Front(d:Data)
modifies footprint, spine;
requires valid();
requires d != null;

ensures valid();
ensures contents == [d] + old(contents);
ensures fresh(footprint - old(footprint));
{
head.data := d;

var newHead := new INode.init(null);
newHead.next := head;

newHead.footprint := {newHead} + head.footprint;
newHead.tailContents := [d] + head.tailContents;

head := newHead;

footprint := footprint + {newHead};

spine := [head] + spine;

contents := head.tailContents;
}


/*
method insert(d:Data, pos:int) 
modifies footprint;
requires valid();
requires d != null;
//requires 0 <= pos <= |contents|;
requires pos == 0;

ensures valid();
ensures |contents| == (|old(contents)| + 1);
ensures fresh(footprint - old(footprint));
{
//assume pos == 0;

var length := this.len();
if (pos == 0) {

add2Front(d);
}

else if (pos == length) {

add2End(d);
}

else {}
}
*/

}
