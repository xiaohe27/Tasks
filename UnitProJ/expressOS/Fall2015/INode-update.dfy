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
/*
ensures pos == 0 ==> (data == d && tailContents == old(tailContents));

ensures pos > 0 ==> (this.data == old(this.data)
&& tailContents == old(tailContents[0..pos-1]) + [d] +
old(tailContents[pos..]));
*/
//ensures footprint == old(footprint);

{
	
	var index := 0;
	var curNd := this;

assert ndValid2ListValidLemma();
assert ValidLemma();

ghost var oldContents := ndSeq2DataSeq(spine);

while(index < pos)
invariant 0 <= index <= pos;
invariant 0 <= index < |spine| ==> curNd != null && curNd.Valid();
invariant curNd != null ==> |curNd.spine| + index == |spine|;
invariant 0 <= index <= pos ==> curNd == spine[index];
invariant validSeqCond(spine);
{	
index := index + 1;	
curNd := curNd.next;
}


//method that performs curNd.data := d;
//curNd.data := d;


updateData(d, pos, curNd);

ghost var updatedSpineDataList := ndSeq2DataSeq(spine);
dataSeqCmp(updatedSpineDataList, oldContents, pos, d);

//updateSeq4UpdateOp(spine, d, pos, updatedSpineDataList, oldContents[1..]);

}


////////////////////////////////////////////////////////////////////
method updateData(d:Data, index:int, tarNd:INode)
	                    
	requires Valid();
	requires validSeqCond(spine);
	requires 0 <= index < |spine|;
	requires spine[index] == tarNd;
	requires tarNd.Valid();

	modifies spine[index];
	ensures tarNd.Valid();
	ensures listInv(spine);

	ensures spine == old(spine);
	ensures forall i :: 0 <= i < |spine| && i != index ==> spine[i].data == old(spine[i].data);
	
	ensures tarNd.data == d;
	ensures tarNd.next == old(tarNd.next);
	ensures tarNd.tailContents == old(tarNd.tailContents);
	ensures tarNd.footprint == old(tarNd.footprint);
	ensures tarNd.spine == old(tarNd.spine);
	ensures spine[index] == tarNd;

	ensures forall i :: 0 <= i < |spine| && i != index ==> ndSeq2DataSeq(spine)[i] == old(ndSeq2DataSeq(spine)[i]);
	ensures ndSeq2DataSeq(spine)[index] == d;
{
	tarNd.data := d;
}

lemma dataSeqCmp(newSeq:seq<Data>, oldSeq:seq<Data>, pos:int, d:Data)
	requires |newSeq| == |oldSeq|;
	requires 0 <= pos < |newSeq|;
	requires forall i :: 0 <= i < |newSeq| && i != pos ==> newSeq[i] == oldSeq[i];
	requires newSeq[pos] == d;
	ensures newSeq == oldSeq[0..pos] + [d] + oldSeq[pos+1..];
//	ensures 0 < pos < |newSeq| ==>  newSeq == [oldSeq[0]] + oldSeq[1..pos] + [d] + oldSeq[pos+1..];
{}


//////////////////////////////////
ghost method updateSeq4UpdateOp(mySeq:seq<INode>, d:Data, pos:int, newContents:seq<Data>,
	oldTC:seq<Data>)
requires 
listInv(mySeq)
&& 0 <= pos < |mySeq|
  && mySeq[pos].data == d;

requires mySeq[pos].Valid();

requires |mySeq| == |newContents| == |oldTC| + 1;
requires forall i :: 0 <= i < |mySeq| ==> mySeq[i].data == newContents[i];
requires [mySeq[pos].data] + mySeq[pos].tailContents == newContents[pos..];

requires forall i :: 0 <= i < |mySeq|-1 ==> (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
 && mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine);

requires pos == 0 ==> newContents == [d] + oldTC;
requires 0 < pos < |mySeq| ==>  newContents == [mySeq[0].data] + oldTC[0..pos-1] + [d] + oldTC[pos..];
 
modifies mySeq;

ensures mySeq[0].Valid();
ensures mySeq[0].footprint == old(mySeq[0].footprint);

ensures pos == 0 ==> mySeq[0].data == d && mySeq[0].tailContents == oldTC;
ensures 0 < pos < |mySeq| ==> (mySeq[0].data == old(mySeq[0].data)
	&& mySeq[0].tailContents == oldTC[0..pos-1] + [d] + oldTC[pos..]);
{
	ghost var index := pos;
	
while index >= 1
  invariant 0 <= index <= pos;
	invariant mySeq == old(mySeq);
	invariant listInv(mySeq);

	invariant forall nd :: nd in mySeq ==> nd.footprint == old(nd.footprint);

	invariant forall i :: 0 <= i < |mySeq|-1 ==> (mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
 && mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine);

 invariant  forall i :: 0 <= i < |mySeq| ==> mySeq[i].data == newContents[i];
 invariant [mySeq[index].data] + mySeq[index].tailContents == newContents[index..];
 invariant  0 < pos < |mySeq| ==>  newContents == [mySeq[0].data] + oldTC[0..pos-1] + [d] + oldTC[pos..];
	invariant mySeq[index].Valid();
{
mySeq[index-1].tailContents := [mySeq[index].data] + mySeq[index].tailContents;
index := index - 1;
}

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
	ensures ndSeq2DataSeq(this.spine) == [this.data] + tailContents;
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
predicate validSeqLemma(mySeq: seq<INode>)
	requires validSeqCond(mySeq);
	reads mySeq;
	ensures validSeqLemma(mySeq);
	ensures mySeq != [] ==> (mySeq[0].spine == mySeq);
{
	if |mySeq| <= 1 then true
		else validSeqLemma(mySeq[1..])
}

}

