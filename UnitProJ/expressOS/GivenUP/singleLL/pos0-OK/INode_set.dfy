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
ensures footprint == {this};
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

method append(d:Data)
modifies footprint;
decreases footprint;
requires Valid();
ensures Valid();
ensures (tailContents == old(tailContents) + [d]);
ensures this.data == old(this.data);
ensures fresh(footprint - old(footprint));
{
var node := new INode.init();
node.data := d;

if(next == null)
{
next := node;
this.tailContents := [d];
}

else
 {
next.append(d);
this.tailContents := [this.next.data] + this.next.tailContents;
}

this.footprint := this.footprint + next.footprint;

}

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
}  



class INodes {
  var head: INode;

  ghost var contents: seq<Data>;
  ghost var footprint: set<object>;
  ghost var spine: set<INode>;

  function valid(): bool
reads *; 
{
this in footprint 
&& spine <= footprint
&& head != null 
&& head in spine 
&&
(forall nd :: nd in spine ==> nd != null && nd.Valid())
&&
(forall nd :: nd in spine ==> head in nd.footprint ==> head == nd)
&&
(forall nd :: nd in spine ==> (nd.footprint <= footprint - {this})) 
&&
(forall nd :: nd in spine ==> (nd.next != null ==> nd.next in spine))
&& head.data == null
&& contents == head.tailContents
}

method init()
modifies this;
ensures valid() && fresh(footprint - {this});
ensures |contents| == 0;
ensures spine == {head};
ensures head.next == null;
{
var n := new INode.init();
head := n;
contents := n.tailContents;

footprint := {this} + n.footprint;
spine := {head};
}


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

/*
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

method add2Front(d:Data)
modifies footprint;
requires valid();
requires d != null;

ensures valid();
ensures contents == [d] + old(contents);
ensures fresh(footprint - old(footprint));
{

var newNd := new INode.init();
newNd.data := d;
newNd.next := head.next;

newNd.tailContents := (if (newNd.next == null) then [] else [newNd.next.data] + newNd.next.tailContents);
newNd.footprint := newNd.footprint + (if (newNd.next == null) then {} else newNd.next.footprint);

head.next := newNd;
head.footprint := head.footprint + {newNd};
head.tailContents := [d] + head.tailContents;

this.footprint := this.footprint + {newNd};

this.spine := this.spine + {newNd};

this.contents := head.tailContents;

}

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

else if (pos == length) {}

else {}
}


}
