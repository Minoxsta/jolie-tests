type MyType: void {
  .a: int
  .b: int
}

interface TestInterface {
  OneWay:
    release(void)
  RequestResponse:
    get(void)(int),
    divide(MyType)(int) throws DivisionByZero(void)
}


