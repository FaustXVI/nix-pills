with import <nixpkgs> {};
with lib.lists;
with import ./nixUnit.nix;
with builtins;

let
  toRoman = import ./roman.nix;
in
  {
    "toRoman should" = forEach [
      {value = 1; result = "I";}
      {value = 5; result = "V";}
      {value = 2; result = "II";}
      {value = 3; result = "III";}
      {value = 6; result = "VI";}
      {value = 10; result = "X";}
      {value = 4; result = "IV";}
      {value = 9; result = "IX";}
      {value = 50; result = "L";}
      {value = 100; result = "C";}
    ] ({value, result}: { 
      "convert ${toString value} to ${result}" = assertEquals (toRoman value) result;
    });
  }

