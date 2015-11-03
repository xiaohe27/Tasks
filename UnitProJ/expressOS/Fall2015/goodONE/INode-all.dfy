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

predicate validSeqContentsLemma()
	requires Valid();
	reads this, footprint;
	ensures validSeqContentsLemma();
	ensures validSeqCond(spine);
	ensures |tailContents| == |footprint|-1 == |spine|-1;
  ensures forall i :: 0 <= i < |spine| ==> spine[i].data == ([data] + tailContents)[i];
	ensures forall i :: 0 <= i < |spine| ==> spine[i].tailContents ==  ([data] + tailContents)[i+1..];
{
	ndValid2ListValidLemma() &&
		next != null ==> next.validSeqContentsLemma()
}

constructor init(d:Data) 
modifies this;
ensures Valid();
ensures data == d;
ensures next == null;

ensures footprint == {this};
ensures tailContents == [];
ensures spine == [this];
ensures fresh(footprint - {this});
{
    data := d;
	next := null;
    tailContents := [];
	footprint := {this};
    spine := [this];
}

method setNext(curNd:INode, d:Data, fstNd:INode, i:int)
	requires Valid();

  requires curNd != null && curNd.Valid();
	requires curNd.next != null;
	requires this !in curNd.footprint;
	requires data == d;

	requires fstNd != null && fstNd.Valid() && 0 < i <= |fstNd.spine| &&
		listCond(fstNd.spine[0..i]);
	requires this !in fstNd.spine[0..i] && footprint !! (set nd | nd in fstNd.spine[0..i]); 
  requires curNd == fstNd.spine[i-1];

	requires fstNd !in footprint;
	
	modifies this, curNd;
	ensures Valid();
	
	ensures fstNd != null &&
      fstNd.spine == old(fstNd.spine)
		&& 0 < i <= |fstNd.spine| &&
		(forall nd :: nd in fstNd.spine[0..i] ==> (nd != null && nd.footprint == old(nd.footprint)
		&& nd.tailContents == old(nd.tailContents)
		)) &&
		listCond(fstNd.spine[0..i]);
	ensures this !in fstNd.spine[0..i] && footprint !! (set nd | nd in fstNd.spine[0..i]); 
	
	  ensures curNd == fstNd.spine[i-1];

		ensures curNd.next == this;
		ensures data == d;
		ensures fstNd.data == old(fstNd.data);

	ensures curNd.footprint + {this} == {curNd} + this.footprint;
	ensures [d] + curNd.tailContents == [data] + tailContents;

