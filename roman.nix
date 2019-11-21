with import <nixpkgs> {};
with lib.lists;
with lib.strings;
with import ./nixUnit.nix;
with (builtins);

let
  romanDictionary = {
    "100" = "C";
    "50" = "L";
    "10" = "X";
    "9" = "IX";
    "5" = "V";
    "4" = "IV";
    "1" = "I";
  };
  toRoman = n: if builtins.hasAttr "${toString n}" romanDictionary
               then romanDictionary."${toString n}"
               else let
                 keys = sort (a: b: a > b) (map toInt (attrNames romanDictionary));
                 key = head (filter (a: a < n) keys);
               in toRoman key + toRoman (n - key);
  tests = rec {
    toRomanShould = forEach [
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
    ] ({value, result}: assertEquals (toRoman value) result);
  };
in tests
