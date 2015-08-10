class Data {}
class INode 
{
ghost var tailContents: seq<Data>;
ghost var footprint: set<INode>;

var data: Data;
var next: INode;

predicate acyclic()
reads *;
decreases footprint;
{
(next == null && footprint == {this}) ||
(
(next != null ==> ( this in footprint
  &&	this !in next.footprint 
  && (( next in footprint &&
	next.footprint + {this} == footprint && next.acyclic())
	|| next.Valid())
	))
&& (forall node :: node in footprint - {this} ==> this !in getFtprint(node))
)

}

function len():int
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
}

predicate ValidLemma()
requires Valid();
reads this, footprint;
ensures Valid();
ensures forall nd :: nd in footprint ==> nd != null && nd.footprint <= footprint;
ensures forall nd :: nd in footprint - {this} ==> this !in nd.footprint;
{
next != null ==> (next.ValidLemma())
}

predicate valid2Acyclic()
requires Valid();
reads this, footprint;
ensures acyclic();
{
ValidLemma()
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

method preAppend(d:Data) returns (node:INode)
requires Valid();
ensures node != null && node.Valid();
ensures node.data == d && node.next == this;
{
var r := new INode.init(d);
r.next := this;

r.footprint := r.footprint + this.footprint;
r.tailContents := [this.data] + this.tailContents;
return r;
}

method append(d:Data)
requires Valid();

modifies footprint;
decreases footprint;
ensures Valid();
ensures (tailContents == old(tailContents) + [d]);
ensures this.data == old(this.data);
ensures fresh(footprint - old(footprint));
{
var node := new INode.init(d);

if(next == null)
{
next := node;
this.tailContents := [d];
}

else
 {
next.append(d);
this.tailContents := [this.next.data] + this.next.tailContents;
}

this.footprint := {this} + next.footprint;

}

////////////////////////////////////////////////////////

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


function getSeq(nd:INode): seq<INode>
requires nd != null && nd.Valid();
reads nd, getFtprint(nd);
ensures forall node :: node in getSeq(nd) ==> node != null && node.Valid();
//ensures allNdValid2GoodSeqCond(getSeq(nd));
//ensures validSeqCond(getSeq(nd));
{
if nd.next == null then [nd] else [nd] + getSeq(nd.next)
}

}



