var of = Application('OmniFocus'),
  ofDoc = of.defaultDocument;

var w = ofDoc.documentWindows()[0];
var contentTree = w.content();

contentTree.selectedTaskStateFilterIdentifier = "incomplete";