{
next := curNd.next;
tailContents := [next.data] + next.tailContents;
footprint := {this} + next.footprint;
spine := [this] + next.spine;

curNd.next := this;
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

method preAppend(d:Data) returns (node:INode)
requires Valid();
ensures node != null && node.Valid();
ensures node.data == d && node.next == this;
ensures node.tailContents == [this.data] + this.tailContents;
{
var r := new INode.init(d);

r.next := this;

r.footprint := {r} + footprint;
r.tailContents := [this.data] + this.tailContents;
r.spine := [r] + spine;

return r;
}


method append(d:Data) returns (newNd: INode)
requires Valid();

modifies footprint;

ensures Valid();
ensures this.data == old(this.data);
ensures (tailContents == old(tailContents) + [d]);
ensures footprint == old(footprint) + {newNd};
ensures fresh(footprint - old(footprint));
ensures fresh(newNd);
{
newNd := new INode.init(d);

var tmpNd := this;
ghost var index := 0;

assert ndValid2ListValidLemma();
assert ValidLemma();


while(tmpNd.next != null)
invariant tmpNd != null && tmpNd.Valid();
invariant listCond(spine);
invariant index == |this.footprint| - |tmpNd.footprint|;
invariant tmpNd == spine[index];
invariant this.data == old(this.data);
decreases tmpNd.footprint;
{
tmpNd := tmpNd.next;

index := index + 1;
}

tmpNd.next := newNd;

updateSeqAppend(spine, d, newNd);

}

method insertAt(d:Data, i:int) returns (newNd: INode) 
requires 0 < i <= |tailContents|;
requires Valid();
modifies footprint;


ensures Valid();
ensures this.data == old(this.data);
ensures tailContents == old(tailContents[0..i-1]) + [d] + old(tailContents[i-1..]);
ensures footprint == old(footprint) + {newNd};
ensures fresh(newNd);
{
newNd := new INode.init(d);

var curNd := this;
var curIndex := 0;

assert ValidLemma();
assert ndValid2ListValidLemma();

listCondLemma(spine);

while (curIndex < i-1)
invariant 0 <= curIndex < i;
invariant curNd != null && curNd.Valid();
invariant validSeqCond(spine);
invariant |curNd.tailContents| + curIndex == |tailContents|;
invariant curNd.next != null;
invariant curNd == spine[curIndex];
{
curNd := curNd.next;
curIndex := curIndex + 1;
}

newNd.setNext(curNd, d, this, i);

updateSeq(spine[0..i], d, newNd);
}


///////////////////////////////////

method update(d:Data, pos:int)
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

/////////////////////////////////////////

method delete(pos:int) returns (delNd:INode)
requires Valid();
requires 0 < pos <= |tailContents|;

modifies footprint;

ensures Valid();
ensures [data] + tailContents == old(([data] + tailContents)[0..pos] + ([data] + tailContents)[pos+1..] );
ensures footprint == old(footprint) - {delNd};
ensures old(|tailContents| == |spine| - 1 && 0 < pos < |spine|);
ensures delNd == old(spine[pos]);
{
var curNd := this;
var curIndex := 0;

assert ValidLemma();
assert ndValid2ListValidLemma();
assert validSeqContentsLemma();
assert validSeqTCLemma(spine);

while (curIndex < pos-1)
invariant 0 <= curIndex < pos;
invariant curNd != null && curNd.Valid();
invariant validSeqCond(spine);
invariant |curNd.tailContents| + curIndex == |tailContents|;
invariant curNd.next != null;
invariant curNd == spine[curIndex];

invariant  spine[curIndex].data == ([data] + tailContents)[curIndex];

invariant curNd.next == spine[curIndex+1];
invariant curNd.next.next != null ==> curNd.next.next == spine[curIndex+2];

modifies {};
{
curNd := curNd.next;
curIndex := curIndex + 1;
}

delNd := curNd.next;

delNext(curNd, delNd, pos);


if(1 < pos <= |tailContents|) {
ghost var oldContents := old([data] + tailContents); 
ghost var newSpine := spine[0..pos-1];

assert shrinkLemma(spine, pos);

assert delNd != null;

updateSeq4Del(newSpine, delNd, pos, curNd, oldContents, this);

} else {}
 

}


///////////////////////////////
method delNext(curNd: INode, delNd:INode, pos:int)
  requires curNd != null && curNd.Valid();
  requires curNd.next == delNd && delNd != null && delNd.Valid();
	requires Valid();
  requires 0 < pos < |spine| && spine[pos-1] == curNd;
  requires validSeqCond(spine);

	requires forall i :: 0 <= i <= pos-2 ==>
	(|spine[i].tailContents|) >= pos - i;
	requires |tailContents| >= pos;

	requires curNd.data == ([data] + tailContents)[pos-1];
	requires curNd.tailContents == ([data] + tailContents)[pos..];

	requires |tailContents| == |spine|-1;
	requires forall i :: 0 <= i <= pos-2 ==> spine[i].data == ([data] + tailContents)[i];

//new
requires	 (forall nd :: nd in spine ==> nd in footprint);
	modifies curNd;
	
	ensures curNd.Valid();
	ensures curNd.data == old(curNd.data) && curNd.next == delNd.next;
	ensures curNd.footprint == old(curNd.footprint) - {delNd};
	ensures curNd.tailContents == old(curNd.tailContents[1..]);
	ensures curNd.spine == old([curNd.spine[0]] + curNd.spine[2..]);

	ensures forall i :: 0 <= i <= pos-2 ==> spine[i].data == old(spine[i].data) &&
		spine[i].next == old(spine[i].next) &&
		spine[i].tailContents == old(spine[i].tailContents) &&
		spine[i].footprint == old(spine[i].footprint) &&
		spine[i].spine == old(spine[i].spine);

		ensures listInv(spine[0..pos]);
		ensures listCond(spine[0..pos-1]); 


		ensures pos > 1 ==> spine[pos-2].tailContents == [curNd.data] + [delNd.data] + curNd.tailContents;

		//new
		ensures pos > 1 ==> spine[pos-2].footprint == {spine[pos-2]} + curNd.footprint + {delNd};

	ensures forall i :: 0 <= i <= pos-2 ==>
		(|spine[i].tailContents|) >= pos - i;

		//	ensures pos > 1 ==>  footprint == old(footprint) && (set nd | nd in spine) <= old(footprint);

		ensures pos > 1 ==>  footprint == old(footprint) &&
		spine == old(spine) && (forall nd :: nd in spine ==> nd in footprint);
		
	//end new

			ensures	curNd.tailContents == old([data] + tailContents)[pos+1..];
			
			ensures forall i :: 0 <= i <= pos-2 ==> spine[i].data == old([data] + tailContents)[i];

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

}
//END of CLASS
//////////module


