class Data {}
class INode 
{
ghost var tailContents: seq<Data>;
ghost var spine: seq<INode>;
ghost var footprint: set<INode>;

var data: Data;
var next: INode;


predicate isAccessible(node:INode)
requires Valid();
reads this, footprint;
{
this == node || (next != null && next.isAccessible(node))
}

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
	&& (null !in footprint)
}

predicate perfect()
reads this, footprint;
{
	this in footprint 
	&& (next != null ==> (next in footprint 
	&& this !in next.footprint 
	&& next.footprint + {this} == footprint
	&& spine == [this] + next.spine
	&& next.perfect()
	))
	&& (next ==null ==> tailContents == [] && footprint == {this}
				&& spine == [this])
	&& (next != null ==> tailContents == [next.data] + next.tailContents)
	
	&& seqInv(spine)
	&& (set nd | nd in spine) == footprint
}

predicate perfect2()
reads this, footprint;
{
	this in footprint 
	&& (next != null ==> (next in footprint 
	&& this !in next.footprint 
	&& next.footprint + {this} == footprint
	&& spine == [this] + next.spine
	&& next.perfect()
	))
	&& (next ==null ==> tailContents == [] && footprint == {this}
				&& spine == [this])
	&& (next != null ==> tailContents == [next.data] + next.tailContents)

	&& (set nd | nd in spine) == footprint
}

predicate ValidLemma()
requires Valid();
reads this, footprint;
ensures Valid();
ensures forall nd :: nd in footprint ==> nd != null && nd.footprint <= footprint;
ensures forall nd :: nd in footprint - {this} ==> this !in nd.footprint;
ensures (set nd | nd != null && isAccessible(nd)) == footprint;
{
next != null ==> (next.ValidLemma())
}


constructor init(d:Data) 
modifies this;
ensures perfect();
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
requires perfect();
ensures node != null && node.perfect();
ensures node.data == d && node.next == this;
ensures node.tailContents == [this.data] + this.tailContents;
{
var r := new INode.init(d);

r.next := this;

r.footprint := r.footprint + this.footprint;
r.tailContents := [this.data] + this.tailContents;
r.spine := [r] + spine;
return r;
}

/*
method append(d:Data)
requires perfect();

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
//assert perfect();

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

predicate allDiff(mySeq:seq<INode>)
reads mySeq;
{
forall index :: 0 <= index < |mySeq| ==> 
	(forall other :: 0 <= other < |mySeq| && other != index ==>
	 (mySeq[other] != mySeq[index]))
}



//==seq invariant inside the loop===


predicate seqInv(mySeq: seq<INode>)
reads mySeq;
{
allDiff(mySeq) &&
(forall nd :: nd in mySeq ==> nd != null && nd in nd.footprint) &&
(forall i :: 0 <= i < |mySeq|-1 ==> mySeq[i].next == mySeq[i+1]) 
&&
(mySeq != [] ==> mySeq[|mySeq|-1].next !in mySeq) &&
(forall i :: 0 <= i < |mySeq| ==> (set nd | nd in mySeq[0..i])					
				!! mySeq[i].footprint)
}

/*
predicate stillSeqInv(mySeq:seq<INode>, newNd:INode)
requires mySeq != [] && seqInv(mySeq);
requires newNd != null && newNd.Valid() && newNd.next == mySeq[0];
requires {newNd} !! sumAllFtprint(mySeq);
requires forall nd :: nd in mySeq ==> nd.next != newNd;
reads mySeq, sumAllFtprint(mySeq), newNd, getFtprint(newNd);
ensures seqInv([newNd]+mySeq);
{
true
}
*/

predicate seqInvLemma(mySeq:seq<INode>)
requires seqInv(mySeq);
reads mySeq;
ensures seqInvLemma(mySeq);
ensures forall i :: 0 <= i < |mySeq| ==> 
	seqInv(mySeq[i..]);
{mySeq == [] ||
seqInvLemma(mySeq[1..])
}




predicate seqFtprintLemma(mySeq: seq<INode>)
requires mySeq != [] && null !in mySeq;
requires forall nd :: nd in mySeq ==> nd.Valid();
requires forall i :: 0 <= i < |mySeq|-1 ==> mySeq[i].next == mySeq[i+1];
requires mySeq[|mySeq|-1].next == null;
reads mySeq, sumAllFtprint(mySeq);
ensures seqFtprintLemma(mySeq);
ensures mySeq[0].footprint == (set nd | nd in mySeq);
ensures forall nd :: nd in mySeq ==> nd.footprint <= mySeq[0].footprint;
ensures forall nd :: nd in mySeq[1..] ==> nd.footprint < mySeq[0].footprint;
{
if |mySeq| == 1 then true
else (
mySeq[0].footprint == {mySeq[0]} + mySeq[1].footprint &&
seqFtprintLemma(mySeq[1..]))
}

predicate seqV(mySeq: seq<INode>)
requires goodSeqCond(mySeq);
requires mySeq != [] ==> mySeq[0].perfect();

reads mySeq, sumAllFtprint(mySeq);
ensures seqV(mySeq);
ensures goodSeqCond(mySeq);
ensures forall nd :: nd in mySeq ==> nd.perfect(); 
{
mySeq == [] ||
(seqV(mySeq[1..]))
}


