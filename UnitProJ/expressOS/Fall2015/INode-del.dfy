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


/////////////////////////////////////////
method delete(pos:int) returns (delNd:INode)
requires Valid();
requires 0 < pos <= |tailContents|;

modifies footprint;

/*
ensures Valid();
ensures delNd in old(footprint);
ensures [data] + tailContents == old(([data] + tailContents)[0..pos] + ([data] + tailContents)[pos+1..] );
ensures footprint == old(footprint) - {delNd};
*/
{
var curNd := this;
var curIndex := 0;

assert ValidLemma();
assert ndValid2ListValidLemma();

while (curIndex < pos-1)
invariant 0 <= curIndex < pos;
invariant curNd != null && curNd.Valid();
invariant validSeqCond(spine);
invariant |curNd.tailContents| + curIndex == |tailContents|;
invariant curNd.next != null;
invariant curNd == spine[curIndex];
invariant curNd.next == spine[curIndex+1];
invariant curNd.next.next != null ==> curNd.next.next == spine[curIndex+2];
{
curNd := curNd.next;
curIndex := curIndex + 1;
}

assert validSeqLemma(spine);


delNd := curNd.next;

curNd.next := curNd.next.next;

ghost var newSpine := spine[0..pos] + spine[pos+1..];

assert listCond(spine[pos+1..]);
//assert spine[pos+1..] != [] ==> ((set nd | nd in spine[0..pos]) !! spine[pos+1..][0].footprint);

//assert listInvFrom2Seq(spine[0..pos], spine[pos+1..]);
//assert listInv(newSpine);

mkNdValid(curNd);

/*
if (1 < pos <= |tailContents|) {
updateSeq4Del(newSpine, delNd, pos);
}
*/

}

////////////////////////////////////////
predicate listInvFrom2Seq(seq1:seq<INode>, seq2:seq<INode>)
	requires listInv(seq1) && listCond(seq2);
requires seq1 != [];
requires seq2 != [] ==> (seq1[|seq1| - 1].next == seq2[0]);
requires seq2 != [] ==> ((set nd | nd in seq1) !! seq2[0].footprint);
reads seq1, seq2, (set nd | nd in seq2);
ensures listInv(seq1 + seq2);
{listCondFpLemma(seq2)}


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



////////////////////////////////////////////////////////
method mkNdValid(curNd: INode)
  requires curNd != null;
	requires curNd.next != null ==>  curNd.next.Valid() && curNd !in curNd.next.footprint;

	modifies curNd;
	ensures curNd.Valid();
	ensures curNd.data == old(curNd.data) && curNd.next == old(curNd.next);
{
if (curNd.next == null)
{
	curNd.tailContents := [];
	curNd.footprint := {curNd};
	curNd.spine := [curNd];
}

else {
	curNd.tailContents := [curNd.next.data] + curNd.next.tailContents;
	curNd.footprint := {curNd} + curNd.next.footprint;
	curNd.spine := [curNd] + curNd.next.spine;
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

predicate  listCondFpLemma(mySeq: seq<INode>)
requires listCond(mySeq);
reads mySeq;
ensures listCondFpLemma(mySeq);
ensures mySeq != [] ==> (forall i :: 0 <= i < |mySeq| ==> mySeq[i].footprint <= mySeq[0].footprint);
{
	if |mySeq| <= 1 then true
		else mySeq[0].footprint >= mySeq[1].footprint && listCondFpLemma(mySeq[1..])
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

predicate validSeqLemma(mySeq: seq<INode>)
	requires validSeqCond(mySeq);
	reads mySeq, (set nd | nd in mySeq);
	ensures forall i :: 0 <= i < |mySeq| ==> listCond(mySeq[0..i]) && validSeqCond(mySeq[i..]);
{true}


//===============================================
/*
ghost method updateSeq4Del(newSpine: seq<INode>, rmNd:INode, pos: int)
//	requires listInv(newSpine);
	requires 1 < pos <= |tailContents|;

ensures Valid();
ensures rmNd in old(footprint);
ensures [data] + tailContents == old(([data] + tailContents)[0..pos] + ([data] + tailContents)[pos+1..] );
ensures footprint == old(footprint) - {rmNd};

{
/*
while(curIndex >= 0)
	invariant -1 <= curIndex < pos;
//	invariant listInv(newSpine);

	invariant forall i :: 0 <= i <= curIndex ==> newSpine[i].tailContents == old(newSpine[i].tailContents) &&
		newSpine[i].footprint == old(newSpine[i].footprint) && newSpine[i].spine == old(newSpine[i].spine);
//	invariant newSpine[curIndex+1].Valid();
{
newSpine[curIndex].tailContents := if newSpine[curIndex].next == null then [] else [newSpine[curIndex].next.data] + newSpine[curIndex].next.tailContents;
newSpine[curIndex].footprint := if newSpine[curIndex].next == null then {newSpine[curIndex]} else {newSpine[curIndex]} + newSpine[curIndex].next.footprint;
newSpine[curIndex].spine := if newSpine[curIndex].next == null then [newSpine[curIndex]] else [newSpine[curIndex]] + newSpine[curIndex].next.spine;

curIndex := curIndex - 1;
}
*/
}

*/

}
