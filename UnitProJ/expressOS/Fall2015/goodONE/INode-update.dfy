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
&& (next != null ==> next.Valid())
}


predicate ValidLemma()
requires Valid();
reads this, footprint;
ensures ValidLemma();
ensures (forall nd :: nd in spine ==> nd in footprint);
ensures |tailContents| == |footprint|-1 == |spine|-1;
ensures forall nd :: nd in spine ==> nd != null && nd.Valid();
ensures forall nd :: nd in footprint ==> nd != null && nd.Valid();
{
if next == null then (spine == [this])
else (
spine == [this] + next.spine 
&& next.ValidLemma())
}

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

///////////////////////////////////

method update(pos:int, d:Data)
requires 0 <= pos <= |tailContents|;
requires Valid();
modifies footprint;

ensures Valid();

ensures ([data] + tailContents) == old(([data] + tailContents)[0..pos]) + [d] +
	                                                          old(([data] + tailContents)[pos+1..]);

ensures footprint == old(footprint);

{
	
	var index := 0;
	var curNd := this;

assert ndValid2ListValidLemma();
assert ValidLemma();

ghost var oldContents := ndSeq2DataSeq(spine);

assert spineTCLemma();

while(index < pos)
invariant 0 <= index <= pos;
invariant curNd != null && curNd.Valid();
invariant |curNd.spine| + index == |spine|;
invariant curNd == spine[index];
invariant Valid();
invariant validSeqCond(spine);

invariant  oldContents == old([data] + tailContents);
{	
index := index + 1;	
curNd := curNd.next;
}

//update curNd's data
	curNd.data := d;


ghost var updatedSpineDataList := ndSeq2DataSeq(spine);

updateSeq4UpdateOp(spine, d, pos, updatedSpineDataList);

assert spineTCLemma();

dataSeqCmp([data] + tailContents, old([data]+tailContents), pos, d);
}

predicate ndValid2ListValidLemma()
requires Valid();
reads this, footprint;

ensures ndValid2ListValidLemma();
ensures forall nd :: nd in spine ==> nd in footprint;
ensures forall nd :: nd in footprint ==> nd != null && nd.footprint <= footprint;

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



predicate spineFtprintLemma()
requires Valid();
reads this, footprint;

ensures spineFtprintLemma();
ensures forall nd :: nd in spine ==> nd in footprint;

ensures (set nd | nd in spine) == footprint;
{
if next == null then (spine == [this] && footprint == {this})
else (
spine == [this] + next.spine 
&& footprint == {this} + next.footprint
&& next.spineFtprintLemma())
}


predicate spineTCLemma()
	requires Valid();
	reads this, footprint;
	ensures spineTCLemma();
	ensures |spine| == |tailContents| + 1;
	ensures null !in spine;
     ensures spine[0].data == this.data &&
		forall i :: 0 < i < |spine| ==> spine[i].data == this.tailContents[i-1];
{
	if next == null then true
	else spine == [this] + next.spine && tailContents == [next.data] + next.tailContents
		&& next.spineTCLemma()
}


lemma dataSeqCmp(newSeq:seq<Data>, oldSeq:seq<Data>, pos:int, d:Data)
	requires |newSeq| == |oldSeq|;
	requires 0 <= pos < |newSeq|;
	requires forall i :: 0 <= i < |newSeq| && i != pos ==> newSeq[i] == oldSeq[i];
	requires newSeq[pos] == d;

	ensures  |newSeq| == |oldSeq|;
	ensures newSeq == oldSeq[0..pos] + [d] + oldSeq[pos+1..];
{
}


//////////////////////////////////
//good
//////////////////////////////////////////////////////////////////
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



ghost method updateSeq4UpdateOp(mySeq:seq<INode>, d:Data, pos:int, newContents:seq<Data>)
requires 
listInv(mySeq)
&& 0 <= pos < |mySeq|
  && mySeq[pos].data == d;

requires mySeq[pos].Valid();

requires |mySeq| == |newContents|;
requires forall i :: 0 <= i < |mySeq| ==> mySeq[i].data == newContents[i];

requires forall i :: 0 <= i < |mySeq|-1 ==> (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
 && mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine);

modifies mySeq;
ensures mySeq == old(mySeq);

ensures forall nd :: nd in mySeq ==> nd.spine == old(nd.spine);

ensures  forall i :: 0 <= i < |mySeq| ==> mySeq[i].data == newContents[i] == old(mySeq[i].data);

ensures newContents == old(newContents);
ensures  |mySeq| == |newContents|;

ensures mySeq[0].Valid();
ensures mySeq[0].footprint == old(mySeq[0].footprint);

{
	ghost var index := pos;
	
while index >= 1
  invariant 0 <= index <= pos;
	invariant mySeq == old(mySeq);
	invariant listInv(mySeq);

	invariant forall nd :: nd in mySeq ==> nd.footprint == old(nd.footprint)
		&& nd.data == old(nd.data) && nd.spine == old(nd.spine);

	invariant forall i :: 0 <= i < |mySeq|-1 ==> (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
 && mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine);

	invariant mySeq[index].Valid();
{
mySeq[index-1].tailContents := [mySeq[index].data] + mySeq[index].tailContents;
index := index - 1;
}

}

}

