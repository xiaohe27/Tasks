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


method update(pos:int, d:Data)
requires 0 <= pos <= |tailContents|;
requires Valid();
modifies footprint;
ensures Valid();

ensures pos == 0 ==> (data == d && tailContents == old(tailContents));

/*
ensures pos > 0 ==> (this.data == old(this.data)
&& tailContents == old(tailContents[0..pos-1]) + [d] +
old(tailContents[pos..]));
 */

ensures footprint == old(footprint);

{
	var index := 0;
	var curNd := this;

assert ndValid2ListValidLemma();
assert ValidLemma();


while(index < pos)
invariant 0 <= index <= pos;
invariant 0 <= index < |spine| ==> curNd != null && curNd.Valid();
invariant curNd != null ==> |curNd.spine| + index == |spine|;
invariant 0 <= index <= pos ==> curNd == spine[index];
invariant listCond(spine);
{	
index := index + 1;	
curNd := curNd.next;
}

listCondLemma(spine);

//
curNd.data := d;

while index >= 1
  invariant 0 <= index <= pos;
	invariant spine == old(spine);
	invariant listInv(spine);
	invariant forall nd :: nd in spine ==> nd.footprint == old(nd.footprint) &&
		nd.spine == old(nd.spine);
	invariant forall i :: 0 <= i < |spine| ==> spine[i].next == old(spine[i].next);
	invariant forall i :: 0 <= i < |spine| && i != pos ==> spine[i].data == old(spine[i].data);
  invariant spine[pos].data == d;

	
	invariant forall i :: pos <= i < |spine|  ==> spine[i].tailContents == old(spine[i].tailContents);

	invariant forall i :: 0 <= i < index ==> spine[i].tailContents == old(spine[i].tailContents);

		invariant spine[index].Valid();

		invariant 0 <= index-1 ==> |spine[index-1].tailContents| >= pos - index + 1 &&
			(spine[index-1].tailContents[0..pos-index] + [d] +
			spine[index-1].tailContents[pos-index+1..] == [spine[index].data] + spine[index].tailContents);
	
	invariant 0 <= index < pos ==>
  (|spine[index].tailContents| >= pos - index &&
		spine[index].tailContents == old(spine[index].tailContents[0..pos-index-1]) +
		                                                     [d] + old(spine[index].tailContents[pos-index..]));
		


{
spine[index-1].tailContents := [spine[index].data] + spine[index].tailContents;
	
index := index - 1;

assert spine[index].ValidLemma();
}

//assert spine[0].spineTCLemma();

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

lemma listCondLemma(mySeq: seq<INode>)
requires listCond(mySeq);
ensures forall i :: 0 <= i <= |mySeq| ==> listCond(mySeq[0..i]);
{}

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

}

