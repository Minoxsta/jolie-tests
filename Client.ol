include "console.iol"
include "test.iol"

outputPort Out {
Location:
  "socket://localhost:8000"
Protocol: sodep
Interfaces: TestInterface
}

main {
  get@Out()(num);
  println@Console("GOT'EM: " + num)();
  release@Out()
}
