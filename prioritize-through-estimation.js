var of = Application('OmniFocus'),
  ofDoc = of.defaultDocument;

var pName = "Today";
var w = ofDoc.documentWindows()[0];

// swap perspective
w.perspectiveName = pName;

// get tree
var orderMap = {};
var taskMap = {};

var contentTree = w.content();
var trees = contentTree.trees();
var selectedTrees = contentTree.selectedTrees();

for (var i = 0, len = trees.length; i < len; i++) {
  var task = trees[i].value();
  orderMap[i] = task.id();
  taskMap[task.id()] = task;
}


console.log(JSON.stringify(orderMap));
function freeze() {
  console.log("Freezing...");
  console.log(JSON.stringify(orderMap));

  for (var key in orderMap) {
    if (orderMap.hasOwnProperty(key)) {
      var taskID = orderMap[key];
      var task = taskMap[taskID];

      console.log("Setting " + task.id() + " to " + key + ". Was " + task.estimatedMinutes() + " previously.")

      if (task.estimatedMinutes() != key) {
        task.estimatedMinutes = key;
      }
    }
  }
}

function up() {
  for (var key in orderMap) {
    if (orderMap.hasOwnProperty(key)) {
      console.log(key + " -> " + orderMap[key]);

      var key = parseInt(key);
      var taskID = orderMap[key];

      if (taskID == selectedTrees[0].id()) {
        var oldID = taskID;
        var oldTask = taskMap[oldID];

        console.log("Found task: " + oldTask.name());

        // we can't move 0 index up, so no swap necessary
        if (key <= 0) {
          return
        }

        // swap
        orderMap[key] = orderMap[key - 1];
        orderMap[key - 1] = oldID;
        return
      }
    }
  }
}

function down() {
  for (var key in orderMap) {
    if (orderMap.hasOwnProperty(key)) {
      console.log(key + " -> " + orderMap[key]);
      var key = parseInt(key);
      var taskID = orderMap[key];

      if (taskID == selectedTrees[0].id()) {
        var oldID = taskID;
        var oldTask = taskMap[oldID];

        console.log("Found task: " + oldTask.name());

        // we can't move 0 index up, so no swap necessary
        console.log("---> " + Object.keys(orderMap).length);
        if (key >= (Object.keys(orderMap).length) - 1) {
          return
        }

        // swap
        orderMap[key] = orderMap[key + 1];
        orderMap[key + 1] = oldID;
        return
      }
    }
  }
}

down();
freeze();
