include "console.iol"
include "test.iol"

inputPort In {
Location:
  "socket://localhost:8000"
Protocol: sodep
Interfaces: TestInterface
}

execution { concurrent }

main {
  [divide(x)(num) {
    if (x.b == 0) { throw(DivisionByZero) }
    else { num = x.a/x.b }
  }]
}