predicate allNdValid2GoodSeqCond(mySeq: seq<INode>)
requires seqInv(mySeq);
requires forall nd :: nd in mySeq ==> nd.Valid();
requires mySeq != [] ==> mySeq[|mySeq|-1].next == null;
reads mySeq, sumAllFtprint(mySeq);
ensures allNdValid2GoodSeqCond(mySeq);
ensures goodSeqCond(mySeq);
ensures validSeqCond(mySeq);
{
if mySeq == [] then true
else if |mySeq|==1 then mySeq[0].Valid() && mySeq[0].next == null
else 
mySeq[0].next == mySeq[1] && seqFtprintLemma(mySeq) &&
allNdValid2GoodSeqCond(mySeq[1..])
}


predicate goodSeqCond(mySeq: seq<INode>)
reads mySeq;
{
allDiff(mySeq) &&
(forall nd :: nd in mySeq ==> nd != null && nd in nd.footprint) &&
(forall i :: 0 <= i < |mySeq|-1 ==> mySeq[i].next == mySeq[i+1]
	&& (mySeq != [] ==> mySeq[|mySeq|-1].next !in mySeq)
	&& mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint) 
&&(forall i :: 0 <= i < |mySeq| ==> (set nd | nd in mySeq[0..i])					
				!! mySeq[i].footprint)
}

predicate validSeqCond(mySeq: seq<INode>)
reads mySeq;
{
goodSeqCond(mySeq) &&
(forall i, j :: 0 <= i < j < |mySeq| ==> 
	(mySeq[i].footprint > mySeq[j].footprint)) 
&& (forall nd :: nd in mySeq ==> 
    (nd.next == null <==> nd == mySeq[|mySeq|-1])
    && (nd.next != null <==> exists index :: 0 <= index < |mySeq|-1 
				&& nd == mySeq[index]))
}


//===============================================
predicate nxtPerfectLemma(node:INode) 
requires node != null && node.next != null;
requires node.Valid();
requires seqInv(node.spine);
requires node.next.perfect();
requires {node} !! sumAllFtprint(node.next.spine);
requires forall nd :: nd in node.next.spine ==> nd.next != node;
requires (node.spine == [node] + node.next.spine);
reads *;
ensures node.perfect();
{
(set nd | nd in node.next.spine) == node.next.footprint
&& (node.footprint == {node} + node.next.footprint)
}

/*
ghost method updateCurIndex(mySeq:seq<INode>, index:int)
requires 0 <= index <= |mySeq| - 2;
requires seqInv(mySeq);
requires mySeq[|mySeq|-1].next == null;
requires mySeq[index+1].perfect(); 

requires forall i :: index < i < |mySeq|-1 ==> 
	(mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents)
 && (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint)
 && (mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine);

modifies mySeq;
ensures seqInv(mySeq);
ensures mySeq[|mySeq|-1].next == null;
ensures forall i :: index <= i < |mySeq|-1 ==> 
	(mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents)
 && (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint)
 && (mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine);

//ensures mySeq[index].perfect(); 
ensures mySeq[index].perfect2(); 
{
mySeq[index].tailContents := [mySeq[index+1].data] + mySeq[index+1].tailContents;

mySeq[index].footprint := {mySeq[index]} + mySeq[index+1].footprint;

mySeq[index].spine := [mySeq[index]] + mySeq[index+1].spine;

//assert (set nd | nd in mySeq[index+1].spine) == mySeq[index+1].footprint;

}


ghost method updateSeq(mySeq:seq<INode>)

requires mySeq != [];
requires seqInv(mySeq);
requires mySeq[|mySeq|-1].next == null;
requires mySeq[|mySeq|-1].perfect(); 

modifies mySeq;
ensures seqInv(mySeq);
ensures mySeq[|mySeq|-1].next == null;
ensures mySeq[|mySeq|-1].perfect(); 

ensures forall i :: 0 <= i < |mySeq|-1 ==> 
	(mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents)
 && (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint)
 && (mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine);

ensures forall nd :: nd in mySeq ==> nd.perfect(); 
ensures validSeqCond(mySeq);

ensures mySeq[0].footprint == (set nd | nd in mySeq);
ensures forall nd :: nd in mySeq ==> nd.footprint <= mySeq[0].footprint;
ensures forall nd :: nd in mySeq[1..] ==> nd.footprint < mySeq[0].footprint;
{
ghost var index := |mySeq| - 2;

while(index >= 0)
invariant -1 <= index <= |mySeq| - 2;

invariant forall i :: index < i < |mySeq|-1 ==> 
	(mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents)
 && (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint)
 && (mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine);

invariant seqInv(mySeq);
invariant mySeq[|mySeq|-1].next == null;
invariant mySeq[index+1].perfect(); 
{
updateCurIndex(mySeq, index);

index := index - 1;

assert forall i :: index < i < |mySeq|-1 ==> 
	(mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents)
 && (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint)
 && (mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine);

assert seqInv(mySeq);  
assert mySeq[|mySeq|-1].next == null;
}

assert seqV(mySeq);
assert allNdValid2GoodSeqCond(mySeq);
assert seqFtprintLemma(mySeq);
}
*/

}

