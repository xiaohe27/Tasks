class Data {}
class INode 
{
ghost var tailContents: seq<Data>;
ghost var footprint: set<INode>;
ghost var list: seq<INode>;

var data: Data;
var next: INode;

function method seq2Set(ndSeq:seq<INode>) : set<INode>
ensures forall nd :: nd in ndSeq ==> nd in seq2Set(ndSeq);
ensures forall nd :: nd in seq2Set(ndSeq) ==> nd in ndSeq;
{
if ndSeq == [] then {} else {ndSeq[0]} + seq2Set(ndSeq[1..])
}

predicate Valid()
reads this, footprint;
{
good()
&& (forall i :: 0 <= i < |list| - 1 ==> list[i].next == list[i + 1])
&& (|list| == |tailContents| + 1)
&& (next != null ==> next.Valid())
}

predicate good()
reads this, footprint;
{
good1() && good2() && good3()
&& seq2Set(list) == footprint
}

predicate good1()
reads this, footprint;
{
    this in footprint && null !in footprint
	&& (next != null ==> (next in footprint 
	&& this !in next.footprint 
	&& next.footprint + {this} == footprint
	))
	&& (next == null ==> footprint == {this})

}

predicate good2()
reads this, next;
{
(next ==null ==> tailContents == [])
	&& (next != null ==> tailContents == [next.data] + next.tailContents)
}

predicate good3()
reads this, next;
{
(next == null ==> list == [this]) &&
(next != null ==> list == [this] + next.list)
}

constructor init(d:Data) 
modifies this;
ensures Valid();
ensures data == d;
ensures next == null;
ensures footprint == {this};
ensures tailContents == [];
ensures list == [this];
ensures fresh(footprint - {this});
{
    data := d;
	next := null;
    tailContents := [];
	footprint := {this};
	list := [this];
}

method try(oldNd:INode)
requires oldNd != null && oldNd.Valid();
ensures oldNd.Valid();
ensures forall nd :: nd in oldNd.footprint ==> nd != null && nd.Valid();
{
allV(oldNd);
}

}  

lemma allV(myNode:INode)
requires myNode != null && myNode.Valid();
decreases myNode.footprint;
requires myNode.next != null ==> myNode.next.Valid();
ensures forall nd :: nd in myNode.footprint ==> nd != null && nd.Valid();
{
if (myNode.next == null)
{
assert myNode.footprint == {myNode};
}

else 
{
allV(myNode.next);
}

}

