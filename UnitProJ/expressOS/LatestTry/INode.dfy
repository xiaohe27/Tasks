class Data {}
class INode 
{
ghost var tailContents: seq<Data>;
ghost var footprint: set<INode>;

var data: Data;
var next: INode;

predicate Valid()
reads this, footprint;
{
good()
&& (next != null ==> next.Valid())
}

predicate good()
reads this, footprint;
{
good1() && good2() 
}

predicate good1()
reads this, footprint;
{
    this in footprint && null !in footprint
	&& (next != null ==> (next in footprint 
	&& this !in next.footprint 
	&& next.footprint + {this} == footprint
	))
	&& (next == null ==> footprint == {this})

}

predicate good2()
reads this, next;
{
(next ==null ==> tailContents == [])
	&& (next != null ==> tailContents == [next.data] + next.tailContents)
}

constructor init(d:Data) 
modifies this;
ensures Valid();
ensures data == d;
ensures next == null;
ensures footprint == {this};
ensures tailContents == [];
ensures fresh(footprint - {this});
{
    data := d;
	next := null;
    tailContents := [];
	footprint := {this};
}

}  

function getFtprint(nd:INode): set<INode>
reads nd;
{
if nd == null then {} else nd.footprint
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

lemma allValidLemma(myNode:INode)
requires myNode != null && myNode.Valid();
requires myNode.next != null ==> myNode.next.Valid();
decreases myNode.footprint;
ensures forall nd :: nd in myNode.footprint ==> nd != null && nd.Valid();
{
assert allV(myNode);
}


predicate seqV(mySeq: seq<INode>)
reads *;
requires forall nd :: nd in mySeq ==> nd != null;
requires forall i :: 1 <= i < |mySeq| ==> mySeq[i-1].next == mySeq[i];
requires mySeq != [] ==> mySeq[0].Valid();

ensures seqV(mySeq);
ensures forall nd :: nd in mySeq ==> nd.Valid(); 
ensures forall i, j :: 0 <= i < j < |mySeq| ==> mySeq[j] in mySeq[i].footprint;
{
mySeq == [] ||
(seqV(mySeq[1..]))
}

predicate seqV2(mySeq: seq<INode>)
reads *;
requires forall nd :: nd in mySeq ==> nd != null;
requires forall i :: 1 <= i < |mySeq| ==> mySeq[i-1].next == mySeq[i];

ensures seqV2(mySeq);
ensures forall i, j :: 0 <= i < j < |mySeq| ==> 
		(mySeq[i].Valid() ==> mySeq[j].Valid()); 
{
mySeq == [] ||
forall i :: 0 <= i < |mySeq| ==> (mySeq[i].Valid() ==> seqV(mySeq[i..]))
}


class INodes {
  var head: INode;

  ghost var contents: seq<Data>;
  ghost var footprint: set<object>;
  ghost var spine: set<INode>;


  predicate valid()
reads this, footprint; 
{
this in footprint 
&& head != null && head in spine 

&& spine <= footprint

&& (forall nd :: nd in spine ==> 
		 nd != null &&
		 nd.footprint <= footprint && nd.Valid())

&& (forall nd :: nd in spine ==> (nd.next != null ==> nd.next in spine))

&& spine == head.footprint

&& contents == head.tailContents 

}

method init()
modifies this;
ensures valid() && fresh(footprint - {this});
ensures |contents| == 0;
ensures head.next == null;
{
head := new INode.init(null);
contents := head.tailContents;

footprint := {this};
footprint := footprint + {head};

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

method getNode(pos:int) returns (nd:INode)
requires 0 <= pos < |contents|;
requires valid();
ensures valid();
ensures nd != null && nd.Valid();
ensures nd.data == contents[pos];
{
var index := 0;
var curNd := head;

while(index <= pos)
invariant 0 <= index <= pos + 1;
invariant curNd != null && curNd.Valid();
invariant index > 0 ==> curNd.data == contents[index-1];
invariant curNd.tailContents == contents[index..];
{
index := index + 1;
curNd := curNd.next;
}

return curNd;
}

/*
method update(pos:int, dat:Data) 
requires valid();
requires 0 <= pos < |contents|;

modifies footprint;
//ensures valid();

{
//assert forall i :: 0 <= i < pos ==> 

var tar := head.getNode(pos+1);
tar.data := dat;

}
*/


/*
method add2End(d:Data)
modifies footprint;
requires valid();
requires d != null;
requires |contents| > 0;
//ensures valid();
//ensures contents == old(contents) + [d];
//ensures fresh(footprint - old(footprint));
{
var newNd := new INode.init(d);

var curNd := head;
ghost var tmpList: seq<INode>;
tmpList := [];

while(curNd.next != null)
decreases curNd.footprint;
invariant curNd != null && curNd.Valid();
invariant forall nd :: nd in tmpList ==> nd != null && nd.Valid() && nd.next != null;
invariant |tmpList| > 0 ==> tmpList[|tmpList|-1].next == curNd;
invariant forall i :: 1 <= i < |tmpList| ==> tmpList[i-1].next == tmpList[i];

invariant (set nd | nd in tmpList) + curNd.footprint == spine;

{
tmpList := tmpList + [curNd];
curNd := curNd.next;
}

tmpList := tmpList + [curNd];
assert curNd == tmpList[|tmpList| - 1];

//assert (set nd | nd in tmpList) == spine;
//assert valid();

curNd.next := newNd;

assert newNd.Valid();

//assert forall i :: 0 <= i < |tmpList| - 1 ==> tmpList[i].next == tmpList[i+1];

ghost var index := |tmpList| - 1;
assert curNd == tmpList[|tmpList| - 1];


while(index >= 0)
invariant -1 <= index <= |tmpList| - 1;

invariant forall nd :: nd in tmpList ==> (nd != null && nd.next != null);

invariant forall i :: 1 <= i < |tmpList| ==> tmpList[i-1].next == tmpList[i];
invariant tmpList[|tmpList| - 1].next == newNd;

invariant index >= 0 ==> tmpList[index].next.Valid();

//invariant forall i :: index < i < |tmpList| ==> 
//		tmpList[i] != null && tmpList[i].Valid();
{
tmpList[index].footprint := {tmpList[index]} + 
			     tmpList[index].next.footprint;
tmpList[index].tailContents := [tmpList[index].next.data] + 
			       tmpList[index].next.tailContents;

assert tmpList[index].Valid();
index := index - 1;
}

//assert forall nd :: nd in tmpList ==> nd != null && nd.Valid();

this.contents := head.tailContents;

this.footprint := this.footprint + {newNd};

this.spine := this.spine + {newNd};

}
*/

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
newHead.tailContents := [d] + head.tailContents;

head := newHead;

footprint := footprint + {newHead};

contents := head.tailContents;

spine := {head} + spine;

allValidLemma(head);
}


/*
method insert(d:Data, pos:int) 
modifies footprint;
requires valid();
requires d != null;
//requires 0 <= pos <= |contents|;
requires pos == 0;

ensures valid();
ensures |contents| == (|old(contents)| + 1);
ensures fresh(footprint - old(footprint));
{
//assume pos == 0;

var length := this.len();
if (pos == 0) {

add2Front(d);
}

else if (pos == length) {

add2End(d);
}

else {}
}
*/

}
