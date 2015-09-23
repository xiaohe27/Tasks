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
/*ok
method delete(pos:int) returns (delNd:INode)
requires Valid();
requires 0 < pos <= |tailContents|;

modifies footprint;

ensures Valid();
ensures [data] + tailContents == old(([data] + tailContents)[0..pos] + ([data] + tailContents)[pos+1..] );
ensures footprint == old(footprint) - {delNd};

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

delNd := curNd.next;

delNext(curNd, delNd, this, pos);

if(1 < pos <= |tailContents|) {
ghost var newSpine := spine[0..pos-1];

updateSeq4Del(newSpine, delNd, pos, curNd);
} else {}
//////////////////////////
/////////////////////////

}
*/
////////////////////////////////////////

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
/* ok
method delNext(curNd: INode, delNd:INode, fstNd:INode, pos:int)
  requires curNd != null && curNd.Valid();
  requires curNd.next == delNd && delNd != null && delNd.Valid();
	requires fstNd != null && fstNd.Valid();
  requires 0 < pos < |fstNd.spine| && fstNd.spine[pos-1] == curNd;
  requires validSeqCond(fstNd.spine);

	
	modifies curNd;
	ensures curNd.Valid();
	ensures curNd.data == old(curNd.data) && curNd.next == delNd.next;
	ensures curNd.footprint == old(curNd.footprint) - {delNd};
	ensures curNd.tailContents == old(curNd.tailContents[1..]);
	ensures curNd.spine == old([curNd.spine[0]] + curNd.spine[2..]);

	ensures forall i :: 0 <= i < pos-1 ==> fstNd.spine[i].data == old(fstNd.spine[i].data) &&
		fstNd.spine[i].next == old(fstNd.spine[i].next) &&
		fstNd.spine[i].tailContents == old(fstNd.spine[i].tailContents) &&
		fstNd.spine[i].footprint == old(fstNd.spine[i].footprint) &&
		fstNd.spine[i].spine == old(fstNd.spine[i].spine);

		ensures listInv(fstNd.spine[0..pos]);
{
	
	curNd.next := curNd.next.next;

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
*/	




//===============================================

ghost method updateSeq4Del(newSpine: seq<INode>, delNd:INode, pos: int, nxtNd:INode)
	requires listInv(newSpine);
	requires 1 < pos <= |tailContents|;
requires |newSpine| == pos - 1;

requires nxtNd != null && nxtNd.Valid();
requires newSpine[|newSpine|-1].next == nxtNd;

//new
requires this == newSpine[0];

requires delNd !in nxtNd.footprint && delNd !in newSpine;

requires (set nd | nd in newSpine) !! nxtNd.footprint;
requires newSpine[|newSpine|-1].footprint >= nxtNd.footprint;
requires delNd != null;
requires newSpine[|newSpine|-1].tailContents == [nxtNd.data] + [delNd.data] + nxtNd.tailContents;

requires newSpine[|newSpine|-1].footprint == {newSpine[|newSpine|-1]} + nxtNd.footprint - {delNd};
requires  forall i :: 0 <= i < |newSpine|-1 ==> newSpine[i].footprint == {newSpine[i]} + newSpine[i+1].footprint;

modifies newSpine;

ensures Valid();
//ensures [data] + tailContents == old(([data] + tailContents)[0..pos] + ([data] + tailContents)[pos+1..] );
ensures footprint == old(footprint) - {delNd};

{

ghost var curIndex := pos - 2;

/////////pre to LI ok

while(curIndex >= 0)
	invariant -1 <= curIndex <= pos-2;

	invariant newSpine[|newSpine|-1].next == nxtNd;

	invariant nxtNd.Valid();

	invariant newSpine == old(newSpine);
	invariant listInv(newSpine);


	invariant forall i :: 0 <= i <= curIndex ==> newSpine[i].tailContents == old(newSpine[i].tailContents) &&
		newSpine[i].footprint == old(newSpine[i].footprint) && newSpine[i].spine == old(newSpine[i].spine);

		//new
		invariant this == newSpine[0];
		invariant forall i :: 0 <= i < curIndex ==> newSpine[i].footprint == {newSpine[i]} + newSpine[i+1].footprint;
		invariant -1 <= curIndex < pos-2 ==> newSpine[curIndex+1].footprint == old(newSpine[curIndex+1].footprint - {delNd});
	//end new
		
    invariant curIndex < pos - 2 ==> newSpine[curIndex+1].Valid();
		
	modifies newSpine;
{
newSpine[curIndex].tailContents :=  [newSpine[curIndex].next.data] + newSpine[curIndex].next.tailContents;
newSpine[curIndex].footprint :=  {newSpine[curIndex]} + newSpine[curIndex].next.footprint;
newSpine[curIndex].spine :=  [newSpine[curIndex]] + newSpine[curIndex].next.spine;

curIndex := curIndex - 1;

}

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


predicate validSeqLemma2(mySeq: seq<INode>)
	requires validSeqCond(mySeq);
	reads mySeq, (set nd | nd in mySeq);
	ensures validSeqLemma2(mySeq);
	ensures forall i :: 0 <= i < |mySeq| ==> mySeq[i].spine == mySeq[i..];
{if |mySeq| <= 1 then true
	else mySeq[0].spine == [mySeq[0]] + mySeq[1].spine
		&& validSeqLemma2(mySeq[1..])
}

