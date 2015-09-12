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
requires 0 <= pos < |spine|;
requires Valid();
modifies footprint;
//ensures Valid();
/*
ensures pos == 0 ==> (data == d && tailContents == old(tailContents));
ensures pos > 0 ==> (this.data == old(this.data)
&& tailContents == old(tailContents[0..pos-1]) + [d] +
						old(tailContents[pos..]));
ensures footprint == old(footprint);
*/
{
	var index := 0;
	var curNd := this;

assert ndValid2ListValidLemma();
assert ValidLemma();

while(index < pos)
invariant 0 <= index <= pos;
invariant listInv(spine);
invariant 0 <= index < |spine| ==> curNd != null && curNd.Valid();
invariant curNd != null ==> |curNd.spine| + index == |spine|;

invariant spine == old(this.spine);
invariant 0 <= index <= pos ==> curNd == spine[index];

invariant forall nd :: nd in spine ==> nd.footprint == old(nd.footprint) &&
	nd.spine == old(nd.spine);

invariant forall nd :: (nd in spine[0..pos] || nd in spine[pos+1..] ) ==> nd.data == old(nd.data);

//invariant listCond(spine[0..index]);

invariant forall i :: 0 <= i < index ==> spine[i].tailContents == old(spine[i].tailContents)[0..pos-i-1] + [d] +  old(spine[i].tailContents)[pos-i..];

/*
invariant index > 0 ==> (spine[index-1].next == curNd &&
spine[index-1].tailContents ==
(if index == pos then [d] + spine[index].tailContents
else [spine[index].data] + curNd.tailContents[0..pos-index-1] + [d] + curNd.tailContents[pos-index..])
);
*/
{
	assert curNd.ndValid2ListValidLemma();
	assert curNd.ValidLemma();
	curNd.tailContents := curNd.tailContents[0..pos-index-1] + [d] + curNd.tailContents[pos-index..];
	
index := index + 1;	
curNd := curNd.next;

/*
assume (forall i :: 0 <= i < |spine[0..index]|-1 ==>
	 spine[0..index][i].tailContents == [spine[0..index][i+1].data] + spine[0..index][i+1].tailContents);
*/
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

