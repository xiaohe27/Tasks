class Data {}
class INode 
{
ghost var contents: seq<Data>;
ghost var spine: seq<INode>;
ghost var footprint: set<INode>;

var data: Data;
var next: INode;


function method len():int
requires Valid();
reads this, footprint;
ensures len() == |footprint|;
{
if next == null then 1 else 1 + next.len()
}



predicate good()
reads this, footprint;
{
    this in footprint && null !in footprint
	&& (next != null ==> (next in footprint 
	&& this !in next.footprint 
	&& next.footprint + {this} == footprint
	&& spine == [this] + next.spine
	))
	&& (next ==null ==> contents == [this.data] && footprint == {this}
				&& spine == [this])
	&& (next != null ==> contents == [this.data] + next.contents)
}


predicate Valid()
reads this, footprint;
{
good()  
&& (forall nd :: nd in spine ==> nd in footprint)
&& listCond(spine)
&& |spine| == |footprint| == |contents|

&& (next != null ==> next.Valid())
}

predicate ValidLemma()
requires Valid();
reads this, footprint;
ensures ValidLemma();
ensures |contents| == |footprint| == |spine|;
ensures (forall i :: 0 <= i < |spine| ==> spine[i].data == contents[i]);
ensures ndSeq2DataSeq(spine) == contents;
{
(next == null) ||
(next.ValidLemma())
}


constructor init(d:Data) 
modifies this;
ensures Valid();
ensures data == d;
ensures next == null;

ensures footprint == {this};
ensures contents == [this.data];
ensures spine == [this];
ensures fresh(footprint - {this});
{
    data := d;
	next := null;
    contents := [this.data];
	footprint := {this};
    spine := [this];
}


method preAppend(d:Data) returns (node:INode)
requires Valid();
ensures node != null && node.Valid();
ensures node.data == d && node.next == this;
ensures node.contents == [node.data] + this.contents;
{
var r := new INode.init(d);

r.next := this;

r.footprint := {r} + footprint;
r.contents := [r.data] + this.contents;
r.spine := [r] + spine;

return r;
}


method append(d:Data)
requires Valid();

modifies footprint;
ensures Valid();
//ensures (contents == old(contents) + [d]);
ensures fresh(footprint - old(footprint));
{
var node := new INode.init(d);
assert node.footprint !! footprint;

var tmpNd := this;
ghost var index := 0;

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

spine := spine + [node];

updateSeq(spine);

//assert ValidLemma();

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



predicate allV(myNode:INode)
reads myNode, getFtprint(myNode);
requires myNode != null && myNode.Valid();
decreases myNode.footprint;
ensures allV(myNode);
ensures forall nd :: nd in myNode.footprint ==> nd != null && nd.Valid();
{

if (myNode.next == null)
then myNode.footprint == {myNode}
else 
allV(myNode.next)
}

predicate seqV(mySeq: seq<INode>)
requires listCond(mySeq);
requires mySeq != [] ==> mySeq[0].Valid()
		&& (mySeq[|mySeq|-1].Valid());

reads mySeq, sumAllFtprint(mySeq);
ensures seqV(mySeq);
ensures forall nd :: nd in mySeq ==> nd.Valid(); 
{
mySeq == [] ||
(seqV(mySeq[1..]))
}

predicate ValidLemma2(node:INode)
requires node != null && node.Valid();
reads node, getFtprint(node);

ensures ValidLemma2(node);
ensures (set nd | nd in node.spine) == node.footprint;

ensures forall nd :: nd in node.footprint ==> nd.footprint <= node.footprint;
{
if node.next == null then (node.spine == [node] && node.footprint == {node})
else (
node.spine == [node] + node.next.spine 
&& node.footprint == {node} + node.next.footprint
&& ValidLemma2(node.next))
}

predicate allDiff(mySeq:seq<INode>)
reads mySeq;
{
forall index :: 0 <= index < |mySeq| ==> 
	(forall other :: 0 <= other < |mySeq| && other != index ==>
	 (mySeq[other] != mySeq[index]))
}

predicate listCond(mySeq: seq<INode>)
reads mySeq, (set nd | nd in mySeq);
{
null !in mySeq &&
allDiff(mySeq) &&
(forall i :: 0 <= i < |mySeq|-1 ==> mySeq[i].next == mySeq[i+1])
&& (forall i, j :: 0 <= i < j < |mySeq| ==> mySeq[i] !in mySeq[j].footprint)
}

predicate goodSeqCond(mySeq: seq<INode>)
reads mySeq, sumAllFtprint(mySeq);
{
listCond(mySeq) &&
(forall nd :: nd in mySeq ==> nd.good())
}

predicate validSeqCond(mySeq: seq<INode>)
reads mySeq, sumAllFtprint(mySeq);
{
listCond(mySeq) &&
(forall nd :: nd in mySeq ==> nd.Valid())
}


//===============================================

ghost method updateCurIndex(mySeq:seq<INode>, index:int)
requires 0 <= index <= |mySeq| - 2;
requires listCond(mySeq);
requires mySeq[index+1].Valid();
requires mySeq[index+1].spine == mySeq[index+1..];
	
modifies mySeq[index];
ensures fresh((set nd | nd in mySeq) - old(set nd | nd in mySeq));

ensures listCond(mySeq);

ensures mySeq[index].Valid();

ensures mySeq[index].spine == mySeq[index..];
{
mySeq[index].contents := [mySeq[index].data] + mySeq[index+1].contents;

mySeq[index].footprint := {mySeq[index]} + mySeq[index+1].footprint;

mySeq[index].spine := [mySeq[index]] + mySeq[index+1].spine;
}



ghost method updateSeq(mySeq:seq<INode>)

requires mySeq != [];
requires listCond(mySeq);

requires mySeq[|mySeq|-1].Valid();
requires mySeq[|mySeq|-1].spine == mySeq[|mySeq|-1..];
	
modifies mySeq;

ensures validSeqCond(mySeq);
{
ghost var index := |mySeq| - 2;

while(index >= 0)
invariant -1 <= index <= |mySeq| - 2;
invariant listCond(mySeq);
invariant mySeq[index+1].Valid(); 
invariant mySeq[|mySeq|-1].Valid();
invariant mySeq[index+1].spine == mySeq[index+1..];
{
updateCurIndex(mySeq, index);

index := index - 1;
}

assert seqV(mySeq);
}


function ndSeq2DataSeq(mySeq:seq<INode>) : seq<Data>
requires listCond(mySeq);
reads mySeq;
ensures |mySeq| == |ndSeq2DataSeq(mySeq)|;
ensures forall i :: 0 <= i < |mySeq| ==> 
	ndSeq2DataSeq(mySeq)[i] == mySeq[i].data;
{
if mySeq == [] then []
else [mySeq[0].data] + ndSeq2DataSeq(mySeq[1..])
}


}
