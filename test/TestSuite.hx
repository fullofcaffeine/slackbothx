package test;

using thx.Arrays;

import test.commands.*;

/*
   This is WIP and needs improvement, but works.

   * A macro could be used to automatically add all classes from the test package in and run them here.
   i.e each test file could be marked with a metadata @test or inherit from some interface to mark it.

   * Also, a custom js generator could also be used to compile these classes to self-contained separate
   js files, to mimic the way AVA is used with JS/TS.

   * OR, Probbly, the best and easiest way is to create a A gulp task can be used to call haxe individual for each class, like:

   haxe -cp js-kit -cp src -cp test -cp hxnodejs/src -lib tink_await -main test.commands.SomeOtherDummyTest -js tests/SomeOtherDummyTest.js

   For each of the test files.

   Right all, the entry point is this suite clas, which is then compiled to dest/tests.js, using the tests.hxml build file.

   `haxe test.hxml && node dest/tests.js` to run the suite.
*/


class TestSuite {
  static var suite:Array<{function main():Void;}> = [
    DummyCommandTest,
    SomeOtherDummyTest
  ];

  public static function main() {
    suite.each(function(klass) {
      klass.main();
    });
  }
}
