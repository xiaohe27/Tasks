class Data {}
class INode 
{
ghost var tailContents: seq<Data>;
ghost var spine: seq<INode>;
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
	&& next.footprint + {this} == footprint
	&& spine == [this] + next.spine
	))
	&& (next ==null ==> tailContents == [] && footprint == {this}
				&& spine == [this])
	&& (next != null ==> tailContents == [next.data] + next.tailContents)
}


predicate Valid()
reads this, footprint;
{
good()  
&& (forall nd :: nd in spine ==> nd in footprint)
&& listCond(spine)
&& (next != null ==> next.Valid())
}

predicate ValidLemma()
requires Valid();
reads this, footprint;
ensures forall nd :: nd in spine ==> nd.Valid();
ensures validSeqCond(spine);
{
allV(this) && (forall nd :: nd in spine ==> nd in footprint)
}

predicate ValidLemma2()
requires Valid();
reads this, footprint;
ensures (set nd | nd in spine) == footprint;
{
if next == null then (spine == [this] && footprint == {this})
else (
spine == [this] + next.spine && footprint == {this} + next.footprint
&& next.ValidLemma2())
}

constructor init(d:Data) 
modifies this;
ensures Valid();
ensures data == d;
ensures next == null;

ensures footprint == {this};
ensures tailContents == [];
ensures spine == [this];
ensures fresh(footprint - {this});
{
    data := d;
	next := null;
    tailContents := [];
	footprint := {this};
    spine := [this];
}


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
r.spine := [r] + spine;

return r;
}

/*
method append(d:Data)
requires Valid();

modifies footprint;
//decreases footprint;
//ensures Valid();
//ensures (tailContents == old(tailContents) + [d]);
//ensures this.data == old(this.data);
//ensures fresh(footprint - old(footprint));
{
var node := new INode.init(d);
assert node.footprint !! footprint;

var tmpNd := this;
while(tmpNd.next != null)
invariant tmpNd != null && tmpNd.Valid();
decreases tmpNd.footprint;
{
tmpNd := tmpNd.next;
}

tmpNd.next := node;

spine := spine + [node];


assert spine[|spine|-1].next == null
	&& spine[|spine|-1].Valid();
assert seqInv(spine);

updateSeq(spine);

//assert Valid();

}
*/




function getFtprint(nd:INode): set<INode>
reads nd;
{
if nd == null then {} else nd.footprint
}

function sumAllFtprint(mySeq: seq<INode>): set<INode>
reads mySeq;
ensures forall nd :: nd in mySeq ==> 
	(nd != null ==> nd.footprint <= sumAllFtprint(mySeq));
{
if mySeq == [] then {} else getFtprint(mySeq[0]) + sumAllFtprint(mySeq[1..])
}



predicate allV(myNode:INode)
reads myNode, getFtprint(myNode);
requires myNode != null && myNode.Valid();
decreases myNode.footprint;
ensures allV(myNode);
ensures forall nd :: nd in myNode.footprint ==> nd != null && nd.Valid();
{

if (myNode.next == null)
then myNode.footprint == {myNode}
else 
allV(myNode.next)
}

predicate seqV(mySeq: seq<INode>)
requires goodSeqCond(mySeq);
requires mySeq != [] ==> mySeq[0].Valid();

reads mySeq, sumAllFtprint(mySeq);
ensures seqV(mySeq);
ensures goodSeqCond(mySeq);
ensures forall nd :: nd in mySeq ==> nd.Valid(); 
{
mySeq == [] ||
(seqV(mySeq[1..]))
}


predicate listCond(mySeq: seq<INode>)
reads mySeq, (set nd | nd in mySeq);
{
null !in mySeq &&
(forall i :: 0 <= i < |mySeq|-1 ==> mySeq[i].next == mySeq[i+1])
&& (mySeq != [] ==> mySeq[|mySeq|-1].next == null)
&& (forall i, j :: 0 <= i < j < |mySeq| ==> mySeq[i] !in mySeq[j].footprint)
}

predicate goodSeqCond(mySeq: seq<INode>)
reads mySeq, sumAllFtprint(mySeq);
{
listCond(mySeq) &&
(forall nd :: nd in mySeq ==> nd.good())
}

predicate validSeqCond(mySeq: seq<INode>)
reads mySeq, sumAllFtprint(mySeq);
{
listCond(mySeq) &&
(forall nd :: nd in mySeq ==> nd.Valid())
}


//===============================================


ghost method updateCurIndex(mySeq:seq<INode>, index:int)
requires 0 <= index <= |mySeq| - 2;
requires listCond(mySeq);
requires index > 0 ==> goodSeqCond(mySeq[0..index]);
requires validSeqCond(mySeq[index+1..]);
	
//requires mySeq[index] !in (mySeq[index+1].footprint);

modifies mySeq;
ensures fresh((set nd | nd in mySeq) - old(set nd | nd in mySeq));
ensures listCond(mySeq);

ensures mySeq[index].Valid(); 
{
mySeq[index].tailContents := [mySeq[index+1].data] + mySeq[index+1].tailContents;

mySeq[index].footprint := {mySeq[index]} + mySeq[index+1].footprint;

mySeq[index].spine := [mySeq[index]] + mySeq[index+1].spine;

}


/*
ghost method updateSeq(mySeq:seq<INode>)

requires mySeq != [];
requires listCond(mySeq);

//
requires |mySeq| > 1 ==> goodSeqCond(mySeq[0..|mySeq|-2]);
requires validSeqCond(mySeq[|mySeq|-1..]);
	
requires mySeq[|mySeq|-2] !in (mySeq[|mySeq|-1].footprint);

modifies mySeq;

/*
ensures forall i :: 0 <= i < |mySeq|-1 ==> 
	(mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents)
 && (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint)
 && (mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine);
*/

ensures validSeqCond(mySeq);

/*
ensures mySeq[0].footprint == (set nd | nd in mySeq);
ensures forall nd :: nd in mySeq ==> nd.footprint <= mySeq[0].footprint;
ensures forall nd :: nd in mySeq[1..] ==> nd.footprint < mySeq[0].footprint;
*/
{
ghost var index := |mySeq| - 2;

while(index >= 0)
invariant -1 <= index <= |mySeq| - 2;

invariant forall i :: index < i < |mySeq|-1 ==> 
	(mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents)
 && (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint)
 && (mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine);

invariant listCond(mySeq);
invariant mySeq[index+1].Valid(); 
{
updateCurIndex(mySeq, index);

index := index - 1;

/*
assert forall i :: index < i < |mySeq|-1 ==> 
	(mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents)
 && (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint)
 && (mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine);

assert seqInv(mySeq);  
assert mySeq[|mySeq|-1].next == null;
*/
}

assert seqV(mySeq);

}
*/

}
