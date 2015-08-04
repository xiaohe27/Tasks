class Data {}
class INode 
{
ghost var tailContents: seq<Data>;
ghost var footprint: set<INode>;

var data: Data;
var next: INode;

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

}


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


/*
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


lemma allValidLemma(myNode:INode)
requires myNode != null && myNode.Valid();
requires myNode.next != null ==> myNode.next.Valid();
decreases myNode.footprint;
ensures forall nd :: nd in myNode.footprint ==> nd != null && nd.Valid();
{
assert allV(myNode);
}
*/

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
requires mySeq != [] ==> mySeq[0].Valid();

reads mySeq, sumAllFtprint(mySeq);
ensures seqV(mySeq);
ensures goodSeqCond(mySeq);
ensures forall nd :: nd in mySeq ==> nd.Valid(); 
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
(forall i :: 0 <= i < |mySeq|-1 ==> mySeq[i].next == mySeq[i+1]) &&
(mySeq != [] ==> mySeq[|mySeq|-1].next !in mySeq) &&
(forall i :: 0 <= i < |mySeq| ==> (set nd | nd in mySeq[0..i])					
				!! mySeq[i].footprint)
}

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

/////////////////////////////////////////////////////////////////
/*
ghost method updateCurIndex(mySeq:seq<INode>, index:int)
requires 0 <= index <= |mySeq| - 2;
requires seqInv(mySeq);
requires mySeq[|mySeq|-1].next == null;
requires mySeq[index+1].Valid();

requires forall i :: index < i < |mySeq|-1 ==> 
	(mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents)
 && (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint);

modifies mySeq;
ensures seqInv(mySeq);
ensures mySeq[|mySeq|-1].next == null;
ensures forall i :: index <= i < |mySeq|-1 ==> 
	(mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents)
 && (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint);
ensures mySeq[index].Valid();
{
mySeq[index].tailContents := [mySeq[index+1].data] + mySeq[index+1].tailContents;

mySeq[index].footprint := {mySeq[index]} + mySeq[index+1].footprint;
}

//********************************
//===simulate the loop==
//*******************************
ghost method updateSeq(mySeq:seq<INode>)

requires mySeq != [];
requires seqInv(mySeq);
requires mySeq[|mySeq|-1].next == null;
requires mySeq[|mySeq|-1].Valid();

modifies mySeq;
ensures seqInv(mySeq);
ensures mySeq[|mySeq|-1].next == null;
requires mySeq[|mySeq|-1].Valid();

ensures forall i :: 0 <= i < |mySeq|-1 ==> 
	(mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents)
 && (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint);

ensures forall nd :: nd in mySeq ==> nd.Valid();
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
 && (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint);

invariant seqInv(mySeq);
invariant mySeq[|mySeq|-1].next == null;
invariant mySeq[index+1].Valid();
{
updateCurIndex(mySeq, index);

index := index - 1;

assert forall i :: index < i < |mySeq|-1 ==> 
	(mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents)
 && (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint);

assert seqInv(mySeq);  
assert mySeq[|mySeq|-1].next == null;
}

assert seqV(mySeq);
assert allNdValid2GoodSeqCond(mySeq);
assert seqFtprintLemma(mySeq);
}
*/

lemma setLE(a:set<INode>, b:set<INode>,
	newA:set<INode>, newB:set<INode>, nd:INode)
requires a <= b;
requires newA == a + {nd} && newB == b + {nd};
ensures newA <= newB;
{}


function ndSeq2DataSeq(mySeq:seq<INode>) : seq<Data>
requires null !in mySeq;
reads mySeq;
ensures |mySeq| == |ndSeq2DataSeq(mySeq)|;
ensures forall i :: 0 <= i < |mySeq| ==> 
	ndSeq2DataSeq(mySeq)[i] == mySeq[i].data;
{
if mySeq == [] then []
else [mySeq[0].data] + ndSeq2DataSeq(mySeq[1..])
}


predicate contentOK(oldContent:seq<Data>, oldSpine:seq<INode>,
			newContent:seq<Data>, newSpine:seq<INode>,
			newNd:INode, d:Data)
requires null !in oldSpine && oldSpine != [];
requires oldContent == ndSeq2DataSeq(oldSpine);
requires newContent == oldContent + [d];
requires newNd != null;
requires newSpine == oldSpine + [newNd] && newNd.data == d;
reads *;
ensures newContent == ndSeq2DataSeq(newSpine);
{true}





class MyList 
{
  var spine: seq<INode>;

  ghost var contents: seq<Data>;
  ghost var footprint: set<object>;
  
  function valid(): bool
reads this, spine, footprint; 
{
this in footprint

&& sumAllFtprint(spine) <= footprint - {this}

&& validSeqCond(spine)

&&(forall nd :: nd in spine ==> nd != null && nd.footprint <= footprint - {this}
	&& nd.Valid())

&& contents == ndSeq2DataSeq(spine) 
}

method init()
modifies this;
ensures valid() && fresh(footprint - {this});
ensures |contents| == 0;
ensures spine == [];
{
contents := [];
footprint := {this};
spine := [];
}

//=============================================================================
lemma ftprintInclusionLemma()
requires null !in spine && spine != [];
requires forall nd :: nd in spine ==> nd.footprint <= spine[0].footprint;
requires spine[0].footprint <= footprint;
ensures forall nd :: nd in spine ==> nd.footprint <= footprint - {this};
{}

//=============================================================================

method add2End(d:Data)
requires d != null;
requires spine != [];
requires valid();

modifies footprint;

ensures valid();
ensures fresh(footprint - old(footprint));
ensures contents == old(contents) + [d];
{
var newEnd := new INode.init(d);
assert newEnd.footprint !! footprint;

spine[|spine|-1].next = newEnd;
spine := spine + [newEnd];
assert seqInv(spine);

updateSeq(spine);

contents := contents + [d];

footprint := footprint + {newEnd};

}



//16s
method add2Front(d:Data)
requires valid();
requires d != null;

modifies footprint;

ensures valid();
ensures contents == [d] + old(contents);
ensures fresh(footprint - old(footprint));
{
var newHead := new INode.init(d);
assert newHead.footprint !! footprint;

if(spine != []) {
newHead.next := spine[0];

newHead.tailContents := [spine[0].data] + spine[0].tailContents;
newHead.footprint := {newHead} + spine[0].footprint;

assert newHead.Valid();
}

spine := [newHead] + spine;

assert stillSeqInv(old(spine), newHead);
assert seqInv(spine);
assert forall nd :: nd in spine ==> nd.Valid();

assert allNdValid2GoodSeqCond(spine);

contents := [d] + contents;
footprint := footprint + {newHead};
assert contents == ndSeq2DataSeq(spine);
assert sumAllFtprint(spine) <= footprint - {this};
}


}
