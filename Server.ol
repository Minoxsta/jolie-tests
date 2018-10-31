include "test.iol"
include "time.iol"
include "console.iol"

inputPort In {
Location:
  "socket://localhost:8000"
Protocol: sodep
Interfaces: TestInterface
}

execution {
  concurrent
}

init {
  global.lock = 0;
  global.requests = 0
}

main {
  [get()(num){
    gotLock = false;
    while (!gotLock) {
      synchronized(globallock) { 
        if (global.lock == 0) {
          global.lock = 1;
          global.requests++;
          gotLock = true;
          println@Console("Someone got lock")();
          num = global.requests
        }
      };
      if (!gotLock) {
        sleep@Time(5000)()
      }
    }
  }]
  [release()] {
    synchronized(globallock) {
      if (global.lock == 0) {
        println@Console("This is very awkward")()
      };
      global.lock = 0;
      println@Console("Someone released lock")()
    }
  }
}


