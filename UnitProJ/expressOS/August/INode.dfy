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
&& (next != null ==> next.Valid())
}

predicate ValidLemma()
requires Valid();
reads this, footprint;
ensures ValidLemma();
ensures |tailContents| == |footprint|-1 == |spine|-1;

ensures forall nd :: nd in spine ==> nd != null && nd.Valid();

ensures (forall i :: 1 <= i < |spine| ==> spine[i].data == tailContents[i-1]);
//ensures ndSeq2DataSeq(spine) == [data] + tailContents;
{
(next == null) ||
(next.ValidLemma())
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
method append(d:Data) returns (lastNd:INode)
requires Valid();

modifies footprint;
//ensures Valid();
//ensures fresh(lastNd);
//ensures lastNd != null && lastNd.Valid();
//ensures spine == old(spine) + [lastNd];
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

ghost var mySeq := spine + [node];



/*
assert mySeq[|mySeq|-2].footprint == {mySeq[|mySeq|-2]};

assert listCond(mySeq[0..|mySeq|-1]);

forall (nd | nd in spine)
{
nd.footprint := nd.footprint + {node};
}

assert listCond(mySeq[0..|mySeq|-1]);

assert mySeq[|mySeq|-2].footprint == 
{mySeq[|mySeq|-2]} + mySeq[|mySeq|-1].footprint;


forall (nd | nd in spine)
{
nd.tailContents := nd.tailContents + [d];
}

assert listCond(mySeq[0..|mySeq|-1]);

updateSeq(mySeq, |mySeq|-1);

assert seqV(mySeq);

assert spineFtprintLemma();
assert ValidLemma();
*/

return node;

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


/*************************************/
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



predicate allDiff(mySeq:seq<INode>)
reads mySeq;
{
forall index :: 0 <= index < |mySeq| ==> 
	(forall other :: 0 <= other < |mySeq| && other != index ==>
	 (mySeq[other] != mySeq[index]))
}


function ndSeq2DataSeq(mySeq:seq<INode>) : seq<Data>
requires listCond(mySeq);
reads mySeq;
ensures |mySeq| == |ndSeq2DataSeq(mySeq)|;
ensures forall i :: 0 <= i < |mySeq| ==> 
	ndSeq2DataSeq(mySeq)[i] == mySeq[i].data;
{
if mySeq == [] then []
else [mySeq[0].data] + ndSeq2DataSeq(mySeq[1..])
}


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


predicate validSeqLemma2(mySeq: seq<INode>)
requires mySeq != [];

requires validSeqCond(mySeq);
reads mySeq, (set nd | nd in mySeq);
ensures validSeqLemma2(mySeq);
ensures mySeq[0].spine == mySeq;
ensures validSeqCond(mySeq[0].spine);
{
if |mySeq| == 1 then true
else mySeq[0].spine == [mySeq[0]] + mySeq[1].spine
	&& validSeqLemma2(mySeq[1..])
}


predicate validSeqFtprintInclusionLemma(mySeq: seq<INode>)
requires mySeq != [];

requires validSeqCond(mySeq);
reads mySeq, (set nd | nd in mySeq);
ensures validSeqFtprintInclusionLemma(mySeq);
ensures forall nd :: nd in mySeq ==> nd in mySeq[0].footprint;
{
if |mySeq| == 1 then true
else 
	{mySeq[0]} + mySeq[1].footprint == mySeq[0].footprint &&
	
	validSeqFtprintInclusionLemma(mySeq[1..])
}


predicate validSeqGoodLemma(mySeq: seq<INode>)
requires mySeq != [];

requires validSeqCond(mySeq);
reads mySeq, (set nd | nd in mySeq);
ensures mySeq[0].good();
{
if |mySeq| == 1 then true
else 
 mySeq[0].next == mySeq[1] &&
 mySeq[0] in mySeq[0].footprint &&
 mySeq[0] !in mySeq[1].footprint &&
 mySeq[1] in mySeq[0].footprint &&
 mySeq[0].spine == [mySeq[0]] + mySeq[1].spine &&
 mySeq[0].tailContents == [mySeq[1].data] + mySeq[1].tailContents
}



predicate validSeqLemma(mySeq: seq<INode>)
requires mySeq != [];

requires validSeqCond(mySeq);
reads mySeq, (set nd | nd in mySeq);
ensures validSeqLemma(mySeq);
ensures mySeq[0].Valid();
{
if(|mySeq| == 1) then true
else    
	validSeqGoodLemma(mySeq) &&
    validSeqLemma2(mySeq) &&
    validSeqFtprintInclusionLemma(mySeq) &&
    validSeqLemma(mySeq[1..])
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

requires mySeq[index+1].spine == mySeq[index+1..];

requires validSeqCond(mySeq[index+1..]);

requires mySeq[index].footprint + {newNd} == 
	{mySeq[index]} + mySeq[index+1].footprint;

requires mySeq[index].spine + [newNd] == 
	[mySeq[index]] + mySeq[index+1].spine;

requires mySeq[index].tailContents + [d] == 
	[mySeq[index+1].data] + mySeq[index+1].tailContents;

modifies mySeq[index];

ensures listInv(mySeq);

ensures forall i :: 0 <= i < index-1 ==>
	   mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
	&& mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents
	&& mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine;


ensures mySeq[index].spine == mySeq[index..];

ensures validSeqCond(mySeq[index..]);

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
{
mySeq[index].tailContents := [mySeq[index+1].data] + mySeq[index+1].tailContents;

mySeq[index].footprint := mySeq[index].footprint + {newNd};

mySeq[index].spine := mySeq[index].spine + [newNd];
}


/*
ghost method updateSeq(mySeq:seq<INode>, d:Data, newNd:INode)
requires |mySeq| == 3;
//requires |mySeq| > 1;
requires listInv(mySeq);

requires forall i :: 0 <= i < |mySeq|-2 ==>
	   mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
	&& mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents
	&& mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine;


requires mySeq[|mySeq|-1].spine == mySeq[|mySeq|-1..];
requires validSeqCond(mySeq[|mySeq|-1..]);
	
requires mySeq[|mySeq|-2].footprint + {newNd} == 
	{mySeq[|mySeq|-2]} + mySeq[|mySeq|-1].footprint;

requires mySeq[|mySeq|-2].spine + [newNd] == 
	[mySeq[|mySeq|-2]] + mySeq[|mySeq|-1].spine;

requires mySeq[|mySeq|-2].tailContents + [d] == 
	[mySeq[|mySeq|-1].data] + mySeq[|mySeq|-1].tailContents;


modifies mySeq;

ensures mySeq[0].footprint == old(mySeq[0].footprint) + {newNd};
ensures mySeq[0].spine == old(mySeq[0].spine) + [newNd];
ensures mySeq[0].tailContents == 
	old(mySeq[0].tailContents) + [d];

ensures validSeqCond(mySeq);
ensures mySeq[0].Valid();
{

ghost var index := |mySeq|-2;

while(index >= 0)
invariant -1 <= index <= |mySeq|-2;

invariant listInv(mySeq);
invariant forall i :: 0 <= i < index ==>
	   mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
	&& mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents
	&& mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine;

invariant mySeq[index+1].spine == mySeq[index+1..];

invariant validSeqCond(mySeq[index+1..]);

invariant index >= 0 ==> mySeq[index].footprint + {newNd} == 
	{mySeq[index]} + mySeq[index+1].footprint;

invariant index >= 0 ==> mySeq[index].spine + [newNd] == 
	[mySeq[index]] + mySeq[index+1].spine;

invariant index >= 0 ==> mySeq[index].tailContents + [d] == 
	[mySeq[index+1].data] + mySeq[index+1].tailContents;


invariant -1 <= index < |mySeq|-2 ==> (
 mySeq[index+1].footprint == old(mySeq[index+1].footprint) + {newNd} &&
 mySeq[index+1].spine == old(mySeq[index+1].spine) + [newNd] &&
 mySeq[index+1].tailContents == 
	old(mySeq[index+1].tailContents) + [d]);

{
updateCurIndex(mySeq, index, d, newNd);

index := index - 1;
}

assert validSeqLemma(mySeq);

}
*/

}