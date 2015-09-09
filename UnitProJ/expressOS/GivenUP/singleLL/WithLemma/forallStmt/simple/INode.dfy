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
if mySeq == [] then {} else getFtprint(mySeq[0]) + 
			sumAllFtprint(mySeq[1..])
}

/*
predicate notInSeqFp(mySeq: seq<INode>, node: INode)
requires mySeq != [] ;
requires goodSeqCond(mySeq);
requires node !in mySeq && (node !in mySeq[|mySeq|-1].footprint);

decreases |mySeq|;
reads *;
ensures notInSeqFp(mySeq, node);
ensures forall nd :: nd in mySeq ==> node !in nd.footprint;
{
if |mySeq| == 1  then true
else (mySeq[|mySeq|-2].footprint == {mySeq[|mySeq|-2]} + mySeq[|mySeq|-1].footprint
    && node !in mySeq[|mySeq|-1].footprint
    && notInSeqFp(mySeq[0..|mySeq|-1], node))
}
*/

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


/*
lemma addNd2SeqEndLemma(mySeq: seq<INode>, nd:INode)
requires goodSeqCond(mySeq);
requires nd != null && ((set node | node in mySeq) !! nd.footprint);
requires nd in nd.footprint;
requires |mySeq| > 0 ==> (mySeq[|mySeq|-1].next == nd &&
	mySeq[|mySeq|-1].footprint == {mySeq[|mySeq|-1]} + nd.footprint);
ensures goodSeqCond(mySeq + [nd]);
{}
*/

predicate goodSeqCond(mySeq: seq<INode>)
reads mySeq, sumAllFtprint(mySeq);
{
(forall nd :: nd in mySeq ==> nd != null && nd in nd.footprint) &&
(forall i :: 1 <= i < |mySeq| ==> mySeq[i-1].next == mySeq[i] 
	&& mySeq[i-1].footprint == {mySeq[i-1]} + mySeq[i].footprint) 
&&(forall i :: 0 <= i < |mySeq| ==> (set nd | nd in mySeq[0..i])					
				!! mySeq[i].footprint)
}

predicate validSeqCond(mySeq: seq<INode>)
reads mySeq, sumAllFtprint(mySeq);
{
goodSeqCond(mySeq) &&
(forall i, j :: 0 <= i < j < |mySeq| ==> 
	(mySeq[j].footprint < mySeq[i].footprint)) 
&& (forall nd :: nd in mySeq ==> 
    (nd.next == null ==> nd == mySeq[|mySeq|-1])
    && (nd.next != null ==> exists index :: 0 <= index < |mySeq|-1 
				&& nd == mySeq[index]))
}

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

predicate goodRelation(thisNd:INode, nextNd:INode,
			thisFp:set<INode>, thisTailCont:seq<Data>,
		nextData:Data, nextFp:set<INode>, nextTailCont:seq<Data>)
reads *;
{
thisNd in thisFp && nextNd in nextFp &&
thisNd !in nextFp && nextNd in thisFp &&
thisFp == {thisNd} + nextFp && thisTailCont == [nextData] + nextTailCont
}


predicate nodeStillGood(
	oldThis:INode, oldNxt:INode,
	oldThisTailCont:seq<Data>,
	oldThisFp:set<INode>,
	oldNxtTailCont:seq<Data>,
	oldNxtFp:set<INode>,
	oldNxtData:Data,

	newThis:INode, newNxt:INode,
	newData:Data, newNd:INode)

requires oldThis != null && oldNxt != null && oldThis.next == oldNxt;
requires goodRelation(oldThis, oldNxt, oldThisFp, oldThisTailCont,
	oldNxtData, oldNxtFp, oldNxtTailCont);

requires newThis != null && newNxt != null;
requires newNxt.data == oldNxtData;
requires newThis.tailContents == oldThisTailCont + [newData];
requires newNxt.tailContents == oldNxtTailCont + [newData];

requires oldThis == newThis && oldNxt == newNxt;
requires newNd !in oldThisFp && newNd !in oldNxtFp;
requires newThis.footprint == oldThisFp + {newNd};
requires newNxt.footprint == oldNxtFp + {newNd};

reads *;
ensures newThis.tailContents == [newNxt.data] + newNxt.tailContents;
ensures newThis.footprint == {newThis} + newNxt.footprint;
ensures newThis.good();
{true}



//with this method, and all the predicates : 31s

ghost method mkSpineValid(mySeq: seq<INode>, newNd:INode) returns (newSpine:seq<INode>)
requires mySeq != [];
requires goodSeqCond(mySeq);
requires forall nd :: nd in mySeq[0..|mySeq|-1] ==> nd.good();
requires forall nd :: nd in mySeq ==> nd.next != null;
requires newNd != null && newNd.next == null 
    && newNd.Valid() && forall nd :: nd in mySeq ==>
		newNd.footprint !! nd.footprint;

requires mySeq[|mySeq|-1].next == newNd &&
         mySeq[|mySeq|-1].tailContents == [] &&
	 mySeq[|mySeq|-1].footprint == {mySeq[|mySeq|-1]};

modifies sumAllFtprint(mySeq);
ensures goodSeqCond(mySeq);
ensures newSpine == mySeq + [newNd];
ensures forall nd :: nd in newSpine ==> nd != null && nd.Valid();
{

forall (node | node in mySeq)
{
node.tailContents := node.tailContents + [newNd.data];
}

assert forall i :: 0 <= i < |mySeq|-1 ==> 
	mySeq[i].next == mySeq[i+1];

forall (node | node in mySeq)
{
node.footprint := node.footprint + {newNd};
}

assert forall node :: node in mySeq[0..|mySeq|-1] ==>
nodeStillGood(
	old(node), old(node.next),
	old(node.tailContents),
	old(node.footprint),
	old(node.next.tailContents),
	old(node.next.footprint),
	old(node.next.data),

	node, node.next,
	newNd.data, newNd);

assert forall nd :: nd in mySeq[0..|mySeq|-1] ==> nd.good();

assert mySeq[|mySeq|-1].next == newNd &&
         mySeq[|mySeq|-1].tailContents == [newNd.data] &&
	 mySeq[|mySeq|-1].footprint == {mySeq[|mySeq|-1], newNd};

assert mySeq[|mySeq|-1].Valid();
goodValidLemma(mySeq, |mySeq|-1);

newSpine := mySeq + [newNd];
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




class MyList 
{
  var head: INode;

  ghost var contents: seq<Data>;
  ghost var footprint: set<object>;
  ghost var spine: seq<INode>;


  function valid(): bool
reads this, footprint; 
{
this in footprint && (set nd | nd in spine) <= footprint

&& sumAllFtprint(spine) <= footprint
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

curNd.next := newNd;

assert newNd.footprint == {newNd};

forall (node | node in spine)
{
node.tailContents := node.tailContents + [newNd.data];
}

forall (node | node in spine)
{
node.footprint := node.footprint + {newNd};
}

assert head.Valid();

}

}
