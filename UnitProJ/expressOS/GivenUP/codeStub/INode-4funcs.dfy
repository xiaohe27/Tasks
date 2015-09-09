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