///////////////////////////////


ghost method updateCurIndex(mySeq:seq<INode>, index:int,
			d:Data, newNd:INode)
requires mySeq != [];
requires 0 <= index <= |mySeq| - 1;
requires listInv(mySeq);

requires newNd !in mySeq;
requires newNd != null && newNd.Valid();
requires newNd.next == null;	

requires mySeq[|mySeq|-1].next == newNd;

requires index == |mySeq|-1 ==> (mySeq[|mySeq|-1].footprint + {newNd} == 
	{mySeq[|mySeq|-1]} + newNd.footprint


&& mySeq[|mySeq|-1].tailContents + [d] == 
	[newNd.data] + newNd.tailContents);


requires forall i :: 0 <= i < index ==>
	   mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
	&& mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents;

requires index < |mySeq| - 1 ==> mySeq[index].footprint + {newNd} == 
	{mySeq[index]} + mySeq[index+1].footprint;


requires index < |mySeq| - 1 ==> mySeq[index].tailContents + [d] == 
	[mySeq[index+1].data] + mySeq[index+1].tailContents;


requires index < |mySeq| - 1 ==> mySeq[index+1].Valid();

modifies mySeq[index];

ensures newNd !in mySeq;
ensures newNd != null && newNd.Valid();
ensures newNd.next == null;	

ensures mySeq[|mySeq|-1].next == newNd;

ensures forall nd :: nd in mySeq ==> nd.data == old(nd.data);

ensures listInv(mySeq);

ensures forall i :: 0 <= i < index-1 ==>
	   mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
	&& mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents;

ensures mySeq[index].footprint == old(mySeq[index].footprint) + {newNd};

ensures mySeq[index].tailContents == 
	old(mySeq[index].tailContents) + [d];

ensures mySeq[index].Valid();

ensures index > 0 ==> (mySeq[index-1].footprint + {newNd} == 
	{mySeq[index-1]} + mySeq[index].footprint &&

	mySeq[index-1].tailContents + [d] == 
	[mySeq[index].data] + mySeq[index].tailContents);

{
if (index < |mySeq|-1)
{
mySeq[index].tailContents := [mySeq[index+1].data] + mySeq[index+1].tailContents;

mySeq[index].footprint := {mySeq[index]} + mySeq[index+1].footprint;

mySeq[index].spine := [mySeq[index]] + mySeq[index+1].spine;
}

else 
{
mySeq[index].tailContents := [newNd.data] + newNd.tailContents;

mySeq[index].footprint := {mySeq[index]} + newNd.footprint;

mySeq[index].spine := [mySeq[index]] + newNd.spine;
}

}




ghost method updateSeqAppend(mySeq:seq<INode>, d:Data, newNd:INode)
requires mySeq != [];
requires listInv(mySeq);

requires newNd !in mySeq;

requires forall i :: 0 <= i < |mySeq|-1 ==>
	   mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
	&& mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents;


requires newNd != null && newNd.Valid();
requires newNd.next == null;	

requires mySeq[|mySeq|-1].next == newNd;

requires mySeq[|mySeq|-1].footprint + {newNd} == 
	{mySeq[|mySeq|-1]} + newNd.footprint;


requires mySeq[|mySeq|-1].tailContents + [d] == 
	[newNd.data] + newNd.tailContents;


modifies mySeq;

ensures mySeq[0].data == old(mySeq[0].data);

ensures mySeq[0].footprint == old(mySeq[0].footprint) + {newNd};
ensures mySeq[0].tailContents == 
	old(mySeq[0].tailContents) + [d];

