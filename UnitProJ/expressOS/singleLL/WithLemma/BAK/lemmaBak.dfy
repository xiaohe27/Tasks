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


predicate seqV(mySeq: seq<INode>)
reads *;
requires forall nd :: nd in mySeq ==> nd != null;
requires forall i :: 1 <= i < |mySeq| ==> mySeq[i-1].next == mySeq[i];
requires mySeq != [] ==> mySeq[0].Valid();

ensures seqV(mySeq);
ensures forall nd :: nd in mySeq ==> nd.Valid(); 
ensures forall i, j :: 0 <= i < j < |mySeq| ==> mySeq[j] in mySeq[i].footprint;
{
mySeq == [] ||
(seqV(mySeq[1..]))
}

predicate seqV2(mySeq: seq<INode>)
reads *;
requires forall nd :: nd in mySeq ==> nd != null;
requires forall i :: 1 <= i < |mySeq| ==> mySeq[i-1].next == mySeq[i];

ensures seqV2(mySeq);
ensures forall i, j :: 0 <= i < j < |mySeq| ==> 
		(mySeq[i].Valid() ==> mySeq[j].Valid()); 
{
mySeq == [] ||
forall i :: 0 <= i < |mySeq| ==> (mySeq[i].Valid() ==> seqV(mySeq[i..]))
}

predicate goodList(mySeq: seq<INode>)
reads *;
{
    if (|mySeq| == 0) then true
else if(|mySeq| == 1) then (mySeq[0] != null && mySeq[0].good())

else
 (mySeq[0] != null && mySeq[1] != null
 && mySeq[0] in mySeq[0].footprint
 && mySeq[0].next == mySeq[1]
 && mySeq[0].next in mySeq[0].footprint
 && mySeq[0] !in mySeq[1].footprint
 && mySeq[0].footprint == {mySeq[0]} + mySeq[1].footprint
 && mySeq[0].tailContents == [mySeq[1].data] + mySeq[1].tailContents
 && goodList(mySeq[1..]))
 
}


predicate validList(mySeq: seq<INode>)
reads mySeq;
{
    if (|mySeq| == 0) then true
else if(|mySeq| == 1) then (
    mySeq[0] != null
 && mySeq[0].next == null
 && mySeq[0].tailContents == []
 && mySeq[0].footprint == {mySeq[0]})
else
 (mySeq[0] != null && mySeq[1] != null
 && mySeq[0] in mySeq[0].footprint
 && mySeq[0].next == mySeq[1]
 && mySeq[0].next in mySeq[0].footprint
 && mySeq[0] !in mySeq[1].footprint
 && mySeq[0].footprint == {mySeq[0]} + mySeq[1].footprint
 && mySeq[0].tailContents == [mySeq[1].data] + mySeq[1].tailContents
 && validList(mySeq[1..]))
 
}


predicate validListLemma(mySeq: seq<INode>)
requires validList(mySeq);
reads *;
ensures validListLemma(mySeq);
ensures forall nd :: nd in mySeq ==> nd != null && nd.Valid();
{
if(|mySeq| == 0) then true
else if (|mySeq| == 1) then mySeq[0].Valid()
else (mySeq[0].good() && validListLemma(mySeq[1..]))
}


predicate seqValid2GoodList(mySeq: seq<INode>)
reads *;
requires forall nd :: nd in mySeq ==> nd != null;
requires forall i :: 1 <= i < |mySeq| ==> mySeq[i-1].next == mySeq[i];
requires forall nd :: nd in mySeq ==> nd.Valid();
requires |mySeq| > 0 ==> mySeq[|mySeq|-1].next == null;

ensures seqValid2GoodList(mySeq);
ensures validList(mySeq);
{
mySeq == [] ||
 (mySeq[0].Valid() && seqValid2GoodList(mySeq[1..]))
}



