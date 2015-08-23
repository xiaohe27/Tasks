class Data {}
class INode 
{
ghost var tailContents: seq<Data>;
ghost var footprint: set<INode>;

var data: Data;
var next: INode;


function method len():int
requires Valid();
reads this, footprint;
ensures len() == |footprint| == |tailContents| + 1;
{
if next == null then 1 else 1 + next.len()
}



predicate good()
reads this, footprint;
{
    this in footprint && null !in footprint
	&& (next != null ==> (next in footprint 
	&& this !in next.footprint 
	&& footprint == {this} + next.footprint
	))
	&& (next ==null ==> tailContents == [] && footprint == {this})
	&& (next != null ==> tailContents == [next.data] + next.tailContents)
}


predicate Valid()
reads this, footprint;
{
good()  
&& (next != null ==> next.Valid())
}

predicate allVLemma()
requires Valid();
reads this, footprint;
ensures allVLemma();

ensures forall nd :: nd in footprint ==> nd != null && nd.Valid();
{
if (next == null)
then footprint == {this}
else 
next.allVLemma()
}

/*
predicate canGoto(node:INode)
requires Valid();
reads this, footprint;
{
this == node ||
(next != null && next.canGoto(node))
}

predicate gotoLemma()
requires Valid();
reads this, footprint;
ensures gotoLemma();
ensures forall nd :: nd in footprint ==> canGoto(nd);
{
if (next == null)
then footprint == {this}
else 
footprint == {this} + next.footprint &&
next.gotoLemma()
}
*/

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

/*
method preAppend(d:Data) returns (node:INode)
requires Valid();
ensures node != null && node.Valid();
ensures node.data == d && node.next == this;
ensures node.tailContents == [this.data] + this.tailContents;
{
var r := new INode.init(d);

r.next := this;

r.footprint := {r} + footprint;
r.tailContents := [this.data] + this.tailContents;
return r;
}
*/


method append(d:Data)
requires Valid();

modifies footprint;
//ensures Valid();
//ensures fresh(footprint - old(footprint));
{
var newNd := new INode.init(d);
assert newNd.footprint !! footprint;

var tmpNd := this;

while(tmpNd.next != null)
invariant tmpNd != null && tmpNd.Valid();
decreases tmpNd.footprint;
{
tmpNd := tmpNd.next;
}

assert allVLemma();

tmpNd.next := newNd;


ghost var myNd := this;
while(myNd != tmpNd)
invariant forall nd :: nd in (footprint - {tmpNd}) ==> nd.good();
invariant myNd in footprint;
invariant tmpNd in myNd.footprint;
invariant myNd != tmpNd ==> myNd.good();

invariant newNd.Valid() && tmpNd.next == newNd;
decreases myNd.footprint;
{
myNd := myNd.next;
}



}





function getFtprint(nd:INode): set<INode>
reads nd;
{
if nd == null then {} else nd.footprint
}




}