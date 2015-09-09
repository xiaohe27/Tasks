module Helpers {

class Data {}
class INode 
{
ghost var contents: seq<Data>;
ghost var footprint: set<object>;

var data: Data;
var next: INode;
var prev: INode;
var length: int;

function Valid() : bool
reads this, footprint;
{
       this in footprint 
	&& null !in footprint

	&&	(next != null ==> (
	   next in this.footprint 
    && this == next.prev
	&& this !in next.footprint && next.footprint < footprint
	&& next.Valid() 
	&& this.length == next.length + 1
	))

	&& length >= 0
	&& (length == 0 ==> (this.data == null && this.next == null && this.prev == null
	&& footprint == {this} && this.contents == [])) //empty list

	&& (length == 1 ==> (this.next == null) && contents == [data])
	&& (length > 1 ==> (this.next != null) && contents == [data] + next.contents)
	&& length == |contents|
	
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
	prev := null;
    contents := [];
	footprint := {this};
	length := 0;
}


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
this.prev := node;
node.length := this.length + 1;

node.footprint := node.footprint + this.footprint;
node.contents := [d] + this.contents;
}
}



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
next.prev := this;
this.footprint := this.footprint + next.footprint;
}
}


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


/*
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
if(this.next != null) {
this.next.prev := tmpHead;
}

tmpHead.length := this.length;
tmpHead.footprint := tmpHead.footprint + this.footprint - {this};
tmpHead.contents := this.contents;

assert tmpHead.Valid();
this.data := d;
this.next := tmpHead;
tmpHead.prev := this;
this.length := this.next.length + 1;
this.footprint := this.footprint + tmpHead.footprint;
this.contents := [d] + this.contents;
}
}

else if (pos == this.length) {
this.append(d);
} 

else {
var index := 0;
var curNd := this;

while(index < pos - 1 && curNd.next != null)  //index < pos - 1 //curNd.next != null
decreases this.length - index;
invariant 0 <= index <= pos - 1 < this.length - 1;
invariant curNd != null && curNd.Valid();
invariant index + curNd.length == this.length;
invariant curNd.next != null;
invariant curNd.footprint <= footprint;
invariant index == pos - 1 ==> true;
{
if(index == pos - 1)
{break;}

index := index + 1;
curNd := curNd.next;
}

var newNd := new INode.init();
newNd.data := d;
newNd.length := 1;
newNd.contents := [d];

newNd.next := curNd.next;
curNd.next.prev := newNd;
newNd.length := newNd.length + newNd.next.length;
newNd.footprint := newNd.footprint + newNd.next.footprint;
newNd.contents := newNd.contents + newNd.next.contents;

assert newNd.Valid();
newNd.prev := curNd;

curNd := newNd;

while(curNd != null)
decreases this.footprint - curNd.footprint;
invariant curNd.Valid();
{
if(curNd.prev != null)
{
curNd.prev.next := curNd;
}
}


}


}
*/

}

}