predicate goodSeqCond(mySeq: seq<INode>)
reads *;
{
(forall nd :: nd in mySeq ==> nd != null && nd in nd.footprint) &&
(forall i :: 1 <= i < |mySeq| ==> mySeq[i-1].next == mySeq[i]) &&
(forall i :: 0 <= i < |mySeq| ==> (set nd | nd in mySeq[0..i])
					!! mySeq[i].footprint)
}

predicate validSeqCond(mySeq: seq<INode>)
reads *;
{
(forall nd :: nd in mySeq ==> nd != null && nd.Valid()) &&
(forall i :: 1 <= i < |mySeq| ==> mySeq[i-1].next == mySeq[i]) &&
(|mySeq| > 0 ==> mySeq[|mySeq|-1].next == null)
}


predicate validAfterIndex(mySeq: seq<INode>, index:int)
requires 0 <= index <= |mySeq|;
reads *;
{
goodSeqCond(mySeq) && (forall nd :: nd in mySeq[index..] ==> nd != null && nd.Valid())
}


predicate addNd2SeqEnd(mySeq: seq<INode>, nd:INode)
reads *;
requires goodSeqCond(mySeq);
requires nd != null && ((set node | node in mySeq) !! nd.footprint);
requires |mySeq| > 0 ==> (mySeq[|mySeq|-1].next == nd);
requires nd in nd.footprint;
ensures goodSeqCond(mySeq + [nd]);
{true}

method mkPrevValid(mySeq: seq<INode>, index:int)
requires 1 <= index < |mySeq|;
requires validAfterIndex(mySeq, index);
modifies mySeq;
ensures validAfterIndex(mySeq, index-1);
{
mySeq[index-1].tailContents := [mySeq[index].data] + mySeq[index].tailContents;
mySeq[index-1].footprint := {mySeq[index-1]} + mySeq[index].footprint;

assert mySeq[index-1].Valid();
}



predicate goodRelation(thisNd:INode, nextNd:INode,
			thisFp:set<INode>, thisTailCont:seq<Data>,
		nextData:Data, nextFp:set<INode>, nextTailCont:seq<Data>)
reads *;
{
thisNd in thisFp && nextNd in nextFp &&
thisNd !in nextFp && nextNd in thisFp &&
thisFp == {thisNd} + nextFp && thisTailCont == [nextData] + nextTailCont
}

predicate nodeNoChangeStillGood(
	oldThis:INode, oldNxt:INode,
	oldThisTailCont:seq<Data>,
	oldThisFp:set<INode>,
	oldNxtTailCont:seq<Data>,
	oldNxtFp:set<INode>,
	oldNxtData:Data,

	newThis:INode)

requires oldThis != null && oldNxt != null && oldThis.next == oldNxt;
requires goodRelation(oldThis, oldNxt, oldThisFp, oldThisTailCont,
	oldNxtData, oldNxtFp, oldNxtTailCont);

requires newThis != null && newThis.next != null;
requires oldThis == newThis && oldNxt == newThis.next;

requires newThis.next.data == oldNxtData;
requires newThis.next.tailContents == oldNxtTailCont;
requires newThis.next.footprint == oldNxtFp;

requires newThis.tailContents == oldThisTailCont;
requires newThis.footprint == oldThisFp;

reads *;
ensures newThis.good();
{true}


predicate validAfterIndex(mySeq: seq<INode>, index:int)
requires 0 <= index <= |mySeq|;
reads mySeq, sumAllFtprint(mySeq);
{
goodSeqCond(mySeq) && (forall nd :: nd in mySeq[index..] ==> nd != null && nd.Valid())
}

lemma goodValidLemma(mySeq: seq<INode>, index:int)
requires 0 <= index < |mySeq|;
requires goodSeqCond(mySeq);
requires forall i :: 0 <= i < index ==> mySeq[i].good();
requires mySeq[index].Valid();
ensures forall nd :: nd in mySeq ==> nd.Valid();
{
if (index == 0) {assert seqV(mySeq); }

else 
{
assert mySeq[index-1].Valid();
goodValidLemma(mySeq, index-1);
}
}

