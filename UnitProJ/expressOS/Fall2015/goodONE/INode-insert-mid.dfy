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
{
if next == null then (spine == [this])
else (
spine == [this] + next.spine 
&& next.ValidLemma())
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
invariant listCond(spine[0..i]);
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

}
