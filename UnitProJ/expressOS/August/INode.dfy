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
    this in footprint 
	&& (next != null ==> (next in footprint 
	&& this !in next.footprint 
	&& footprint == {this} + next.footprint
	&& spine == [this] + next.spine
	&& tailContents == [next.data] + next.tailContents
	))
	&& (next ==null ==> tailContents == [] && footprint == {this}
				&& spine == [this])
}


predicate Valid()
reads this, footprint;
{
good()  
&& (forall nd :: nd in spine ==> nd in footprint)
&& (next != null ==> next.Valid())
}

predicate ValidLemma()
requires Valid();
reads this, footprint;
ensures ValidLemma();
ensures |tailContents| == |footprint|-1 == |spine|-1;

ensures forall nd :: nd in spine ==> nd != null && nd.Valid();
{
(next == null) ||
(next.ValidLemma())
}

/*
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


method append(d:Data)
requires Valid();

modifies footprint;
ensures Valid();
//ensures (tailContents == old(tailContents) + [d]);
//ensures this.data == old(this.data);
//ensures fresh(footprint - old(footprint));
{
var node := new INode.init(d);
assert node.footprint !! footprint;

var tmpNd := this;
ghost var index := 0;

while(tmpNd.next != null)
invariant tmpNd != null && tmpNd.Valid();
invariant listCond(spine);
invariant index == |this.footprint| - |tmpNd.footprint|;
invariant tmpNd == spine[index];
decreases tmpNd.footprint;
{
tmpNd := tmpNd.next;

index := index + 1;
}

tmpNd.next := node;

spine := spine + [node];

updateSeq(spine, |spine|-1);
assert ValidLemma();


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
requires listCond(mySeq);
requires mySeq != [] ==> mySeq[0].Valid();

reads mySeq, sumAllFtprint(mySeq);
ensures seqV(mySeq);
ensures forall nd :: nd in mySeq ==> nd.Valid(); 
{
mySeq == [] || seqV(mySeq[1..])
}

/*
predicate spineFtprintLemma()
requires Valid();
reads this, footprint;

ensures spineFtprintLemma();
ensures (set nd | nd in spine) == footprint;
{
if next == null then (spine == [this] && footprint == {this})
else (
spine == [this] + next.spine 
&& footprint == {this} + next.footprint
&& next.spineFtprintLemma())
}

predicate ndValid2ListValidLemma()
requires Valid();
reads this, footprint;

ensures ndValid2ListValidLemma();

ensures forall nd :: nd in footprint ==> nd != null &&
							nd.footprint <= footprint;

ensures validSeqCond(spine);
{
if next == null then (spine == [this] && footprint == {this}
					&& tailContents == [])
else (
this !in next.footprint &&
spine == [this] + next.spine 
&& footprint == {this} + next.footprint
&& tailContents == [next.data] + next.tailContents
&& next.ndValid2ListValidLemma())
}

*/
///////////////////////////////////////////

predicate listInv(mySeq: seq<INode>)
reads mySeq, (set nd | nd in mySeq);
{
null !in mySeq && (forall nd :: nd in mySeq ==> nd in nd.footprint) &&
(forall i :: 0 <= i < |mySeq|-1 ==> mySeq[i].next == mySeq[i+1])
&& (forall i, j :: 0 <= i < j < |mySeq| ==> mySeq[i] !in mySeq[j].footprint)
}

predicate listCond(mySeq: seq<INode>)
reads mySeq, (set nd | nd in mySeq);
{
null !in mySeq && (forall nd :: nd in mySeq ==> nd in nd.footprint) &&
(forall i :: 0 <= i < |mySeq|-1 ==> mySeq[i].next == mySeq[i+1]
	&& mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
	&& mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents
	&& mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine)
&& (forall i, j :: 0 <= i < j < |mySeq| ==> mySeq[i] !in mySeq[j].footprint)
}

predicate validSeqCond(mySeq: seq<INode>)
reads mySeq, (set nd | nd in mySeq);
{
listCond(mySeq) 
&& (mySeq != [] ==> mySeq[|mySeq|-1].next == null
&& mySeq[|mySeq|-1].footprint == {mySeq[|mySeq|-1]}
&& mySeq[|mySeq|-1].tailContents == []
&& mySeq[|mySeq|-1].spine == [mySeq[|mySeq|-1]])
}

//===============================================


ghost method updateCurIndex(mySeq:seq<INode>, index:int,
			d:Data, newNd:INode)
requires 0 <= index <= |mySeq| - 2;
requires listInv(mySeq);

requires forall i :: 0 <= i < index ==>
	   mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
	&& mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents
	&& mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine;

requires mySeq[index].footprint + {newNd} == 
	{mySeq[index]} + mySeq[index+1].footprint;

requires mySeq[index].spine + [newNd] == 
	[mySeq[index]] + mySeq[index+1].spine;

requires mySeq[index].tailContents + [d] == 
	[mySeq[index+1].data] + mySeq[index+1].tailContents;

requires mySeq[index+1].Valid();
requires mySeq[index+1].spine == mySeq[index+1..];

modifies mySeq[index];
//ensures fresh((set nd | nd in mySeq) - old(set nd | nd in mySeq));

ensures listInv(mySeq);

ensures forall i :: 0 <= i < index-1 ==>
	   mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
	&& mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents
	&& mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine;

ensures mySeq[index].footprint == old(mySeq[index].footprint) + {newNd};
ensures mySeq[index].spine == old(mySeq[index].spine) + [newNd];
ensures mySeq[index].tailContents == 
	old(mySeq[index].tailContents) + [d];

ensures index > 0 ==> (mySeq[index-1].footprint + {newNd} == 
	{mySeq[index-1]} + mySeq[index].footprint &&
	mySeq[index-1].spine + [newNd] == 
	[mySeq[index-1]] + mySeq[index].spine &&
	mySeq[index-1].tailContents + [d] == 
	[mySeq[index].data] + mySeq[index].tailContents);

ensures mySeq[index].Valid();

ensures mySeq[index].spine == mySeq[index..];
{
mySeq[index].tailContents := [mySeq[index+1].data] + mySeq[index+1].tailContents;

mySeq[index].footprint := {mySeq[index]} + mySeq[index+1].footprint;

mySeq[index].spine := [mySeq[index]] + mySeq[index+1].spine;
}


/*
ghost method updateSeq(mySeq:seq<INode>, mid:int)

requires mySeq != [];
requires listInv(mySeq);

requires 0 <= mid < |mySeq|;
requires mySeq[mid].Valid();
requires mySeq[mid].spine == mySeq[mid..];
	
modifies mySeq;

ensures validSeqCond(mySeq);
ensures fresh((set nd | nd in mySeq) - old(set nd | nd in mySeq));
{
ghost var index := mid - 1;

while(index >= 0)
invariant -1 <= index <= mid - 1;
invariant listInv(mySeq);
invariant mySeq[index+1].Valid(); 
invariant mySeq[mid].Valid();
invariant mySeq[index+1].spine == mySeq[index+1..];
invariant fresh((set nd | nd in mySeq) - old(set nd | nd in mySeq));
{
updateCurIndex(mySeq, index);

index := index - 1;
}

assert seqV(mySeq);
}
*/



}