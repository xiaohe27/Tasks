class Data {}
class INode 
{
ghost var tailContents: seq<Data>;
ghost var footprint: set<object>;

var data: Data;
var next: INode;

predicate Valid()
reads this, footprint;
{
    this in footprint 
	&& (next != null ==> (next in footprint 
	&& this !in next.footprint 
	&& next.footprint + {this} == footprint
//	&& next.Valid() 
	))
	&& (next ==null ==> tailContents == [] && footprint == {this})
	&& (next != null ==> tailContents == [next.data] + next.tailContents)
}

constructor init(d:Data) 
modifies this;
ensures Valid();
ensures data == d;
ensures next == null;
ensures footprint == {this};
ensures fresh(footprint - {this});
{
    data := d;
	next := null;
    tailContents := [];
	footprint := {this};
}

}  



class INodes {
  var head: INode;

  ghost var contents: seq<Data>;
  ghost var footprint: set<object>;
  ghost var spine: set<INode>;



  predicate valid()
reads this, footprint; 
{
this in footprint && spine <= footprint

&& head != null && head in spine 
&& head.data == null
&& head.footprint == spine
&&
(forall nd :: nd in spine ==> nd != null &&
nd.footprint <= footprint - {this} && nd.Valid())

&&
(forall nd :: nd in spine ==> (nd.next != null ==> nd.next in spine))

&& contents == head.tailContents 
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
footprint := footprint + {head};
spine := {head};

assert (set nd | nd in spine && nd.next == null ) == {head};
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



method add2End(d:Data)
requires d != null;
requires valid();
requires head.next != null;

modifies footprint;

ensures valid();
ensures fresh(footprint - old(footprint));
ensures contents == old(contents) + [d];
{
var newNd := new INode.init(d);

var curNd := head;
ghost var tmpList: seq<INode>;
tmpList := [];

while(curNd.next != null)
decreases curNd.footprint;
invariant curNd != null && curNd.Valid();
invariant curNd in spine;
invariant forall i :: 0 <= i < |tmpList| ==> tmpList[i] != null && tmpList[i].Valid() && tmpList[i].next != null;
invariant (set nd | nd in tmpList) + curNd.footprint == spine;
{
tmpList := tmpList + [curNd];
curNd := curNd.next;
}

curNd.next := newNd;

forall(nd | nd in spine) 
{
nd.tailContents := nd.tailContents + [d];
}

this.contents := head.tailContents;

forall(nd | nd in spine) {
nd.footprint := nd.footprint + {newNd};
}

this.footprint := this.footprint + {newNd};

this.spine := this.spine + {newNd};

/*
assert (forall nd :: nd in spine ==> nd != null);
assert (forall nd :: nd in spine ==> nd in nd.footprint);
assert (forall nd :: nd in spine ==> (nd.next != null ==> (nd.next in nd.footprint )));
assert (forall nd :: nd in spine ==> (nd.next != null ==> (nd !in nd.next.footprint 
	&& nd.next.footprint + {nd} == nd.footprint) ));
//assert forall nd :: nd in spine ==> (nd != null && nd.Valid());
*/
}




/*
method add2Front(d:Data)
modifies footprint, spine;
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

spine := spine + {head};

contents := head.tailContents;
}

*/

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