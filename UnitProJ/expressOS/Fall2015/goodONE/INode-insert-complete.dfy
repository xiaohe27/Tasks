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

/*
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
*/



method append(d:Data)
requires Valid();

modifies footprint;

ensures Valid();
ensures this.data == old(this.data);
ensures (tailContents == old(tailContents) + [d]);
ensures fresh(footprint - old(footprint));

{
var node := new INode.init(d);
assert node.footprint !! footprint;

var tmpNd := this;
ghost var index := 0;

assert ndValid2ListValidLemma();
assert ValidLemma();


while(tmpNd.next != null)
invariant tmpNd != null && tmpNd.Valid();
invariant listCond(spine);
invariant index == |this.footprint| - |tmpNd.footprint|;
invariant tmpNd == spine[index];
decreases tmpNd.footprint;
{
tmpNd := tmpNd.next;

index := index + 1;
}

tmpNd.next := node;

updateSeq(spine, d, node);

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
		&& nd.spine == old(nd.spine))) &&
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

&& mySeq[|mySeq|-1].spine + [newNd] == 
	[mySeq[|mySeq|-1]] + newNd.spine

&& mySeq[|mySeq|-1].tailContents + [d] == 
	[newNd.data] + newNd.tailContents);


requires forall i :: 0 <= i < index ==>
	   mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
	&& mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents
	&& mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine;

requires index < |mySeq| - 1 ==> mySeq[index].footprint + {newNd} == 
	{mySeq[index]} + mySeq[index+1].footprint;

requires index < |mySeq| - 1 ==> mySeq[index].spine + [newNd] == 
	[mySeq[index]] + mySeq[index+1].spine;

requires index < |mySeq| - 1 ==> mySeq[index].tailContents + [d] == 
	[mySeq[index+1].data] + mySeq[index+1].tailContents;

requires index < |mySeq| - 1 ==> mySeq[index+1].spine == mySeq[index+1..] + [newNd];

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
	&& mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents
	&& mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine;

ensures mySeq[index].footprint == old(mySeq[index].footprint) + {newNd};
ensures mySeq[index].spine == old(mySeq[index].spine) + [newNd];
ensures mySeq[index].tailContents == 
	old(mySeq[index].tailContents) + [d];

ensures mySeq[index].spine == mySeq[index..] + [newNd];

ensures mySeq[index].Valid();

ensures index > 0 ==> (mySeq[index-1].footprint + {newNd} == 
	{mySeq[index-1]} + mySeq[index].footprint &&
	mySeq[index-1].spine + [newNd] == 
	[mySeq[index-1]] + mySeq[index].spine &&
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




ghost method updateSeq(mySeq:seq<INode>, d:Data, newNd:INode)
requires mySeq != [];
requires listInv(mySeq);

requires newNd !in mySeq;

requires forall i :: 0 <= i < |mySeq|-1 ==>
	   mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
	&& mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents
	&& mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine;


requires newNd != null && newNd.Valid();
requires newNd.next == null;	

requires mySeq[|mySeq|-1].next == newNd;

requires mySeq[|mySeq|-1].footprint + {newNd} == 
	{mySeq[|mySeq|-1]} + newNd.footprint;

requires mySeq[|mySeq|-1].spine + [newNd] == 
	[mySeq[|mySeq|-1]] + newNd.spine;

requires mySeq[|mySeq|-1].tailContents + [d] == 
	[newNd.data] + newNd.tailContents;


modifies mySeq;
ensures forall nd :: nd in mySeq ==> nd.data == old(nd.data);

ensures mySeq[0].footprint == old(mySeq[0].footprint) + {newNd};
ensures mySeq[0].spine == old(mySeq[0].spine) + [newNd];
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

&& mySeq[|mySeq|-1].spine + [newNd] == 
	[mySeq[|mySeq|-1]] + newNd.spine

&& mySeq[|mySeq|-1].tailContents + [d] == 
	[newNd.data] + newNd.tailContents);



invariant listInv(mySeq);

invariant forall i :: 0 <= i <= index ==> mySeq[i].tailContents == old(mySeq[i].tailContents)
								 	 				 			 		 && mySeq[i].footprint == old(mySeq[i].footprint)
																		 && mySeq[i].spine == old(mySeq[i].spine);

invariant forall i :: 0 <= i < index ==>
	   mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
	&& mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents
	&& mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine;

invariant index < |mySeq|-1 ==> mySeq[index+1].spine == mySeq[index+1..] + [newNd];

invariant index < |mySeq|-1 ==> mySeq[index+1].Valid();

invariant 0 <= index < |mySeq|-1 ==> mySeq[index].footprint + {newNd} == 
	{mySeq[index]} + mySeq[index+1].footprint;

invariant 0 <= index < |mySeq|-1 ==> mySeq[index].spine + [newNd] == 
	[mySeq[index]] + mySeq[index+1].spine;

invariant 0 <= index < |mySeq|-1 ==> mySeq[index].tailContents + [d] == 
	[mySeq[index+1].data] + mySeq[index+1].tailContents;


invariant -1 <= index < |mySeq|-1 ==> (
 mySeq[index+1].footprint == old(mySeq[index+1].footprint) + {newNd} &&
 mySeq[index+1].spine == old(mySeq[index+1].spine) + [newNd] &&
 mySeq[index+1].tailContents == 
	old(mySeq[index+1].tailContents) + [d]);

{
updateCurIndex(mySeq, index, d, newNd);

index := index - 1;
}

}


}

