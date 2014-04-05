var pushRight = slate.operation("push", {
  "direction": "right",
  "style": "bar-resize:screenSizeX/2"
});

var pushLeft = slate.operation("push", {
  "direction": "left",
  "style": "bar-resize:screenSizeX/2"
});

var pushUp = slate.operation("push", {
  "direction": "up",
  "style": "bar-resize:screenSizeY/2"
});

var pushDown = slate.operation("push", {
  "direction": "down",
  "style": "bar-resize:screenSizeY/2"
});

var throwNextLeft = slate.operation("throw", {
  "width": "screenSizeX/2",
  "height": "screenSizeY",
  "screen": "next"
});

var throwNextRight = slate.operation("throw", {
  "x": "screenOriginX+(screenSizeX)/2",
  "y": "screenOriginY",
  "width": "screenSizeX/2",
  "height": "screenSizeY",
  "screen": "next"
});

var fullscreen = slate.operation("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var throwNextFullscreen = slate.operation("throw", {
  "x": "screenOriginX",
  "y": "screenOriginY",
  "width": "screenSizeX",
  "height": "screenSizeY",
  "screen": "next"
});

var throwNext = function(win) {
  if (!win) {
    return;
  }
  var winRect = win.rect();
  var screen = win.screen().visibleRect();

  var newX = (winRect.x - screen.x)/screen.width+"*screenSizeX+screenOriginX";
  var newY = (winRect.y - screen.y)/screen.height+"*screenSizeY+screenOriginY";
  var newWidth = winRect.width/screen.width+"*screenSizeX";
  var newHeight = winRect.height/screen.height+"*screenSizeY";
  var throwNext = slate.operation("throw", {
    "x": newX,
    "y": newY,
    "width": newWidth,
    "height": newHeight,
    "screen": "next"
  });
  win.doOperation(throwNext);
};

var pushedLeft = function(win) {
  if (!win) {
    return false;
  }
  var winRect = win.rect();
  var screen = win.screen().visibleRect();

  if (winRect.x === screen.x &&
      winRect.y === screen.y &&
      winRect.width === screen.width/2 &&
      winRect.height === screen.height
    ) {
    return true;
  }
  return false;
};

var pushedRight = function(win) {
  if (!win) {
    return false;
  }
  var winRect = win.rect();
  var screen = win.screen().visibleRect();

  if (winRect.x === screen.x + screen.width/2 &&
      winRect.y === screen.y &&
      winRect.width === screen.width/2 &&
      winRect.height === screen.height
    ) {
    return true;
  }
  return false;
};

var isFullscreen = function(win) {
  if (!win) {
    return false;
  }
  var winRect = win.rect();
  var screen = win.screen().visibleRect();
  if (winRect.width === screen.width &&
      winRect.height === screen.height
    ) {
    return true;
  }
  return false;
};

var pushQuarter = function(direction) {
  return slate.operation("corner", {
    "direction": direction,
    "width": "screenSizeX/2",
    "height": "screenSizeY/2"
  });
}

_.each(["top-left", "top-right", "bottom-left", "bottom-right"], function(dir, i){
  slate.bind(i+1+":ctrl,alt,cmd", function(win) {
    win.doOperation(pushQuarter(dir));
  });
});

slate.bind("c:ctrl,alt,cmd", function(win) {
  win.doOperation(slate.operation("move", {
    "x": "screenOriginX+screenSizeX/2-windowSizeX/2",
    "y": "screenOriginY+screenSizeY/2-windowSizeY/2",
    "width": "windowSizeX",
    "height": "windowSizeY"
  }));
});

slate.bind("left:ctrl,alt,cmd", function(win) {
  if (!win) {
    return;
  }
  if (pushedLeft(win)) {
    win.doOperation(throwNextLeft);
  } else {
    win.doOperation(pushLeft);
  }
});

slate.bind("right:ctrl,alt,cmd", function(win) {
  if (!win) {
    return;
  }

  if (pushedRight(win)) {
    win.doOperation(throwNextRight);
  } else {
    win.doOperation(pushRight);
  }
});

slate.bind("m:ctrl,alt,cmd", function(win) {
  if (!win) {
    return;
  }

  win.doOperation(fullscreen);
});

slate.bind("n:ctrl,alt,cmd", function(win) {
  if (!win) {
    return;
  }

  if (pushedLeft(win)) {
    win.doOperation(throwNextLeft);
  } else if (pushedRight(win)) {
    win.doOperation(throwNextRight);
  } else if (isFullscreen(win)) {
    win.doOperation(throwNextFullscreen);
  } else {
    throwNext(win);
  }
});

slate.bind("up:ctrl,alt,cmd", function(win) {
  win.doOperation(pushUp);
});

slate.bind("down:ctrl,alt,cmd", function(win) {
  win.doOperation(pushDown);
});

var handleSnapshot = function(op, name) {
  return slate.operation(op, {
    "name"  : name,
    "save"  : true,
    "delete": false
  });
};

slate.bind("f1:ctrl,alt", function(win) {
  win.doOperation(handleSnapshot("snapshot", "home"));
});

slate.bind("f1:ctrl,alt,shift", function(win) {
  win.doOperation(handleSnapshot("activate-snapshot", "home"));
});

slate.bind("f2:ctrl,alt", function(win) {
  win.doOperation(handleSnapshot("snapshot", "office"));
});

slate.bind("f2:ctrl,alt,shift", function(win) {
  win.doOperation(handleSnapshot("activate-snapshot", "office"));
});
