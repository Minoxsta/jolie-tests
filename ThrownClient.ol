include "console.iol"
include "test.iol"

outputPort Out{
Location:
  "socket://localhost:8000"
Protocol: sodep
Interfaces: TestInterface
}

main {
  println@Console("Test")();
  x.a = 4;
  x.b = 0;
  divide@Out(x)(res);
  println@Console(res)()
}
