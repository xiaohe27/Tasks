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
ensures tailContents == [];
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

}

class LL {
  ghost var contents: seq<Data>;
  ghost var spine: set<INode>;
  ghost var footprint: set<object>;
  
  var head:INode;
  
  function valid(): bool
reads *;
{
this in footprint &&
spine <= footprint &&
head != null && head in spine &&
(forall n :: n in spine ==> 
(n != null 
&& n.Valid() 
&& n.footprint <= footprint)
&& (n.next != null ==> (n.next in spine)))
&& contents == head.tailContents
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
spine := {n};
}
  
}

