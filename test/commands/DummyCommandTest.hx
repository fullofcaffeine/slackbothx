package test.commands;

import test.support.*;
import commands.DummyCommand;

import tink.await.*;
import tink.CoreApi.Future;

@await class DummyCommandTest {
  @await public static function main() {
    Ava.test('Rollback', @await function(t: T) {
      var command = new DummyCommand('Current Value');
      t.is(command.value, 'Current Value');

      var result = @await command.perform();

      // Converting a js Promise to tink's Future (Haxe's Promise-like API) so that we can use @await
      var resultPromised = @await Future.ofJsPromise(command.performPromised());

      t.isTrue(resultPromised);
      t.isTrue(result);

      t.is(command.value, 'Kawabanga');
    });

    Ava.test('Foobar2', function(t: T) {
      t.isTrue(true);
    });
  }
}
