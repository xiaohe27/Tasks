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


method get(i:int) returns (dataI: Data) 
requires 0 < i <= |tailContents|;
requires Valid();

ensures Valid();
ensures dataI == if i == 0 then data else tailContents[i-1];
{

var curNd := this;
var curIndex := 0;

assert ValidLemma();
assert ndValid2ListValidLemma();

while (curIndex < i)
	invariant 0 <= curIndex <= i;
	invariant validSeqCond(spine);
invariant curNd != null && curNd.Valid();
invariant |curNd.tailContents| + curIndex == |tailContents|;
invariant curNd == spine[curIndex];
{
curNd := curNd.next;
curIndex := curIndex + 1;
}

assert spineTCLemma();
return curNd.data;

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

	&& (forall i :: 0 <= i < |mySeq| ==> |mySeq|-i <= |mySeq[i].spine|)
&& (forall i :: 0 <= i < |mySeq| ==> |mySeq|-i-1 <= |mySeq[i].tailContents|)
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


}

//The INodes class: a list
class INodes {
  var head: INode;

  ghost var contents: seq<Data>;
  ghost var footprint: set<object>;
  ghost var spine: set<INode>;

predicate valid()
reads this, footprint; 
{
this in footprint 
&& spine <= footprint
&& head in spine 
&&
(forall nd :: nd in spine ==> (nd != null && nd.footprint <= footprint - {this})) 
&&
(forall nd :: nd in spine ==> nd != null && nd.Valid())

&&
(forall nd :: nd in spine ==> (nd.next != null ==> nd.next in spine))

&& contents == head.tailContents
&& head.footprint == spine
}

method len() returns (len:int)
requires valid();
ensures valid();
ensures len == |contents|;
{
var tmp:INode;
tmp := head;
len := 0;

while(tmp.next != null)
decreases tmp.footprint;
invariant tmp != null && tmp.Valid();
invariant tmp.next == null ==> tmp.tailContents == [];
invariant len + |tmp.tailContents| == |contents|;
{
len := len + 1;

tmp := tmp.next;
}

}


method get(index:int) returns (d:Data)
requires valid();
requires 0 <= index < |contents|;

ensures valid();
ensures d == contents[index];
{
d := head.get(index+1);
}



/*


method delete(index:int)  returns (delNd:INode)
requires valid();
requires 0 <= index < |contents|;

modifies footprint;
ensures valid();
ensures contents == old(contents[0..index]) + old(contents[index+1..]);
ensures footprint == old(footprint) - {delNd};
ensures spine == old(spine) - {delNd};
{
   delNd := head.delete(index+1);

   footprint := footprint - {delNd};

   spine := head.footprint;
   
   contents := head.tailContents;

   assert head.allVLemma() && head.ValidLemma();
}
*/
}
