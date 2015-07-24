class Data {}
class INode 
{
ghost var contents: seq<Data>;
ghost var footprint: set<INode>;

var data: Data;
var next: INode;
var length: int;

function Valid0() : bool
reads this, footprint;
{
       this in footprint 
	&& null !in footprint

	&&	(next != null ==> (next in this.footprint 
	&& this !in next.footprint && footprint == next.footprint + {this}
	&& this.length == next.length + 1
	))

	&& length >= 0 
	&& (length == 0 ==> (this.data == null && this.next == null && this.contents == [])) //empty list
	&& (length == 1 ==> (this.next == null) && contents == [data])
	&& (length > 1 ==> (this.next != null) && contents == [data] + next.contents)
	&& length == |contents|
	
}

function Valid(): bool
reads this, footprint;
{
  Valid0() && (next != null ==> next.Valid())
}

constructor init() 
modifies this;
ensures Valid();
ensures data == null;
ensures next == null;
ensures fresh(footprint - {this});
{
    data := null;
	next := null;
    contents := [];
	footprint := {this};
	length := 0;
}

/*
method preAppend(d:Data) returns (node:INode)
modifies footprint;

requires Valid();
ensures node != null && node.Valid() && node.data == d ;
ensures old(length) == 0 ==> node == this;
ensures old(length) > 0 ==> (node.next == this);
{
if (this.length == 0)
{
this.data := d;
this.length := 1;

this.contents := [d];
return this;
}

else {
node := new INode.init();
node.data := d;
node.next := this;
node.length := this.length + 1;

node.footprint := node.footprint + this.footprint;
node.contents := [d] + this.contents;
}
}

*/

method append(d:Data)
requires Valid();
modifies footprint;
decreases footprint;
ensures Valid();
ensures (contents == old(contents) + [d]);
ensures (old(length) == 0) ==> this.data == d;
ensures (old(length) > 0) ==> this.data == old(this.data);
ensures fresh(footprint - old(footprint));
{
assert this in footprint;
if(length == 0) 
{
this.data := d;
this.length := 1;

contents := contents + [d];
}

else {
if(next == null)
{
var node := new INode.init();
node.data := d;
node.length := 1;
node.contents := [d];

next := node;
this.contents := this.contents + [d];
}

else
 {
next.append(d);
this.contents := [this.data] + this.next.contents;
}

this.length := this.length + 1;
this.footprint := {this} + next.footprint;
}
}

/*
function method getNode(i:int):INode
requires Valid();
reads this, footprint;
requires 0 <= i < |contents|;

ensures Valid();
ensures getNode(i) != null;
ensures getNode(i).Valid();
ensures getNode(i) in footprint;
ensures (i == 0 ==> getNode(i) == this);
ensures (i > 0 ==> getNode(i).contents == contents[i..]);
{
if(i == 0) 
then this
else
this.next.getNode(i - 1)
}  
*/


method insert(d:Data, pos:int) 
modifies footprint;
requires Valid();
requires 0 <= pos <= length;

ensures Valid();
ensures pos == 0 ==> contents == [d] + old(contents);
ensures pos == old(|contents|) ==> contents == old(contents) + [d];
ensures 0 < pos < old(|contents|) ==> 
(contents == old(contents[0..pos]) + [d] + old(contents[pos..])); 
ensures fresh(footprint - old(footprint));

{
if (pos == 0) {
if (length == 0) {
this.data := d;
this.length := 1;

this.contents := [d];
}

else 
{
var tmpHead := new INode.init();
tmpHead.data := this.data;
tmpHead.next := this.next;
tmpHead.length := this.length;
tmpHead.footprint := {tmpHead} + this.footprint - {this};
tmpHead.contents := this.contents;

this.data := d;
this.next := tmpHead;
this.length := this.next.length + 1;
this.footprint := this.footprint + tmpHead.footprint;
this.contents := [d] + this.contents;
}
}

else if (pos == this.length) {
this.append(d);
} 

else if (0 < pos < this.length) {
var index := 0;
var curNd := this;

 var tmpList: seq<INode>;
 tmpList := [];

while(index < pos - 1)  //index < pos - 1 //curNd.next != null
//decreases this.length - index;
invariant 0 <= index <= pos - 1 < this.length - 1;
invariant curNd != null && curNd.Valid();
invariant index + curNd.length == this.length;
invariant curNd.next != null;
invariant curNd.footprint <= footprint;
invariant curNd.length + index == this.length;
invariant (set nd | nd in tmpList) + curNd.footprint == this.footprint;
invariant (set nd | nd in tmpList) * curNd.footprint == {};
invariant forall nd :: nd in tmpList ==> nd != null && nd.Valid();
invariant |tmpList| == index;
invariant |tmpList| > 0 ==> tmpList[|tmpList| - 1].next == curNd;
invariant forall i :: 0 <= i < index - 1 ==> (tmpList[i].next == tmpList[i+1]);
{
tmpList := tmpList + [curNd];

index := index + 1;
curNd := curNd.next;
}

tmpList := tmpList + [curNd];

var newNd := new INode.init();
newNd.data := d;
newNd.length := 1;
newNd.contents := [d];

newNd.next := curNd.next;
newNd.length := newNd.length + newNd.next.length;
newNd.footprint := {newNd} + newNd.next.footprint;
newNd.contents := newNd.contents + newNd.next.contents;

curNd.next := newNd;
curNd.length := curNd.length + 1;
curNd.footprint := {curNd} + curNd.next.footprint;
curNd.contents := [curNd.data] + newNd.contents;

assert newNd.Valid();
assert curNd.Valid();
assert tmpList[pos - 1].Valid();
assert index == pos - 1;
assume this in tmpList;

while(index >= 1)
invariant newNd.Valid();
invariant fresh(footprint - old(footprint));
invariant 0 <= index <= pos - 1; 
invariant forall i :: 0 <= i < pos - 1 ==> (tmpList[i].next == tmpList[i+1]);
invariant forall i :: 0 <= i < pos - 1 ==> (tmpList[i] !in tmpList[i+1].footprint);
invariant (set nd | nd in tmpList) + newNd.footprint == this.footprint + {newNd};
invariant forall i :: index <= i < |tmpList| ==> tmpList[i].Valid();
invariant tmpList[index].contents == old(tmpList[index].contents[0..pos-index]) + [d] + old(tmpList[index].contents[pos-index..]);
{
tmpList[index -1 ].length := tmpList[index -1 ].length + 1;
tmpList[index -1 ].footprint := {tmpList[index -1 ]} + tmpList[index].footprint;
tmpList[index -1 ].contents := [tmpList[index -1 ].data] + tmpList[index].contents;

index := index - 1;
}

assert index == 0;
assert forall nd :: nd in tmpList ==> nd.Valid();
assert newNd.Valid();

ghost var tmpSet := set nd | nd in tmpList; 
assert tmpSet + newNd.footprint == this.footprint + {newNd};

assert forall nd :: nd in tmpList ==> nd.Valid();
assert newNd.Valid();
assert this.Valid();
}


}


}


