with import ./nixUnit.nix;
let 
  double = x: x * 2;
  mul = a: b: a * b;
  setMul = {a ? 2, b, ... }: a * b;
  atPatternMul = s@{a ? 2, b, ... }: a * b * s.c;
  tests = rec {
    nixShould = {
      functionCall = assertEquals (double 4) 8;
      twoParameters = assertEquals (mul 2 3) 6;
      argumentSetParameters = assertEquals (setMul { a = 3; b = 3; }) 9;
      defaultParameters = assertEquals (setMul { b = 3; }) 6;
      variadicParameters = assertEquals (setMul { b = 3; c = 42; }) 6;
      atPatternParameters = assertEquals (atPatternMul { b = 3; c = 10; }) 60;
    };
  };
in tests
