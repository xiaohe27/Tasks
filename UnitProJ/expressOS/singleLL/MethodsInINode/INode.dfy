class Data {}
class INode 
{
ghost var tailContents: seq<Data>;
ghost var footprint: set<INode>;

var data: Data;
var next: INode;

predicate acyclic()
reads *;
decreases footprint;
{
this in footprint 
&& (next != null ==> (
	this !in next.footprint 
  && (( next in footprint &&
	next.footprint + {this} == footprint && next.acyclic())
	|| next.Valid())
	))
}

predicate good()
reads this, footprint;
{
    this in footprint 
	&& (next != null ==> (next in footprint 
	&& this !in next.footprint 
	&& next.footprint + {this} == footprint
	))
	&& (next ==null ==> tailContents == [] && footprint == {this})
	&& (next != null ==> tailContents == [next.data] + next.tailContents)
}

predicate Valid()
reads this, footprint;
{
    this in footprint 
	&& (next != null ==> (next in footprint 
	&& this !in next.footprint 
	&& next.footprint + {this} == footprint
	&& next.Valid()
	))
	&& (next ==null ==> tailContents == [] && footprint == {this})
	&& (next != null ==> tailContents == [next.data] + next.tailContents)
}


constructor init(d:Data) 
modifies this;
ensures Valid();
ensures data == d;
ensures next == null;

ensures footprint == {this};
ensures tailContents == [];
ensures fresh(footprint - {this});
{
    data := d;
	next := null;
    tailContents := [];
	footprint := {this};
}

method preAppend(d:Data) returns (node:INode)
requires Valid();
ensures node != null && node.Valid();
ensures node.data == d && node.next == this;
{
var r := new INode.init(d);
r.next := this;

r.footprint := r.footprint + this.footprint;
r.tailContents := [this.data] + this.tailContents;
return r;
}

method append(d:Data)
requires Valid();

modifies footprint;
decreases footprint;
ensures Valid();
ensures (tailContents == old(tailContents) + [d]);
ensures this.data == old(this.data);
ensures fresh(footprint - old(footprint));
{
var node := new INode.init(d);

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

this.footprint := {this} + next.footprint;

}

}



