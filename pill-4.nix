with import ./nixUnit.nix;
let 
  tests = rec {
    nixShould = {
      sumTwoNumbers = assertEquals (2 + 3) 5;
      divideTwoNumbers = assertEquals (6 / 3) 2;
      strings = {
        foo = "strval";
        insterpolate = assertEquals "${tests.nixShould.strings.foo}" "strval";
      };
      sets = assertEquals { a = 2 + 3;} { a = 5;};
      lets = assertEquals (let a = 4; b = a + 5; in b) 9;
      values = { a = 3; b = 4;};
      withs = assertEquals (with tests.nixShould.values; a) 3;
      laziness = assertEquals (let a = builtins.div 4 0; b = 6; in b) 6;
    };
  };
in tests
