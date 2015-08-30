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
&& (forall nd :: nd in spine ==> nd in footprint)
&& (next != null ==> next.Valid())
}


predicate ValidLemma()
requires Valid();
reads this, footprint;
ensures ValidLemma();
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
method insertAt(d:Data, i:int) returns (newNd: INode) 
requires 0 < i <= |tailContents|;
requires Valid();
modifies footprint;
/*
ensures Valid();
ensures this.data == old(this.data);
ensures tailContents == old(tailContents[0..i-1]) + [d] + old(tailContents[i-1..]);
ensures footprint == old(footprint) + {newNd};
ensures fresh(newNd);
*/
{
newNd := new INode.init(d);

var curNd := this;
var curIndex := 0;

assert ValidLemma();
assert ndValid2ListValidLemma();

while (curIndex < i-1)
invariant 0 <= curIndex < i;
invariant curNd != null && curNd.Valid();

invariant |curNd.tailContents| + curIndex == |tailContents|;

invariant curNd.next != null;
invariant curNd == spine[curIndex];
{
curNd := curNd.next;
curIndex := curIndex + 1;
}

}
*/

predicate ndValid2ListValidLemma()
requires Valid();
reads this, footprint;

ensures ndValid2ListValidLemma();

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


ghost method updateCurIndex(mySeq:seq<INode>, index:int,
			d:Data, newNd:INode)
requires mySeq != [];

requires 0 <= index <= |mySeq| - 1;

requires listInv(mySeq);

requires |mySeq|-index <= |mySeq[index].spine|;
requires |mySeq|-index-1 <= |mySeq[index].tailContents|;

requires newNd !in mySeq;
requires newNd != null && newNd.Valid() && newNd.data == d;
requires newNd.footprint !! (set nd | nd in mySeq);

requires mySeq[|mySeq|-1].next == newNd;

requires index == |mySeq|-1 ==> (mySeq[|mySeq|-1].footprint + {newNd} == 
	{mySeq[|mySeq|-1]} + newNd.footprint

&& mySeq[|mySeq|-1].spine[0..1] + [newNd] + mySeq[|mySeq|-1].spine[1..]  == 
	[mySeq[|mySeq|-1]] + newNd.spine

&& [d] + mySeq[|mySeq|-1].tailContents == 
	[d] + newNd.tailContents);


requires forall i :: 0 <= i < index ==>
	   mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
	&& mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents
	&& mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine;


requires index < |mySeq| - 1 ==> mySeq[index].footprint + {newNd} == 
	{mySeq[index]} + mySeq[index+1].footprint;

requires index < |mySeq| - 1 ==> mySeq[index].spine[0..|mySeq|-index] + [newNd]
 + mySeq[index].spine[|mySeq|-index..] == [mySeq[index]] + mySeq[index+1].spine;


requires index < |mySeq| - 1 ==> mySeq[index].tailContents[0..|mySeq|-index-1] + [d]
 + mySeq[index].tailContents[|mySeq|-index-1..] == 
 [mySeq[index+1].data] + mySeq[index+1].tailContents;


requires index < |mySeq| - 1 ==> mySeq[index+1].spine == mySeq[index+1..] +
						newNd.spine;

requires index < |mySeq| - 1 ==> mySeq[index+1].Valid();

modifies mySeq[index];

ensures newNd !in mySeq;
ensures newNd != null && newNd.Valid() && newNd.data == d;
ensures newNd.footprint !! (set nd | nd in mySeq);

ensures mySeq[|mySeq|-1].next == newNd;

ensures forall nd :: nd in mySeq ==> nd.data == old(nd.data);

ensures listInv(mySeq);

ensures forall i :: 0 <= i < index-1 ==>
	   mySeq[i].footprint == {mySeq[i]} + mySeq[i+1].footprint
	&& mySeq[i].tailContents == [mySeq[i+1].data] + mySeq[i+1].tailContents
	&& mySeq[i].spine == [mySeq[i]] + mySeq[i+1].spine;


ensures mySeq[index].footprint == old(mySeq[index].footprint) + {newNd};
ensures mySeq[index].spine == old(mySeq[index].spine[0..|mySeq|-index]) + [newNd]
 + old(mySeq[index].spine[|mySeq|-index..]);

ensures mySeq[index].tailContents == 
	old(mySeq[index].tailContents[0..|mySeq|-index-1]) + [d]
 + old(mySeq[index].tailContents[|mySeq|-index-1..]);

ensures mySeq[index].spine == mySeq[index..] + newNd.spine;

ensures mySeq[index].Valid();

ensures index > 0 ==> mySeq[index-1].footprint + {newNd} == 
	{mySeq[index-1]} + mySeq[index].footprint;

ensures index > 0 ==> mySeq[index-1].spine[0..|mySeq|-index+1] + [newNd]
 + mySeq[index-1].spine[|mySeq|-index+1..] == [mySeq[index-1]] + mySeq[index].spine;
	
ensures index > 0 ==> mySeq[index-1].tailContents[0..|mySeq|-index] + [d]
 + mySeq[index-1].tailContents[|mySeq|-index..] == 
 [mySeq[index].data] + mySeq[index].tailContents;

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

/*
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
*/

}

