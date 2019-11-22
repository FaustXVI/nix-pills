with import <nixpkgs> {};
with lib.strings;
with import ./nixUnit.nix;
with builtins;

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
  toRoman = n: if hasAttr "${toString n}" romanDictionary
               then romanDictionary."${toString n}"
               else let
                 keys = sort (a: b: a > b) (map toInt (attrNames romanDictionary));
                 key = head (filter (a: a < n) keys);
               in toRoman key + toRoman (n - key);
in toRoman
