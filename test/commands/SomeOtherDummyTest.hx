package test.commands;

import test.support.*;

class SomeOtherDummyTest {
  public static function main() {
    Ava.test('Foobar', function(t: T) {
      t.is();
    });
    Ava.test('Foobar2', function(t: T) {
      t.isTrue(true);
    });
  }
}