ensures mySeq[0].Valid();

{

ghost var index := |mySeq|-1;


while(index >= 0)
invariant -1 <= index <= |mySeq|-1;

invariant newNd != null && newNd.Valid();
invariant newNd.next == null;	

invariant mySeq[|mySeq|-1].next == newNd;

invariant index == |mySeq|-1 ==> (mySeq[|mySeq|-1].footprint + {newNd} == 
	{mySeq[|mySeq|-1]} + newNd.footprint

&& mySeq[|mySeq|-1].tailContents + [d] == 
	[newNd.data] + newNd.tailContents);

invariant forall nd :: nd in mySeq ==> nd.data == old(nd.data);

invariant listInv(mySeq);

invariant forall i :: 0 <= i <= index ==> mySeq[i].tailContents == old(mySeq[i].tailContents)
&& mySeq[i].footprint == old(mySeq[i].footprint);

invariant forall i :: 0 <= i < index ==>
	   mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
	&& mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents;

invariant index < |mySeq|-1 ==> mySeq[index+1].Valid();

invariant 0 <= index < |mySeq|-1 ==> mySeq[index].footprint + {newNd} == 
	{mySeq[index]} + mySeq[index+1].footprint;

invariant 0 <= index < |mySeq|-1 ==> mySeq[index].tailContents + [d] == 
	[mySeq[index+1].data] + mySeq[index+1].tailContents;


invariant -1 <= index < |mySeq|-1 ==> (
 mySeq[index+1].footprint == old(mySeq[index+1].footprint) + {newNd} &&
 mySeq[index+1].tailContents == 
	old(mySeq[index+1].tailContents) + [d]);

{
updateCurIndex(mySeq, index, d, newNd);

index := index - 1;
}

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



lemma dataSeqCmp(newSeq:seq<Data>, oldSeq:seq<Data>, pos:int, d:Data)
	requires |newSeq| == |oldSeq|;
	requires 0 <= pos < |newSeq|;
	requires forall i :: 0 <= i < |newSeq| && i != pos ==> newSeq[i] == oldSeq[i];
	requires newSeq[pos] == d;

	ensures  |newSeq| == |oldSeq|;
	ensures newSeq == oldSeq[0..pos] + [d] + oldSeq[pos+1..];
{
}



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

predicate shrinkLemma(oldSpine:seq<INode>, pos: int)
  requires 0 <= pos < |oldSpine|;
	requires forall i :: 0 <= i <= pos-2 ==> oldSpine[i] != null && |oldSpine[i].tailContents| >= pos - i;
	reads oldSpine;
	ensures forall i :: 0 <= i <= pos-2 ==> (|oldSpine[0..pos-1][i].tailContents|) >= pos - i;
{
true
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

predicate validSeqTCLemma(mySeq: seq<INode>)
	requires validSeqCond(mySeq);
	reads mySeq, (set nd | nd in mySeq);

	ensures validSeqTCLemma(mySeq);
	ensures forall i :: 0 <= i < |mySeq| ==> |mySeq[i].tailContents| == |mySeq| - 1 - i;
{
if |mySeq| <= 1 then true
	else mySeq[0].tailContents == [mySeq[1].data] + mySeq[1].tailContents
		&& validSeqTCLemma(mySeq[1..])
}


//===============================================

//LI
predicate LI(mySeq:seq<INode>, index:int, d:Data, newNd:INode,
			oldNewD:Data, oldNewNext:INode, oldNewFp:set<INode>, 
			oldNewTC:seq<Data>, oldNewSpine:seq<INode>, 
	oldD:Data, oldNext:INode, oldFp:set<INode>, 
			oldTC:seq<Data>, oldSpine:seq<INode>)
reads *;
{
 mySeq != []
&& (-1 <= index <= |mySeq|-1)

&& listInv(mySeq)

&& (forall i :: 0 <= i < |mySeq| ==> |mySeq|-i <= |mySeq[i].spine|)
&& (forall i :: 0 <= i < |mySeq| ==> |mySeq|-i-1 <= |mySeq[i].tailContents|)

&& (newNd !in mySeq
&& newNd != null && newNd.Valid() && newNd.data == d
&& newNd.footprint !! (set nd | nd in mySeq)
&& newNd.data == oldNewD 
  && newNd.next == oldNewNext
  && newNd.footprint == oldNewFp
  && newNd.tailContents == oldNewTC)

&& mySeq[|mySeq|-1].next == newNd

&& (index == |mySeq|-1 ==> 
	([d] + mySeq[|mySeq|-1].tailContents == 
	[newNd.data] + newNd.tailContents

&& mySeq[|mySeq|-1].footprint + {newNd} == 
	{mySeq[|mySeq|-1]} + newNd.footprint

))

&& (forall i :: 0 <= i < index ==>
	mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents

	&& mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint)

&& (0 <= index < |mySeq| - 1 ==> mySeq[index].tailContents[0..|mySeq|-index-1] + [d]
 + mySeq[index].tailContents[|mySeq|-index-1..] == 
 [mySeq[index+1].data] + mySeq[index+1].tailContents)

&& (0 <= index < |mySeq| - 1 ==> mySeq[index].footprint + {newNd} == 
	{mySeq[index]} + mySeq[index+1].footprint)

&& (|oldTC| >= |mySeq|-index-2 && 
	|oldSpine| >= |mySeq|-index-1) 

&& (- 1 <= index < |mySeq| - 1 ==> (

mySeq[index+1].tailContents == 
	oldTC[0..|mySeq|-index-2] + [d]
 + oldTC[|mySeq|-index-2..]

&& mySeq[index+1].footprint == oldFp + {newNd}

))

&& (index < |mySeq| - 1 ==> mySeq[index+1].Valid())

}


//precond ==> LI
ghost method pre2LI(mySeq:seq<INode>, d:Data, newNd:INode,
	oldNewD:Data, oldNewNext:INode, oldNewFp:set<INode>, 
			oldNewTC:seq<Data>, oldNewSpine:seq<INode>, 
			oldD0:Data, oldNext0:INode, oldFp0:set<INode>, 
			oldTC0:seq<Data>, oldSpine0:seq<INode>)
			returns (index:int,oldD:Data, oldNext:INode, oldFp:set<INode>, 
			oldTC:seq<Data>, oldSpine:seq<INode>)
requires mySeq != [];

requires listCond(mySeq);

requires newNd !in mySeq;
requires newNd != null && newNd.Valid() && newNd.data == d;
requires newNd.footprint !! (set nd | nd in mySeq);

requires mySeq[|mySeq|-1].next == newNd;

requires [d] + mySeq[|mySeq|-1].tailContents == 
	[newNd.data] + newNd.tailContents

&& mySeq[|mySeq|-1].footprint + {newNd} == 
	{mySeq[|mySeq|-1]} + newNd.footprint;

//////////////////////////////
requires oldNewD == d && oldNewNext == newNd.next && oldNewFp == newNd.footprint 
	&& oldNewTC == newNd.tailContents && oldNewSpine == newNd.spine;

ensures index == |mySeq| - 1;

ensures LI(mySeq, index, d, newNd,
oldNewD, oldNewNext, oldNewFp, oldNewTC, oldNewSpine,	
oldNewD, oldNewNext, oldNewFp, oldNewTC, oldNewSpine);
{

index, oldD, oldNext, oldFp, oldTC, oldSpine := 
	|mySeq| - 1, newNd.data, newNd.next, newNd.footprint, 
		newNd.tailContents, newNd.spine;
}



ghost method LIGuardExecBody2LI(mySeq:seq<INode>, index:int, d:Data, newNd:INode,
		oldNewD:Data, oldNewNext:INode, oldNewFp:set<INode>, 
			oldNewTC:seq<Data>, oldNewSpine:seq<INode>, 
			oldD0:Data, oldNext0:INode, oldFp0:set<INode>, 
			oldTC0:seq<Data>, oldSpine0:seq<INode>) 
			returns (newIndex:int,oldD:Data, oldNext:INode, 
			oldFp:set<INode>, oldTC:seq<Data>, oldSpine:seq<INode>)
			
requires LI(mySeq, index, d, newNd,
	oldNewD, oldNewNext, oldNewFp, 
			oldNewTC, oldNewSpine, 
	oldD0, oldNext0, oldFp0, oldTC0, oldSpine0);

requires index >= 0;

modifies mySeq[index];

ensures newIndex == index - 1;

ensures oldFp == old(mySeq[newIndex+1].footprint)
	&& oldTC == old(mySeq[newIndex+1].tailContents);

ensures LI(mySeq, newIndex, d, newNd,
	oldNewD, oldNewNext, oldNewFp, 
			oldNewTC, oldNewSpine, 
	oldD, oldNext, oldFp, oldTC, oldSpine);
{
mySeq[index].tailContents := [mySeq[index].next.data] + mySeq[index].next.tailContents;

mySeq[index].footprint := {mySeq[index]} + mySeq[index].next.footprint;

mySeq[index].spine := [mySeq[index]] + mySeq[index].next.spine;

newIndex, oldD, oldNext, oldFp, oldTC, oldSpine := index - 1,
old(mySeq[index].data), old(mySeq[index].next), 
	old(mySeq[index].footprint), old(mySeq[index].tailContents), 
	old(mySeq[index].spine);
}


lemma LIAndNegGuard2Post(mySeq:seq<INode>, index:int, d:Data, newNd:INode,
	oldNewD:Data, oldNewNext:INode, oldNewFp:set<INode>, 
			oldNewTC:seq<Data>, oldNewSpine:seq<INode>, 
			oldD:Data, oldNext:INode, oldFp:set<INode>, 
			oldTC:seq<Data>, oldSpine:seq<INode>) 
					
requires LI(mySeq, index, d, newNd,
	oldNewD, oldNewNext, oldNewFp, 
			oldNewTC, oldNewSpine, 
	oldD, oldNext, oldFp, oldTC, oldSpine);

requires index < 0;

ensures mySeq[0].Valid();
ensures mySeq[0].tailContents == 
	oldTC[0..|mySeq|-1] + [d]
 + oldTC[|mySeq|-1..];

ensures mySeq[0].footprint == oldFp + {newNd};
{}



ghost method updateSeq(mySeq:seq<INode>, d:Data, newNd:INode)
requires mySeq != [];

requires listCond(mySeq);

requires newNd !in mySeq;
requires newNd != null && newNd.Valid() && newNd.data == d;
requires newNd.footprint !! (set nd | nd in mySeq);

requires mySeq[|mySeq|-1].next == newNd;

requires (mySeq[|mySeq|-1].footprint + {newNd} == 
	{mySeq[|mySeq|-1]} + newNd.footprint
	
&& [d] + mySeq[|mySeq|-1].tailContents == 
	[newNd.data] + newNd.tailContents);

modifies mySeq;

ensures mySeq[0].data == old(mySeq[0].data);
ensures mySeq[0].tailContents == 
	old(mySeq[0].tailContents) [0..|mySeq|-1] + [d]
 + old(mySeq[0].tailContents) [|mySeq|-1..];

ensures mySeq[0].footprint == old(mySeq[0].footprint) + {newNd};

ensures mySeq[0].Valid();

{

ghost var index, oldD, oldNext, oldFp, oldTC, oldSpine := 
pre2LI(mySeq, d, newNd,	
newNd.data, newNd.next, newNd.footprint, newNd.tailContents, newNd.spine, 
newNd.data, newNd.next, newNd.footprint, newNd.tailContents, newNd.spine);


while(index >= 0)
invariant forall i :: 0 <= i <= index ==> 
(mySeq[i].tailContents == old(mySeq[i].tailContents)
&& mySeq[i].footprint == old(mySeq[i].footprint));



invariant LI(mySeq, index, d, newNd,
	newNd.data, newNd.next, newNd.footprint, 
	newNd.tailContents, newNd.spine, 
	oldD, oldNext, oldFp, oldTC, oldSpine);

invariant index < |mySeq|-1 ==> (
		oldFp == old(mySeq[index+1].footprint) &&
		mySeq[index+1].footprint ==
		oldFp + {newNd});

invariant index < |mySeq|-1 ==> 
	oldTC == old(mySeq[index+1].tailContents)
	&& (mySeq[index+1].tailContents == 
	oldTC[0..|mySeq|-index-2] + [d]
	+ oldTC[|mySeq|-index-2..]);

{
index, oldD, oldNext, oldFp, oldTC, oldSpine := 
LIGuardExecBody2LI(mySeq, index, d, newNd,
		newNd.data, newNd.next, newNd.footprint, 
		newNd.tailContents, newNd.spine, 
			oldD, oldNext, oldFp, 
			oldTC, oldSpine);
}


LIAndNegGuard2Post(mySeq, index, d, newNd,
		newNd.data, newNd.next, newNd.footprint, 
		newNd.tailContents, newNd.spine, 
		oldD, oldNext, oldFp, oldTC, oldSpine);

}


/////////////////////////////////////////////////////

ghost method updateSeq4Del(newSpine: seq<INode>, delNd:INode, pos: int, nxtNd:INode, oldContents:seq<Data>, thisNd:INode)
	requires listCond(newSpine);
	requires 1 < pos < |oldContents|;
requires |newSpine| == pos - 1;

requires nxtNd != null && nxtNd.Valid();
requires newSpine[|newSpine|-1].next == nxtNd;

//new
requires thisNd == newSpine[0];

requires delNd !in nxtNd.footprint && delNd !in newSpine;

requires (set nd | nd in newSpine) !! nxtNd.footprint;
requires newSpine[|newSpine|-1].footprint >= nxtNd.footprint;
requires delNd != null;
requires newSpine[|newSpine|-1].tailContents == [nxtNd.data] + [delNd.data] + nxtNd.tailContents;

requires |newSpine[|newSpine|-1].tailContents| >= 2;

requires newSpine[|newSpine|-1].footprint == {newSpine[|newSpine|-1]} + nxtNd.footprint + {delNd};
	 
requires  forall i :: 0 <= i <= pos-2 ==> (|newSpine[i].tailContents|) >= pos - i;

requires |oldContents| > pos;
requires nxtNd.tailContents == oldContents[pos+1..];
requires nxtNd.data == oldContents[pos-1];
requires forall i :: 0 <= i <= pos-2 ==> newSpine[i].data == oldContents[i];
modifies newSpine;

ensures thisNd.Valid();
ensures  [thisNd.data] + thisNd.tailContents == oldContents[0..pos] + oldContents[pos+1..];

ensures thisNd.footprint == old(thisNd.footprint) - {delNd};
{

ghost var curIndex := pos - 2;

/////////pre to LI ok

while(curIndex >= 0)

	invariant -1 <= curIndex <= pos-2;

	invariant newSpine[|newSpine|-1].next == nxtNd;

	invariant nxtNd.Valid();

  invariant newSpine == old(newSpine);
	invariant thisNd == newSpine[0];

	invariant listInv(newSpine);


	invariant forall i :: 0 <= i <= curIndex ==> newSpine[i].tailContents == old(newSpine[i].tailContents) &&
		newSpine[i].footprint == old(newSpine[i].footprint) && newSpine[i].spine == old(newSpine[i].spine);

		//new
		invariant forall i :: 0 <= i < curIndex ==> newSpine[i].footprint == {newSpine[i]} + newSpine[i+1].footprint
			&&
			newSpine[i].tailContents == [newSpine[i+1].data] + newSpine[i+1].tailContents;
			
		invariant -1 <= curIndex < pos-2 ==> newSpine[curIndex+1].footprint == old(newSpine[curIndex+1].footprint - {delNd});
		
invariant forall nd :: nd in newSpine ==> nd.data == old(nd.data);
invariant nxtNd.data == old(nxtNd.data) && nxtNd.tailContents == old(nxtNd.tailContents);
invariant oldContents == old(oldContents);

invariant 0 <= curIndex <= pos-2 ==>  |newSpine[curIndex].tailContents| >= pos - curIndex;

//new
invariant -1 <= curIndex < pos - 2 ==>  [newSpine[curIndex+1].data] + newSpine[curIndex+1].tailContents == oldContents[curIndex+1..pos] + oldContents[pos+1..];	 
//end new
		
 invariant -1 <= curIndex < pos - 2 ==> newSpine[curIndex+1].Valid();
		
	modifies newSpine;
{
newSpine[curIndex].tailContents :=  [newSpine[curIndex].next.data] + newSpine[curIndex].next.tailContents;
newSpine[curIndex].footprint :=  {newSpine[curIndex]} + newSpine[curIndex].next.footprint;
newSpine[curIndex].spine :=  [newSpine[curIndex]] + newSpine[curIndex].next.spine;

curIndex := curIndex - 1;
}

assert curIndex == -1;

assert newSpine[curIndex+1].Valid();

assert [newSpine[curIndex+1].data] + newSpine[curIndex+1].tailContents == oldContents[curIndex+1..pos] + oldContents[pos+1..];

assert newSpine[curIndex+1].footprint == old(newSpine[curIndex+1].footprint - {delNd});

}

//===============================================


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


method init()
modifies this;
ensures valid() && fresh(footprint - {this});
ensures |contents| == 0;
ensures spine == {head};
ensures head.next == null;
{
head := new INode.init(null);

contents := head.tailContents;

footprint := {this};
footprint := footprint + head.footprint;
spine := {head};
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



method add2Front(d:Data)
modifies footprint;
requires valid();
requires d != null;

ensures valid();
ensures contents == [d] + old(contents);
ensures fresh(footprint - old(footprint));
{
head.data := d;

var newHead := new INode.init(null);
newHead.next := head;

newHead.footprint := {newHead} + head.footprint;
newHead.spine := [newHead] + newHead.next.spine;
newHead.tailContents := [d] + head.tailContents;

head := newHead;

footprint := footprint + {newHead};

spine := spine + {head};

contents := head.tailContents;

assert head.ValidLemma() && head.ndValid2ListValidLemma();
}


method append(d:Data)
requires valid();

modifies footprint;

ensures valid();
ensures (contents == old(contents) + [d]);
ensures fresh(footprint - old(footprint));
{
var newNd := head.append(d);

footprint := footprint + {newNd};
spine := spine + {newNd};
contents := head.tailContents;

assert head.ValidLemma() && head.ndValid2ListValidLemma();
}

method insertAt(i:int, d:Data)
requires 0 < i < |contents|;
requires valid();
modifies footprint;
ensures valid();
ensures contents == old(contents[0..i]) + [d] + old(contents[i..]);
ensures fresh(footprint - old(footprint));
{
var newNd := head.insertAt(d, i+1);

footprint := footprint + {newNd};
spine := spine + {newNd};
contents := head.tailContents;

assert head.ValidLemma() && head.ndValid2ListValidLemma();
}


method insert(d:Data, pos:int) 
modifies footprint;
requires valid();
requires d != null;
requires 0 <= pos <= |contents|;

ensures valid();
ensures |contents| == (|old(contents)| + 1);

ensures pos == 0 ==> contents == [d] + old(contents);
ensures pos == |contents| ==> contents == old(contents) + [d];
ensures 0 < pos < |contents| ==> contents == 
		old(contents[0..pos]) + [d] + old(contents[pos..]);

ensures fresh(footprint - old(footprint));
{

var length := this.len();
if (pos == 0) {
add2Front(d);
}

else if (pos == length) {
append(d);
}

else {
insertAt(pos, d);
}
}

predicate dataSeqLemma(oldHd:Data, newHd:Data, oldSeq:seq<Data>, newSeq:seq<Data> , index:int, d:Data)
	requires |newSeq| == |oldSeq|;
	requires 1 <= index+1 <= |oldSeq|;
	requires [newHd] + newSeq == ([oldHd] + oldSeq)[0..index+1] + [d] + ([oldHd] + oldSeq)[index+2..];
	reads oldHd, newHd, oldSeq, newSeq;
	ensures newSeq == oldSeq[0..index] + [d] + oldSeq[index+1..];
{true}

method update(d:Data, index:int)
requires 0 <= index < |contents|;
requires valid();
modifies footprint;
ensures valid();
ensures contents == old(contents[0..index]) + [d] + old(contents[index+1..]);
ensures footprint == old(footprint);
{
head.update(d, index+1);

assert dataSeqLemma(old(head.data), head.data, old(head.tailContents), head.tailContents, index, d);

contents := head.tailContents;

assert head.ValidLemma() && head.ndValid2ListValidLemma();
}


method delete(index:int)  returns (delNd:INode)
requires valid();
requires 0 <= index < |contents|;

modifies footprint;
ensures valid();
ensures contents == old(contents[0..index] + contents[index+1..]);

ensures 1 <= index + 1 < old(|head.spine|);
ensures delNd == old(head.spine[index+1]);
ensures footprint == old(footprint) - {delNd};
ensures spine == old(spine) - {delNd};
{
   delNd := head.delete(index+1);

   footprint := footprint - {delNd};

   spine := head.footprint;
   
   contents := head.tailContents;

assert head.ValidLemma() && head.ndValid2ListValidLemma();
}

}
