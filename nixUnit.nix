rec {
  assertTrueWithMessage = value: message: if value then "assertion passed" else builtins.abort message;
  assertTrue = value: assertTrueWithMessage value "${builtins.toJSON value} should be true";
  assertFalse = value: assertTrueWithMessage (!value) "${builtins.toJSON value} should be false";
  assertEquals = a: b: assertTrueWithMessage (a == b) "${builtins.toJSON a} should equal ${builtins.toJSON b}";
}
