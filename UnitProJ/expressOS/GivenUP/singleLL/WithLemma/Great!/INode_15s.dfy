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
	(mySeq[j].footprint < mySeq[i].footprint)) 
&& (forall nd :: nd in mySeq ==> 
    (nd.next == null ==> nd == mySeq[|mySeq|-1])
    && (nd.next != null ==> exists index :: 0 <= index < |mySeq|-1 
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
}



class MyList 
{
  var head: INode;

  ghost var contents: seq<Data>;
  ghost var footprint: set<object>;
  ghost var spine: seq<INode>;


  function valid(): bool
reads this, footprint; 
{
this in footprint && (set nd:INode | nd in spine) <= footprint

&& validSeqCond(spine)

&& head != null && head in spine && head == spine[0]

&& head.footprint == (set nd | nd in spine)

&&(forall nd :: nd in spine ==> nd != null && nd.footprint <= footprint - {this}
	&& nd.Valid())

&& contents == head.tailContents 
}

method init()
modifies this;
ensures valid() && fresh(footprint - {this});
ensures |contents| == 0;
ensures spine == [head];
ensures head.next == null;
{
head := new INode.init(null);
contents := head.tailContents;

footprint := {this};
footprint := footprint + {head};
spine := [head];
}

//=============================================================================

method add2End(d:Data)
requires d != null;
requires valid();
requires head.next != null;

modifies footprint;

//ensures valid();
//ensures fresh(footprint - old(footprint));
//ensures contents == old(contents) + [d];
{
var newNd := new INode.init(d);
assert newNd.footprint !! head.footprint;

var curNd := head;

while(curNd.next != null)
decreases curNd.footprint;
invariant curNd != null && curNd.Valid();
invariant valid();
{
curNd := curNd.next;
}

assert head == spine[0];
assert forall nd :: nd in spine ==> nd != newNd;

curNd.next := newNd;

assert newNd.next == null && newNd.Valid(); 
assert head == spine[0];

spine := spine + [newNd];

assert spine != [];
assert seqInv(spine); 
assert spine[|spine|-1].next == null;
assert spine[|spine|-1].Valid(); //17s
assert head == spine[0];

updateSeq(spine); //18s

assert head == spine[0];

//assert head in spine; //20s

//assert head.footprint == old(head.footprint) + {newNd};

contents := head.tailContents; 

footprint := footprint + {newNd};

}

}
