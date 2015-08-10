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
&& forall node :: node in footprint - {this} ==> this !in getFtprint(node)
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

predicate ValidLemma()
requires Valid();
reads this, footprint;
ensures forall nd :: nd in footprint ==> nd != null && nd.footprint <= footprint;
ensures forall nd :: nd in footprint - {this} ==> this !in nd.footprint;
{
next != null ==> (next.ValidLemma())
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


function getFtprint(nd:INode): set<INode>
reads nd;
{
if nd == null then {} else nd.footprint
}

/*
predicate valid2Acyclic(nd:INode)
requires nd != null && nd.Valid();
reads nd, getFtprint(nd);
ensures valid2Acyclic(nd);
ensures nd.acyclic();
{
nd.next != null ==> (nd !in nd.next.footprint && nd.next.Valid())
}


predicate myLemma(nd:INode)
requires nd != null && nd.acyclic();
reads *;
ensures myLemma(nd);
ensures forall node :: node in nd.footprint - {nd} ==> nd !in getFtprint(node);
{
next != null ==> (next.acyclic()
	|| next.Valid())
}


function getLen(nd:INode):int
requires nd != null && nd.acyclic();
reads *;
decreases *;
{
if nd.next == null then 1 else 1 + getLen(nd.next)
}
*/

/*
function sumAllFtprint(node: INode): set<INode>
requires node != null ==> node.acyclic();
reads *;
decreases footprint + getFtprint(next);
ensures node != null ==> (forall nd :: nd in node.footprint ==> 
	(nd != null ==> nd.footprint <= sumAllFtprint(node)));
{
if node == null then {} else node.footprint + sumAllFtprint(node.next)
}


ghost method mkValid()
requires acyclic();
modifies footprint;
ensures Valid();
{
if (next != null)
{
next.mkValid();
this.tailContents := [next.data] + next.tailContents;
this.footprint := {this} + next.footprint;
}

else {
this.tailContents := [];
this.footprint := {this};
}

}
*/

}



