module Helpers {

class Data {}
class INode 
{
ghost var contents: seq<Data>;
ghost var forwardList: set<object>;
ghost var backwardList: set<object>;

var data: Data;
var next: INode;
var prev: INode;
var length: int;

function Valid() : bool
reads this, forwardList, backwardList;
{
 bValid() && fValid()
 && forwardList * backwardList == {this}
}

function bValid() : bool
reads this, backwardList;
{
this in backwardList
&& null !in backwardList

&& (prev != null ==> (
    prev in this.backwardList &&
	this !in prev.backwardList && prev.backwardList < backwardList &&
	this in prev.forwardList &&
		this == prev.next &&
		this in prev.forwardList && prev !in this.forwardList && this.forwardList < prev.forwardList &&
		this.length == prev.length - 1
))

}

function fValid() : bool
reads this, forwardList;
{
       this in forwardList
	&& null !in forwardList 
	
	&&	(next != null ==> (
	   next in this.forwardList 
    && this == next.prev
	&& this !in next.forwardList && next.forwardList < forwardList
    && this in next.backwardList && next !in this.backwardList && this.backwardList < next.backwardList

	&& next.fValid() 
	&& this.length == next.length + 1
	))

	&& length >= 0
	&& (length == 0 ==> (this.data == null && this.next == null && this.prev == null
	&& forwardList == {this} && this.contents == [])) //empty list

	&& (length == 1 ==> (this.next == null) && contents == [data])
	&& (length > 1 ==> (this.next != null) && contents == [data] + next.contents)
	&& length == |contents|
	
}

constructor init() 
modifies this;
ensures Valid();
ensures data == null;
ensures next == null;
ensures fresh(forwardList - {this});
{
    data := null;
	next := null;
	prev := null;
    contents := [];
	forwardList := {this};
	backwardList := {this};
	length := 0;
}

/*
method preAppend(d:Data) returns (node:INode)
modifies forwardList;

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

node.forwardList := node.forwardList + this.forwardList;
node.contents := [d] + this.contents;

this.prev := node;
this.backwardList := this.backwardList + this.prev.backwardList;

ghost var tmpNd := this;
while(tmpNd != null)
invariant tmpNd != null ==> tmpNd.bValid();
{


}

}
}



method append(d:Data)
requires Valid();
modifies forwardList;
decreases forwardList;
ensures Valid();
ensures (contents == old(contents) + [d]);
ensures (old(length) == 0) ==> this.data == d;
ensures (old(length) > 0) ==> this.data == old(this.data);
ensures fresh(forwardList - old(forwardList));
{
assert this in forwardList;
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
this.forwardList := this.forwardList + next.forwardList;
}
}


function method getNode(i:int):INode
requires Valid();
reads this, forwardList;
requires 0 <= i < |contents|;

ensures Valid();
ensures getNode(i) != null;
ensures getNode(i).Valid();
ensures getNode(i) in forwardList;
ensures (i == 0 ==> getNode(i) == this);
ensures (i > 0 ==> getNode(i).contents == contents[i..]);
{
if(i == 0) 
then this
else
this.next.getNode(i - 1)
}  



method insert(d:Data, pos:int) 
modifies forwardList;
requires Valid();
requires 0 <= pos <= length;

ensures Valid();
ensures pos == 0 ==> contents == [d] + old(contents);
ensures pos == old(|contents|) ==> contents == old(contents) + [d];
ensures 0 < pos < old(|contents|) ==> 
(contents == old(contents[0..pos]) + [d] + old(contents[pos..])); 
ensures fresh(forwardList - old(forwardList));

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
tmpHead.forwardList := tmpHead.forwardList + this.forwardList - {this};
tmpHead.contents := this.contents;

assert tmpHead.Valid();
this.data := d;
this.next := tmpHead;
tmpHead.prev := this;
this.length := this.next.length + 1;
this.forwardList := this.forwardList + tmpHead.forwardList;
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
invariant curNd.forwardList <= forwardList;
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
newNd.forwardList := newNd.forwardList + newNd.next.forwardList;
newNd.contents := newNd.contents + newNd.next.contents;

assert newNd.Valid();
newNd.prev := curNd;

curNd := newNd;

while(curNd != null)
decreases this.forwardList - curNd.forwardList;
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